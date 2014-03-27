package com.sdzee.servlets;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.nio.file.Files;
import java.nio.file.Path;
public class VisualiserExp extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static String line="";
	public int compteur=1;
	  public static final String VUE              = "/index.jsp";
	  String resultat="coucou";
	public  static String resultat1="";
public static	String filePath ;
public static	String result="";
public static String[] lavue=AjouterExp.listIds();

public static String maValeur1="";

	public static ArrayList<String> lesLinesFichier(String filePath) {
		 ArrayList<String> lines=new  ArrayList<>();
		 
		 try{
				BufferedReader buff = new BufferedReader(new FileReader(filePath));
			
				try {
				
				while ((line = buff.readLine()) != null) {
					lines.add(line);
				}
				
				} finally {
				// dans tous les cas, on ferme nos flux
				buff.close();
				}
				}  catch (IOException ioe) {
				// erreur de fermeture des flux
				System.out.println("Erreur --" + ioe.toString());
				}
		return lines;
				
	
			
	}
	


	
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException{
		//String nomFichier=request.getParameter("nomEx"); 
		
		 result=request.getParameter("exemple");
		
		 filePath = "C:/Users/mohamed/Desktop/eclipse/"+result ;
	    lesLinesFichier(filePath);
		
		/*String retourLine = System.getProperty("line.separator");	
		 ArrayList<String> lines=new  ArrayList<>();
		try{
		// Création du flux bufférisé sur un FileReader, immédiatement suivi par un 
		// try/finally, ce qui permet de ne fermer le flux QUE s'il le reader
		// est correctement instancié (évite les NullPointerException)
		BufferedReader buff = new BufferedReader(new FileReader(filePath));
		//BufferedReader buff1 = new BufferedReader(new FileReader(filePath));
		 //int j=0;
		 String resultat="";
		Path path = new File(filePath).toPath();
	        List<String> lines = Files.readAllLines(path, Charset.defaultCharset());
	        String[] variables = lines.toArray(new String[lines.size()]);
	        
	        
			
		try {
		
		// Lecture du fichier ligne par ligne. Cette boucle se termine
		// quand la méthode retourne la valeur null.
		while ((line = buff.readLine()) != null) {
			lines.add(line);
			compteur++;
		}
		
		String [] lineparline=lines.toArray(new String[lines.size()]);
		System.out.println("ppppppp"+resultat);
		//BufferedReader buff1 = new BufferedReader(new FileReader(filePath));
		for(int i=0;i<lineparline.length;i++){
			System.out.println(i + " " +lineparline[i]);
	
	
		}
		
		
		} finally {
		// dans tous les cas, on ferme nos flux
		buff.close();
		}
		}  catch (IOException ioe) {
		// erreur de fermeture des flux
		System.out.println("Erreur --" + ioe.toString());
		}
		
		//System.out.println(resultat);
		
		
		*/
	
		this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );
		
	}
	 
}