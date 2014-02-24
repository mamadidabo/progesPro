
package com.sdzee.forms;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.jasypt.util.password.ConfigurablePasswordEncryptor;

import com.sdzee.beans.Utilisateur;
import com.sdzee.dao.DAOException;
import com.sdzee.dao.DAOFactory;
import com.sdzee.dao.UtilisateurDao;
import com.sdzee.dao.UtilisateurDaoImpl;



public final class ConnexionForm {
	 private static final String CHAMP_EMAIL  = "email";
	    private static final String CHAMP_PASS   = "motdepasse";
	   // DAOFactory daofactory;
    private static final String ALGO_CHIFFREMENT = "SHA-256";
    private String resultat;
    private Map<String, String> erreurs = new HashMap<String, String>();

    public String getResultat() {
        return resultat;
    }
   
    public Map<String, String> getErreurs() {
        return erreurs;
    }
    
    private UtilisateurDao utilisateurDao=new UtilisateurDao() {
		
		@Override
		public Utilisateur trouver(String pseudo) throws DAOException {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public void creer(Utilisateur utilisateur) throws DAOException {
			// TODO Auto-generated method stub
			
		}
	};
  public ConnexionForm(  ) {
	 // this.utilisateurDao=new UtilisateurDaoImpl();
    }
    public Utilisateur connecterUtilisateur( HttpServletRequest request ) {
		/* Récupération des champs du formulaire */
		String email = getValeurChamp( request, CHAMP_EMAIL );
		String motDePasse = getValeurChamp( request, CHAMP_PASS );
		Utilisateur utilisateur = new Utilisateur();
			try {
			/**
			 * Utilisation de la bibliothèque Jasypt pour chiffrer le mot de pass éfficacement.
			 *
			 * L'algorithme SHA-256 est ici utilisé, avec par défaut un salage
			 * aléatoire et un grand nombre d'itérations de la fonction de hashage.
			 *
			 * La String retournée est de longueur 56 et contient le hash en Base64.
			 */
			traiterMotsDePasse(motDePasse, utilisateur );
			ConfigurablePasswordEncryptor passwordEncryptor = new ConfigurablePasswordEncryptor();
			passwordEncryptor.setAlgorithm(ALGO_CHIFFREMENT );
			passwordEncryptor.setPlainDigest(false);
			String motDePasseChiffre = passwordEncryptor.encryptPassword(motDePasse);
			utilisateur.setMotDePasse(motDePasseChiffre );

			traiterEmail(email, utilisateur);
			utilisateur.setEmail(email);
			
			if (erreurs.isEmpty() ) {
				System.out.println(email);
				System.out.println(utilisateurDao);
				if(utilisateurDao.trouver(email) != null && utilisateurDao.trouver(motDePasse)!=null)
				resultat = "Connexion Reussie.";
			} else {
				resultat = "Échec de connexion.";
			}
		} catch ( DAOException e ) {
			resultat = "Échec de connexion : une erreur imprévue est survenue, merci de réessayer dans quelques instants.";
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
            /*
             * Utilisation de la bibliothèque Jasypt pour chiffrer le mot de passe
             * efficacement.
             * 
             * L'algorithme SHA-256 est ici utilisé, avec par défaut un salage
             * aléatoire et un grand nombre d'itérations de la fonction de hashage.
             * 
             * La String retournée est de longueur 56 et contient le hash en Base64.
             */
          ConfigurablePasswordEncryptor passwordEncryptor = new ConfigurablePasswordEncryptor();
            passwordEncryptor.setAlgorithm( ALGO_CHIFFREMENT );
            passwordEncryptor.setPlainDigest( false );
            String motDePasseChiffre = passwordEncryptor.encryptPassword( motDePasse );
            utilisateur.setMotDePasse( motDePasseChiffre );
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
   
