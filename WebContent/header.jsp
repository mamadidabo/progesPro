<script src='satrennespagui_javascript/gui.js'></script>

			<%@page import="org.apache.catalina.ha.session.SessionMessageImpl"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Set"%>
<div id='page-content' class='page-content'>
				<!--
		charger la page "index.jsp"
		'form_exemples':la zone d'en-tête principale-->

				<form id='form_exemples' action='index.jsp'>
					<!--la zone d'en-tête -->
					<div class='row-fluid'>
						<!--la zone des ongles New problem, examples, Help -->

						<div class='span4' style='width: auto; float: left;' >
							<!--bloc gauche-->
							<nav class='navbar'>
								<!--zone de renvoi de requête-->

								<div class='navbar-inner'>
									<ul class='nav' >
										<!--
			la partie en tête gauche qui regroupe:
			la création d'un nouveau problème "New problem"
			les exemples misent en oeuvre "examples"
				et l'aide "help"
		-->
										<li><a href="index.jsp?pageA=home"><fmt:message key="index.menu.titre1"/></a></li>
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

</body>
</html>

