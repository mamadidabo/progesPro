package com.sdzee.dao;
import java.util.List;

import com.sdzee.beans.Exemple;

public interface ExempleDao {
    void enregistrerExemple( Long idExemple, Exemple exemple) throws Exception ,DAOException;
    void enregistrerSousExemple( Exemple exemple ) throws Exception ,DAOException;
    List<Exemple> listExemple () throws Exception, DAOException;
    void supprimer (Exemple exemple) throws Exception, DAOException;
    Exemple trouverID(Long id) throws DAOException, Exception;
    Exemple trouverProprietaire(Long proprietaire) throws DAOException, Exception;
}
