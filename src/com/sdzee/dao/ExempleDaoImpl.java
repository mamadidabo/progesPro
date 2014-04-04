package com.sdzee.dao;

import static com.sdzee.dao.DAOUtilitaire.fermeturesSilencieuses;
import static com.sdzee.dao.DAOUtilitaire.initialisationRequetePreparee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sdzee.beans.Exemple;
public class ExempleDaoImpl implements ExempleDao{

	private static final String SQL_SELECT        = "SELECT idExemple, nomExemple, codeExemple, proprietaire FROM Exemple ORDER BY id";
	private static final String SQL_SELECT_PAR_ID = "SELECT idExemple, nomExemple, codeExemple, proprietaire FROM Exemple WHERE idExemple = ?";
	private static final String SQL_SELECT_PAR_PROP = "SELECT idExemple, nomExemple, codeExemple, proprietaire FROM Exemple WHERE proprietaire = ?";
	private static final String SQL_SAVE_AS        = "INSERT INTO Exemple (nomExemple, codeExemple, proprietaire) VALUES ( ?, ?, ?)";
	private static final String SQL_SAVE          = "UPDATE EXEMPLE  SET nomExemple = ?, codeExemple = ?, proprietaire=?  where idExemple = ?";
	private static final String SQL_DELETE_PAR_ID = "DELETE FROM Exemple WHERE id = ?";

	private DAOFactory daoFactory;

	ExempleDaoImpl( DAOFactory daoFactory ) {
		this.daoFactory = daoFactory;
	}

	@Override
	public void enregistrerExemple(Long idExemple, Exemple exemple) throws Exception, DAOException {
		// TODO Auto-generated method stub
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = initialisationRequetePreparee( connexion, SQL_SAVE, true, exemple.getNomExemple(), exemple.getCodeExemple(), exemple.getProprietaire(), idExemple );
			int statut = preparedStatement.executeUpdate();
			if ( statut == 0 ) {
				throw new DAOException( "Échec de la création de l'exemple, aucune ligne modifiee dans la table." );
			}

		} catch ( SQLException e ) {
			throw new DAOException( e );
		} finally {
			fermeturesSilencieuses( preparedStatement, connexion );
		}
	}

	@Override
	public void enregistrerSousExemple(Exemple exemple) throws Exception,
	DAOException {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet valeursAutoGenerees = null;

		try {
			connexion = daoFactory.getConnection();
			preparedStatement = initialisationRequetePreparee( connexion, SQL_SAVE_AS, true,
					exemple.getNomExemple(), exemple.getCodeExemple(), exemple.getProprietaire() );
			int statut = preparedStatement.executeUpdate();
			if ( statut == 0 ) {
				throw new DAOException( "Échec de la création de l'exemple, aucune ligne ajoutée dans la table." );
			}
			valeursAutoGenerees = preparedStatement.getGeneratedKeys();
			if ( valeursAutoGenerees.next() ) {
				exemple.setIdExemple( valeursAutoGenerees.getLong( 1 ) );
			} else {
				throw new DAOException( "Échec de la création de l'exemple en base, aucun ID auto-généré retourné." );
			}
		} catch ( SQLException e ) {
			throw new DAOException( e );
		} finally {
			fermeturesSilencieuses( valeursAutoGenerees, preparedStatement, connexion );
		}
	}

	@Override
	public List<Exemple> listExemple() throws Exception, DAOException {
			Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        ResultSet resultSet = null;
	        List<Exemple> exemples = new ArrayList<Exemple>();

	        try {
	            connection = daoFactory.getConnection();
	            preparedStatement = connection.prepareStatement( SQL_SELECT );
	            resultSet = preparedStatement.executeQuery();
	            while ( resultSet.next() ) {
	                exemples.add( map( resultSet ) );
	            }
	        } catch ( SQLException e ) {
	            throw new DAOException( e );
	        } finally {
	            fermeturesSilencieuses( resultSet, preparedStatement, connection );
	        }

	        return exemples;
	}

	@Override
	public void supprimer(Exemple exemple) throws Exception, DAOException {
			Connection connexion = null;
	        PreparedStatement preparedStatement = null;

	        try {
	            connexion = daoFactory.getConnection();
	            preparedStatement = initialisationRequetePreparee( connexion, SQL_DELETE_PAR_ID, true, exemple.getIdExemple() );
	            int statut = preparedStatement.executeUpdate();
	            if ( statut == 0 ) {
	                throw new DAOException( "Échec de la suppression de l'exemple, aucune ligne supprimée de la table." );
	            } else {
	                exemple.setIdExemple( null );
	            }
	        } catch ( SQLException e ) {
	            throw new DAOException( e );
	        } finally {
	            fermeturesSilencieuses( preparedStatement, connexion );
	        }

	}

	@Override
	public Exemple trouverID(Long id) throws DAOException, Exception {
		return trouver( SQL_SELECT_PAR_ID , id);

	}

	@Override
	public Exemple trouverProprietaire(Long proprietaire) throws DAOException, Exception {
		return trouver( SQL_SELECT_PAR_PROP, proprietaire);
	}

	private Exemple trouver( String sql, Object... objets ) throws Exception {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Exemple exemple = null;

		try {
			connexion = daoFactory.getConnection();
			preparedStatement = initialisationRequetePreparee( connexion, sql, false, objets );
			resultSet = preparedStatement.executeQuery();
			if ( resultSet.next() ) {
				exemple = map( resultSet );
			}
		} catch ( SQLException e ) {
			throw new DAOException( e );
		} finally {
			fermeturesSilencieuses( resultSet, preparedStatement, connexion );
		}

		return exemple;
	}

	private Exemple map( ResultSet resultSet ) throws DAOException, Exception {
		Exemple exemple = new Exemple();
		exemple.setIdExemple(resultSet.getLong("idExemple"));
		exemple.setNomExemple(resultSet.getString("nomExemple"));
		exemple.setCodeExemple(resultSet.getString("codeExemple"));
		UtilisateurDao proprietaire = daoFactory.getUtilisateurDao();
		exemple.setProprietaire(proprietaire.trouverUtilisateur(resultSet.getLong("id_utilisateur")));;
		return exemple;
	}
}
