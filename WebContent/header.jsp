<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="com.sdzee.servlets.VisualiserExp"%>
<%@ page import="com.sdzee.servlets.AjouterExp" %>

<html>
<head>
<script src='satrennespagui_javascript/gui.js'></script>
<script type="text/javascript">
function affichage_popup(nom_de_la_page, nom_interne_de_la_fenetre)
{
window.open (nom_de_la_page, nom_interne_de_la_fenetre, config='height=200, width=400, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, directories=no, status=no')
}

function affichage(nom)
{
	if (document.getElementById(nom).style.display=="none")
		
		{
		document.getElementById(nom).style.display= "block";		
		
		
		}
	
	else
		{
		document.getElementById(nom).style.display="none";
		}
	
	}
</script>
</head>
<body>

			<%@page import="org.apache.catalina.ha.session.SessionMessageImpl"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Set"%>
<div id='page-content' class='page-content'>
				<!--
		charger la page "index.jsp"
		'form_exemples':la zone d'en-t�te principale-->

				<form id='form_exemples' action='index.jsp'>
					<!--la zone d'en-t�te -->
					<div class='row-fluid'>
						<!--la zone des ongles New problem, examples, Help -->

						<div class='span4' style='width: auto; float: left;' >
							<!--bloc gauche-->
							<nav class='navbar'>
								<!--zone de renvoi de requ�te-->

								<div class='navbar-inner'>
									<ul class='nav' >
										<!--
			la partie en t�te gauche qui regroupe:
			la cr�ation d'un nouveau probl�me "New problem"
			les exemples misent en oeuvre "examples"
				et l'aide "help"
		-->
						

										<li class='dropdown'><a class='dropdown-toggle'
											data-toggle='dropdown'><fmt:message key="index.menu.titre1"/><b class='caret'></b></a>
										<ul class='dropdown-menu'>
												<li><a onclick="affichage('affiche')"><fmt:message key="index.menu.titre1.soustitre1"/></a></li>
												<li><a href="index.jsp?pageA=save"><fmt:message key="index.menu.titre1.soustitre2"/></a></li>
												<li><a href="index.jsp?pageA=saveas"><fmt:message key="index.menu.titre1.soustitre3"/></a></li>
												<li><a href="index.jsp?pageA=deleate"><fmt:message key="index.menu.titre1.soustitre4"/></a></li>
												<li><a onclick="affichage('supprimer')"><fmt:message key="index.menu.titre1.soustitre5"/></a></li>												
										</ul></li>

										<li class="divider-vertical"></li>
										<li class='dropdown'><a class='dropdown-toggle'
											data-toggle='dropdown'><fmt:message key="index.menu.titre2"/><b class='caret'></b></a>
											<ul class='dropdown-menu'>
												<li><a id='CarreLatin' onclick='insererExH(this.id)'> <fmt:message key="index.menu.titre2.soustitre1"/></a></li>
												<li><a id='Sudoku4' onclick='insererExH(this.id)'><fmt:message key="index.menu.titre2.soustitre3"/></a></li>
												<li><a id='Sudoku9' onclick='insererExH(this.id)'><fmt:message key="index.menu.titre2.soustitre4"/></a></li>
												<li><a id='MoutonChouLoup' onclick='insererExH(this.id)'><fmt:message key="index.menu.titre2.soustitre5"/></a></li>
												<li><a id='Carte' onclick='insererExH(this.id)'><fmt:message key="index.menu.titre2.soustitre6"/></a></li>
												<li><a id='EmploiDuTemps' onclick='insererExH(this.id)'><fmt:message key="index.menu.titre2.soustitre7"/></a></li>
												<li><a id='Somme' onclick='insererExH(this.id)'><fmt:message key="index.menu.titre2.soustitre8"/></a></li>
												<li><a id='8Dames' onclick='insererExH(this.id)'><fmt:message key="index.menu.titre2.soustitre9"/></a></li>
												<li><a id='6Boules' onclick='insererExH(this.id)'><fmt:message key="index.menu.titre2.soustitre10"/></a></li>
											</ul></li>
										<li class="divider-vertical"></li>

										<!-- un click sur l'onglet "Help", charge la page 'infos'-->
										<li><a id ='infos'  onclick='infos()' ><fmt:message key="index.menu.titre3"/><i class="icon-white icon-info-sign"></i></a></li>
												
												
										</li>
										<li class="divider-vertical"></li>

											<li class='dropdown'><a class='dropdown-toggle'
											data-toggle='dropdown'><fmt:message key="index.menu.titre4"/><b class='caret'></b></a>
											<ul class='dropdown-menu' >
												<li><a href="index.jsp?language=en" ><img src="icons/flags/Angleterre.png"/></a></li>
												<li><a href="index.jsp?language=fr"><img src="icons/flags/France.png"/></a></li>
											</ul></li>		
										
									</ul>
								</div>
							</nav>
						</div>
						</form>
							<!-- START DIV Barre personnel 
					
					si anomyne : connection
					si connecte : mon compte et deconnection -->
					
					
					<%@include file="barrePerso.jsp" %>
					<!-- END barre perso -->	
						
						
						
					
					</div>


<body>
				
<script >



function insererExH(id, langue)
{
	var page = "<c:out value="${pageA}" />";
	var langue = "<c:out value="${language}" />"; 
	if ( page == "ex" || page == 'home' )
	{
		insererEx(id, langue);	
	}
	else
		{
		document.location.href="index.jsp?pageA=ex&id="+id;	
		
		}
	
}

function infos()
{

var page = "<c:out value="${pageA}" />";
	
	if ( page != 'infos' )
	{
		document.location.href="index.jsp?pageA=infos";
	}
	
	
	}






</script>

<div id = "affiche" style = 'display : none;float : right; '>
 <fieldset>
 			<FORM METHOD=post ACTION="VisualiserExp">
		<p align="center"> examples :</p>
		<p align="center">
		<select name="exemple" size="1">
		<optgroup>
			<% 	String[] lavue =AjouterExp.listIds();
			for (int z = 0; z<lavue.length;z++){
				out.println("<option value=\""+lavue[z]+"\">"+AjouterExp.getLesExemples().get(z)+"</option>");
			} 
		%>
		</optgroup>
		</select>
		<p align="center"><button type="submit">Submit</button></p>
		
		
		</form>
 </fieldset>
 </div>

		

<div id = "supprimer" style = 'display : none;float : right; '>
 <fieldset>
 			<FORM METHOD=post ACTION="SupprimerEx">
		<p align="center"> examples :</p>
		<p align="center">
		<select name="exemple" size="1">
		<optgroup>
			<% 	String [] lavue2=AjouterExp.listIds();
			for (int z = 0; z<lavue2.length;z++){
				out.println("<option value=\""+lavue2[z]+"\">"+AjouterExp.getLesExemples().get(z)+"</option>");
			} 
		%>
		</optgroup>
		</select>
		<p align="center"><button type="submit">Delete</button></p>
		
		
		</form>
 </fieldset>
 </div>


</body>
</html>

