
package com.sdzee.beans;

import com.sun.jmx.snmp.Timestamp;

public class Utilisateur {
	private Long      id;

	//private Timestamp dateInscription;
    private String email="";
    private String motDePasse="";
    private String nom="";
    private String prenom="";
  
    
    
    
   
    public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	
	public void setEmail(String email) {
    this.email = email;
    }
    public String getEmail() {
    return email;
    }
    public void setMotDePasse(String motDePasse) {
    this.motDePasse = motDePasse;
    }
    public String getMotDePasse() {
    return motDePasse;
    }
    public void setNom(String nom) {
    this.nom = nom;
    }
    public String getNom() {
    return nom;
    }
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	/*public Timestamp getDateInscription() {
		return dateInscription;
	}
	public void setDateInscription(Timestamp dateInscription) {
		this.dateInscription =dateInscription ;
	}
	public void setDateInscription(java.sql.Timestamp timestamp) {
		// TODO Auto-generated method stub
		
	}*/
	

}
