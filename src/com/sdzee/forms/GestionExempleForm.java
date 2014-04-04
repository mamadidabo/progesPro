package com.sdzee.forms;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sdzee.beans.Exemple;
import com.sdzee.beans.Utilisateur;
import com.sdzee.dao.ExempleDao;

public final class GestionExempleForm {
    private static final String CHAMP_NOM_EXEMPLE     = "nomExemple";
    private static final String CHAMP_CODE_EXEMPLE    = "codeExemple";
    private static final String CHAMP_PROPRIETAIRE     = "proprietaire";
    public static final String ATT_SESSION_USER = "sessionUtilisateur";

    private String              resultat;
    private Map<String, String> erreurs                = new HashMap<String, String>();
    private ExempleDao           exempleDao;
    public GestionExempleForm( ExempleDao exempleDao) {
        this.exempleDao = exempleDao;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }

    public String getResultat() {
        return resultat;
    }

    public Exemple creerExemple ( HttpServletRequest request) throws Exception {
		String nomExemple = getValeurChamp(request, CHAMP_NOM_EXEMPLE);
    	String codeExemple = getValeurChamp(request, CHAMP_CODE_EXEMPLE);
    	Utilisateur proprietaire = new Utilisateur();
    	
    	
        String choixNouveauClient = getValeurChamp( request, CHAMP_PROPRIETAIRE );

            Long id = null;
            try {
                id = Long.parseLong( choixNouveauClient );
            } catch ( NumberFormatException e ) {
                setErreur( CHAMP_PROPRIETAIRE, "Vous n'êtes pas connecté." );
                id = 0L;
            }
            /* Récupération de l'objet client correspondant dans la session */
            HttpSession session = request.getSession();
            proprietaire = ( (Map<Long, Utilisateur>) session.getAttribute( ATT_SESSION_USER ) ).get( id );
    	
    	
    	
    	
    	Exemple exemple = new Exemple();
        try {
        	traiterNomExemple(nomExemple, exemple);
        	traiterCodeExemple(codeExemple, exemple);
        	traiterProprietaire(proprietaire, exemple);
        if ( erreurs.isEmpty() ) {
            exempleDao.enregistrerSousExemple(exemple);
            resultat = "Succès de l'enregistrement de l'exemple.";
        } else {
            resultat = "Échec de l'enregistrement de l'exemple.";
        }
        
        } catch ( Exception e ) {
            setErreur( "Imprevue", "Erreur imprévue lors de la création." );
            resultat = "Échec de l'enregistrement de l'exemple : une erreur imprévue est survenue, merci de réessayer dans quelques instants.";
            e.printStackTrace();
        }

        
    	return exemple;
    }
    
    
    private void traiterCodeExemple( String codeExemple, Exemple exemple ) {
        try {
        	validationCodeExemple( codeExemple );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_CODE_EXEMPLE, e.getMessage() );
        }
        exemple.setCodeExemple(codeExemple);
    }
    
    private void traiterNomExemple( String nomExemple, Exemple exemple ) {
        try {
        	validationNomExemple( nomExemple );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_NOM_EXEMPLE, e.getMessage() );
        }
        exemple.setNomExemple(nomExemple);
    }

    private void traiterProprietaire( Utilisateur proprietaire, Exemple exemple ) {
        try {
        	validationProprietaire(proprietaire);
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_PROPRIETAIRE, e.getMessage() );
        }
        exemple.setProprietaire(proprietaire);;
    }

   
    
    private void validationCodeExemple( String codeExemple ) throws FormValidationException {
        if ( codeExemple != null ) {
            throw new FormValidationException( "Formulaire vide" );
        }
    }
    
    private void validationNomExemple( String nomExemple ) throws FormValidationException {
        if ( nomExemple != null ) {
          
            throw new FormValidationException( "Merci d'entrer un nom pour l'exemple." );
        }
    }
    
    private void validationProprietaire( Utilisateur proprietaire ) throws FormValidationException {
        if ( proprietaire != null ) {  
            throw new FormValidationException( "Vous n'êtes pas connecté." );
        }
    }
    


    /*
     * Ajoute un message correspondant au champ spécifié à la map des erreurs.
     */
    private void setErreur( String champ, String message ) {
        erreurs.put( champ, message );
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