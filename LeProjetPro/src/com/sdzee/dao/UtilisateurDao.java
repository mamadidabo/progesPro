package com.sdzee.dao;

import com.sdzee.beans.Utilisateur;
public interface UtilisateurDao {
    void creer( Utilisateur utilisateur ) throws DAOException;
    Utilisateur trouver( String pseudo ) throws DAOException;  
   }