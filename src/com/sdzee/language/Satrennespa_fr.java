package com.sdzee.language;

import java.util.ListResourceBundle;

public class Satrennespa_fr extends ListResourceBundle{
	public Object[][] getContents() {
		return contents;
	}

	static final Object[][] contents = {
		{"index.menu.titre1","Nouveau problème"},
		{"index.menu.titre2","Exemples"},
		{"index.menu.titre2.soustitre1", "Carr&eacute Latin 3x3"},
		{"index.menu.titre2.soustitre2", "Sudoku 2x2"},
		{"index.menu.titre2.soustitre3", "Sudoku 4x4"},
		{"index.menu.titre2.soustitre4", "Sudoku 9x9"},
		{"index.menu.titre2.soustitre5", "Mouton/Loup/Chou"},
		{"index.menu.titre2.soustitre6", "Coloriage de Cartes"},
		{"index.menu.titre2.soustitre7", "Emploi du Temps"},
		{"index.menu.titre2.soustitre8", "Somme"},
		{"index.menu.titre2.soustitre9", "Les 8 Dames"},
		{"index.menu.titre2.soustitre10", "Les 6 Boules"},
		{"index.menu.titre3","Aide"},
		{"index.menu.titre4","Langage"},
		{"index.menu2.titre1","Fonctions de base"},
		{"index.menu2.titre2","Pays"},
		{"index.menu2.titre3","Couleurs"},
		{"index.menu2.titre4","Calendrier"},
		{"index.menu2.titre5","Divers"},
		{"index.boutonok","Vérifier si l'ensemble des formules est satisfiable"},
		{"index.boutonNouvelleFormule","Ajout d'une nouvelle formule"},
		{"inscription.titre","Inscription"},
		{"inscription.soustitre","Vous pouvez vous inscrire via ce formulaire."},
		{"inscription.email","Adresse email"},
		{"inscription.mdp","Mot de passe"},
		{"inscription.confirmmdp","Confirmation du mot de passe"},
		{"inscription.nomUser","Nom d'utilisateur"},
		{"inscription.prenomUser","Prénom d'utilisateur"},
		{"result.satisfiable","La formule est satisfiable, voici une solution :"},
		{"result.nonsatisfiable","La formule n'est pas satisfiable !"},
		{"result.pbsolveur","Probleme de solveur, veuillez recharger la page"},
		{"result.pbvariable","Probleme avec la variable nbInput qui vaut"},
		{"infos.intro","Le but de cet outil est d'introduire le problème de satisfiabilité avec un outil convivial. Le but est aussi de montrer que le problème de satisfiabilité des formules propositionnelles résolvent les problèmes comme un sudoku, de planification etc..."},
		{"infos.aide","Aide!"},
		{"infos.synthaxique1","Quelle est la syntaxe des formules de SATRennesPa ?"},
		{"infos.synthaxique2","La syntaxe des formules reconnues pas SATRennesPa est proche des s-expression du langage Scheme. Voici la grammaire formelle :"},
		{"infos.exemple","Exemples de formules correctes:"},
		{"infos.badexemple","Formules non correctes:"},
		{"infos.history0","Historique de l'outil:"},
		{"infos.history1","Voici quelques informations sur l'histoire de cet outil. Ce projet vient de SAToulouse qui était un outil développé en JAVA. L'outil qui a inspiré SATRennesPa est toujours disponible ici:"},
		{"infos.history2",". Il ya aussi une publication sur ce logiciel:"},
		{"infos.history3","L'outil en ligne SATRennesPa a ensuite été adapté au web par deux étudiants en 3ème année de Licence MIAGE à Rennes: "},
		{"infos.history4","et"},
		{"infos.history5"," sous la supervision de Sophie Pinchinat et François Schwarzentruber."},
		{"infos.back","Retour &agrave; l'accueil!"},
		{"index.menu.inscription","inscription"},
		{"index.menu.connect","connection"},
		{"index.menu.titre2.mdp","Mdp"}	
	};
}
