package com.sdzee.servlets;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SupprimerEx  extends HttpServlet{
public static String result="";
public static String filePath="";
public static final String VUE              = "/index.jsp";
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException{
		result=request.getParameter("exemple");
		
		 filePath = "C:/Users/mohamed/Desktop/eclipse/"+result;
		 File myfile=new File(filePath);
		 myfile.delete();
		 AjouterExp.getLesExemples().remove(result);
	
	
	 this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );
	}

}
