package com.sdzee.dao;

import com.sdzee.beans.Utilisateur;
public interface UtilisateurDao {
    void creer( Utilisateur utilisateur ) throws Exception ,DAOException;
    Utilisateur trouver2( String mot_de_passe) throws Exception, DAOException;  
    Utilisateur trouver( String email) throws DAOException, Exception;  
   }