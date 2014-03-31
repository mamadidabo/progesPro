package com.sdzee.language;

import java.util.ListResourceBundle;

public class Satrennespa_en extends ListResourceBundle{

	public Object[][] getContents() {
		return contents;
	}

	static final Object[][] contents = {
		{"index.menu.titre1","File"},
		{"index.menu.titre2","Examples"},
		{"index.menu.titre2.soustitre1", "Latin square 3x3"},
		{"index.menu.titre2.soustitre2", "Sudoku 2x2"},
		{"index.menu.titre2.soustitre3", "Sudoku 4x4"},
		{"index.menu.titre2.soustitre4", "Sudoku 9x9"},
		{"index.menu.titre2.soustitre5", "Sheep/Wolf/Cabbage"},
		{"index.menu.titre2.soustitre6", "Coloring map"},
		{"index.menu.titre2.soustitre7", "Schedule"},
		{"index.menu.titre2.soustitre8", "Sum"},
		{"index.menu.titre2.soustitre9", "8 queens"},
		{"index.menu.titre2.soustitre10", "6 balls"},
		{"index.menu.titre3","Help"},
		{"index.menu.titre4","Language"},
		{"index.menu2.titre1","Basic constructions"},
		{"index.menu2.titre2","Countries"},
		{"index.menu2.titre3","Colors"},
		{"index.menu2.titre4","Calendar"},
		{"index.menu2.titre5","Misc"},
		{"index.boutonok","Test whether the set of formulas is satisfiable"},
		{"index.boutonNouvelleFormule","Add a new formula"},
		{"inscription.titre","Registration"},
		{"inscription.soustitre","You can register via this form."},
		{"inscription.email","Email address"},
		{"inscription.mdp","Password"},
		{"inscription.confirmmdp","Confirm password"},
		{"inscription.nomUser","User name"},
		{"inscription.prenomUser","User first name"},
		{"result.satisfiable","The formula is satisfiable, here is a solution :"},
		{"result.nonsatisfiable","The formula is not satisfiable !"},
		{"result.pbsolveur","Problem solver, please refresh the page"},
		{"result.pbvariable","Problem nbInput with the variable that is"},
		{"infos.intro","The aim of this tool is to introduce the satisfiability problem with a user-friendly tool. The aim is also to show that the satisfiability problem of propositional formulas solves TRUE problems: sudoku, planification, etc..."},
		{"infos.aide","Help!"},
		{"infos.synthaxique1","What is the syntax of the formulas in SATRennesPa ?"},
		{"infos.synthaxique2","The syntax of formulas in SATRennesPa looks like the s-expressions of the language Scheme. Here is the formal grammar:"},
		{"infos.exemple","Examples of well-formed formulas:"},
		{"infos.badexemple","Exemples of no well-formed formulas:"},
		{"infos.history0","History of this tool:"},
		{"infos.history1","Here are some information about the history of this tool. This project comes from SAToulouse which was a tool developped in JAVA. The tool that inspired SATRennesPa is still available here: "},
		{"infos.history2",". There is also a publication about this software:"},
		{"infos.history3","The online tool SATRennesPa was then adapted to the web by two students in 3rd year of Licence MIAGE in Rennes: "},
		{"infos.history4","and"},
		{"infos.history5","under the supervision of Sophie Pinchinat and François Schwarzentruber."},
		{"infos.back","Return to Homepage!"},
		{"index.menu.inscription","Sign in"},
		{"index.menu.connect","Log in"},
		{"index.menu.titre2.mdp","Password"},
		{"index.menu.titre1.soustitre1", "New"},
		{"index.menu.titre1.soustitre2", "Save"},
		{"index.menu.titre1.soustitre3", "Save as"},
		{"index.menu.titre1.soustitre4", "Delete"},
		{"index.menu.titre1.soustitre5", "Submit"},	
		{"infos.return","Return problem"}
	};
}
