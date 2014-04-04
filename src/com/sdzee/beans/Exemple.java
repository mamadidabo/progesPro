
package com.sdzee.beans;


public class Exemple {
	private Long   idExemple;
    private String nomExemple="";
    private String codeExemple="";
    private Utilisateur proprietaire;
	public Long getIdExemple() {
		return idExemple;
	}
	public void setIdExemple(Long idExemple) {
		this.idExemple = idExemple;
	}
	public String getNomExemple() {
		return nomExemple;
	}
	public void setNomExemple(String nomExemple) {
		this.nomExemple = nomExemple;
	}
	public String getCodeExemple() {
		return codeExemple;
	}
	public void setCodeExemple(String codeExemple) {
		this.codeExemple = codeExemple;
	}
	public Utilisateur getProprietaire() {
		return proprietaire;
	}
	public void setProprietaire(Utilisateur proprietaire) {
		this.proprietaire = proprietaire;
	}
}
