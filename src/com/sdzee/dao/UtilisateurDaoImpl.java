package com.sdzee.dao;

import static com.sdzee.dao.DAOUtilitaire.fermeturesSilencieuses;
import static com.sdzee.dao.DAOUtilitaire.initialisationRequetePreparee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.sdzee.beans.Utilisateur;
import com.sdzee.forms.SimpleCrypto;

public class UtilisateurDaoImpl implements UtilisateurDao {
    private static final String SQL_SELECT_ID = "SELECT id, email, mot_de_passe, nom,prenom FROM Utilisateur WHERE id = ?";
    private static final String SQL_SELECT_MOT_DE_PASSE = "SELECT id, email, mot_de_passe, nom,prenom FROM Utilisateur WHERE mot_de_passe=?";
    private static final String SQL_SELECT_PAR_EMAIL = "SELECT id, email, mot_de_passe, nom,prenom FROM Utilisateur WHERE email = ? ";
    private static final String SQL_INSERT           = "INSERT INTO Utilisateur (email,mot_de_passe, nom, prenom) VALUES (?, ?, ?,?)";

    private DAOFactory          daoFactory;

    UtilisateurDaoImpl( DAOFactory daoFactory ) {
        this.daoFactory = daoFactory;
    }

    @Override
    public Utilisateur trouver( String email ) throws Exception , DAOException {
        return trouver( SQL_SELECT_PAR_EMAIL , email);
    }
    /* ImplÃ©mentation de la mÃ©thode dÃ©finie dans l'interface UtilisateurDao */
    @Override
    public Utilisateur trouver2( String mot_de_passe ) throws Exception , DAOException   {
        return trouver( SQL_SELECT_MOT_DE_PASSE ,mot_de_passe);
    }
    


    /* ImplÃ©mentation de la mÃ©thode dÃ©finie dans l'interface UtilisateurDao */
    @Override
    public void creer( Utilisateur utilisateur ) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet valeursAutoGenerees = null;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_INSERT, true, utilisateur.getEmail(), utilisateur.getMotDePasse(), utilisateur.getNom(),utilisateur.getPrenom() );
            int statut = preparedStatement.executeUpdate();
            if ( statut == 0 ) {
                throw new DAOException( "Ã‰chec de la crÃ©ation de l'utilisateur, aucune ligne ajoutÃ©e dans la table." );
            }
            valeursAutoGenerees = preparedStatement.getGeneratedKeys();
            if ( valeursAutoGenerees.next() ) {
                utilisateur.setId( valeursAutoGenerees.getLong( 1 ) );
            } else {
                throw new DAOException( "Ã‰chec de la crÃ©ation de l'utilisateur en base, aucun ID auto-gÃ©nÃ©rÃ© retournÃ©." );
            }
        } catch ( SQLException e ) {
            throw new DAOException( e );
        } finally {
            fermeturesSilencieuses( valeursAutoGenerees, preparedStatement, connexion );
        }
    }

    /*
     * MÃ©thode gÃ©nÃ©rique utilisÃ©e pour retourner un utilisateur depuis la base
     * de donnÃ©es, correspondant Ã  la requÃªte SQL donnÃ©e prenant en paramÃ¨tres
     * les objets passÃ©s en argument.
     */
    private Utilisateur trouver( String sql, Object... objets ) throws Exception {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Utilisateur utilisateur = null;

        try {
            /* RÃ©cupÃ©ration d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            /*
             * PrÃ©paration de la requÃªte avec les objets passÃ©s en arguments
             * (ici, uniquement une adresse email) et exÃ©cution.
             */
            preparedStatement = initialisationRequetePreparee( connexion, sql, false, objets );
            resultSet = preparedStatement.executeQuery();
            /* Parcours de la ligne de donnÃ©es retournÃ©e dans le ResultSet */
            if ( resultSet.next() ) {
                utilisateur = map( resultSet );
            }
        } catch ( SQLException e ) {
            throw new DAOException( e );
        } finally {
            fermeturesSilencieuses( resultSet, preparedStatement, connexion );
        }

        return utilisateur;
    }
    
    

    /*
     * Simple mÃ©thode utilitaire permettant de faire la correspondance (le
     * mapping) entre une ligne issue de la table des utilisateurs (un
     * ResultSet) et un bean Utilisateur.
     */
    private static Utilisateur map( ResultSet resultSet ) throws Exception {
    	// String  monMotdePasse;
    	// String mot;
        Utilisateur utilisateur = new Utilisateur();
        utilisateur.setId( resultSet.getLong( "id" ) );
        utilisateur.setEmail( resultSet.getString( "email" ) );
      // mot= resultSet.getString("mot_de_passe");
       
      // System.out.println(mot+"ppp");
      
		// monMotdePasse=SimpleCrypto.decrypt("1234", mot);
		// utilisateur.setMotDePasse( SimpleCrypto.decrypt("1234", resultSet.getString("mot_de_passe")) );
		 //System.out.println(monMotdePasse);

        utilisateur.setPrenom(resultSet.getString("mot_de_passe"));

    		  
        utilisateur.setNom( resultSet.getString( "nom" ) );
        utilisateur.setPrenom(resultSet.getString("prenom"));
        //utilisateur.setDateInscription( resultSet.getTimestamp( "date_inscription" ) );
        return utilisateur;
    }

	@Override
	public Utilisateur trouverUtilisateur(long id) throws Exception {
		// TODO Auto-generated method stub
        return trouver( SQL_SELECT_ID, id );
    }

}
