
package com.sdzee.forms;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.jasypt.util.password.ConfigurablePasswordEncryptor;

import com.sdzee.beans.Utilisateur;
import com.sdzee.dao.DAOException;
import com.sdzee.dao.UtilisateurDao;




public final class ConnexionForm {
	 private static final String CHAMP_EMAIL  = "email";
	    private static final String CHAMP_PASS   = "motdepasse";
	    String monMotdePasse;
    private String resultat;
    private Map<String, String> erreurs = new HashMap<String, String>();

    public String getResultat() {
        return resultat;
    }
   
    public Map<String, String> getErreurs() {
        return erreurs;
    }
    
    private UtilisateurDao utilisateurDao;
  public ConnexionForm( UtilisateurDao utilisateurDao ) {
    	 this.utilisateurDao= utilisateurDao;
    }
    public Utilisateur connecterUtilisateur( HttpServletRequest request ) throws Exception {
		/* Récupération des champs du formulaire */
		String email = getValeurChamp( request, CHAMP_EMAIL );
		String motDePasse = getValeurChamp( request, CHAMP_PASS );
		Utilisateur utilisateur = new Utilisateur();
			try {
				
				traiterEmail(email, utilisateur);
			
				
				  try {
						traiterMotsDePasse( motDePasse, utilisateur );
					} catch (Exception  e) {
						// TODO Auto-generated catch block
						setErreur(CHAMP_PASS,"votre mot de passe est erroné");
						e.printStackTrace();
					}
			
			if (erreurs.isEmpty() ) {
				if(utilisateurDao.trouver(email)!=null && utilisateurDao.trouver2(monMotdePasse)!=null){
				resultat = "Connexion Reussie.";
			 
				}
			
			
			else {
				resultat = "Échec de connexion.";
			} } 
			}
		 catch ( DAOException e ) {
			resultat = "Échec de connexion";
			e.printStackTrace();
		}
		return utilisateur;
	
    }

    
    private void validationMotsDePasse( String motDePasse ) throws FormValidationException {
        if ( motDePasse != null ) {
             if ( motDePasse.length() < 3 ) {
                throw new FormValidationException( "Les mots de passe doivent contenir au moins 3 caractères." );
            }
            
        } else {
            throw new FormValidationException( "Merci de saisir et confirmer votre mot de passe." );}
        }
    
    
    
        private void traiterMotsDePasse( String motDePasse, Utilisateur utilisateur ) {
            try {
                validationMotsDePasse( motDePasse );
            } catch ( FormValidationException e ) {
                setErreur( CHAMP_PASS, e.getMessage() );
  
            }
            try {
        		monMotdePasse=SimpleCrypto.encrypt("1234", motDePasse);
        		utilisateur.setMotDePasse(monMotdePasse);
        		if(utilisateurDao.trouver(motDePasse)!=null){
        			System.out.println("mot de passe incorrecte");
        		}
        		} catch (Exception e) {
        			// TODO Auto-generated catch block
        			e.printStackTrace();
        		} 

            
        	
        }
        
    /*
     * Ajoute un message correspondant au champ spécifié à la map des erreurs.
     */
    private void setErreur( String champ, String message ) {
        erreurs.put( champ, message );
    }
    
    private void traiterEmail( String email, Utilisateur utilisateur ) {
        try {
            validationEmail( email );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_EMAIL, e.getMessage() );
        }
        utilisateur.setEmail( email );
    }
    
    
    /* Validation de l'adresse email */
    private void validationEmail( String email ) throws FormValidationException {
        if ( email != null ) {
            if ( !email.matches( "([^.@]+)(\\.[^.@]+)*@([^.@]+\\.)+([^.@]+)" ) ) {
                throw new FormValidationException( "Merci de saisir une adresse mail valide." );
        }
        }
            else {
            throw new FormValidationException( "Merci de saisir une adresse mail." );
        }
    }
    
    /*
     * Méthode utilitaire qui retourne null si un champ est vide, et son contenu
     * sinon.
     */
    private static String getValeurChamp( HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur;
        }
    }
    
}
   

