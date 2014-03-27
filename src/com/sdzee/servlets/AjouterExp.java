package com.sdzee.servlets;

import java.awt.List;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;


public class AjouterExp extends HttpServlet{
	  public static final String VUE              = "/index.jsp";
	 String result="";
	 PrintWriter ecrire;
	 String repertoire;
	public static ArrayList<String> lesExemples = new ArrayList<String>(); 
	
	
	public static String[]listIds() {
		ArrayList<String> myEnum = lesExemples;
		int lg = lesExemples.size();
		String[] result = new String[lg];
		for (int i = lg-1; 0 <= i ; i--) {
			result[i] = myEnum.get(i);
		}
		return result;
	}
	
	
	public static boolean trouverNom(String nomFich){
		boolean b=false;
		for(int i=0; i<listIds().length;i++){
			if(listIds()[i].equals(nomFich)){
			b=true;
			}
		}
		
		return b;
		
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException{
		Enumeration<String> NomsParam = request.getParameterNames();
		String retourLine = System.getProperty("line.separator");
		String nomFichier=request.getParameter("nomEx"); 
		
		  String nomParam;
		  try{
//			{ if (trouverNom(nomFichier)){
//				if(JOptionPane.showConfirmDialog(null,
//
//				        "ce fichier exite déja, voulez vous le remplacer!!", "choose one", JOptionPane.YES_NO_OPTION)==JOptionPane.NO_OPTION){;
//				}
//				else{
//				//mettreAjourFich=true;
//				//System.out.println("pppppp"+(mettreAjourFich));
			File  file =new File(nomFichier);
			  lesExemples.add(nomFichier);
				ecrire = new PrintWriter(file );
      
		 Enumeration<String> valeursParam=request.getParameterNames();
		
		while( valeursParam.hasMoreElements()){
			nomParam = (String)NomsParam.nextElement();
		 System.out.println("vvvvvv"+valeursParam.nextElement());
		 if(nomParam.equals("soumettreEx")){ break;}
		 if(nomParam.equals("compteurErreur")){
			 //valeursParam.hasMoreElements();
			 nomParam = (String)NomsParam.nextElement();
		 }
		 result =request.getParameter(nomParam) + retourLine + result ;
			
		
		  ecrire.print(result);
		  System.out.println(result); 
		  ecrire.flush();
		ecrire.close();}
		  
		
//			else {File  file =new File(nomFichier);
//			  lesExemples.add(nomFichier);
//				ecrire = new PrintWriter(file );
//    
//		 Enumeration<String> valeursParam=request.getParameterNames();
//		
//		while( valeursParam.hasMoreElements()){
//			nomParam = (String)NomsParam.nextElement();
//		 System.out.println("vvvvvv"+valeursParam.nextElement());
//		 if(nomParam.equals("soumettreEx")){ break;}
//		 result =request.getParameter(nomParam) + retourLine + result ;
//			}
//		
//		  ecrire.print(result);
//		  System.out.println(result); 
//		  ecrire.flush();
//		ecrire.close();
//			}
//
		}//try
		catch (NullPointerException a)
		{			System.out.println("Erreur : pointeur null");
	}
	catch (IOException a)
	{
			System.out.println("Problème d'IO");
	}
	
		  
		  this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );
	}//ecrire
	

	public static ArrayList<String> getLesExemples() {
		return lesExemples;
	}

	public static void setLesExemples(ArrayList<String> lesExemples) {
		AjouterExp.lesExemples = lesExemples;
	}

	

}
