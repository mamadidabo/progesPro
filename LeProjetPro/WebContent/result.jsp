<%@ page pageEncoding='UTF-8'%>
<!-- We set the page encoding  -->

<!-- Java importations -->
<%@  page import="java.util.*"%>
<%@  page import="org.apache.*"%>
<%@  page import="satoulouse.*"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="language"
	value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}"
	scope="session" />
<fmt:setLocale value="${language}" />

<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<!-- Bootstrap importations -->
<link rel='stylesheet' href='bootstrap/css/bootstrap.min.css'
	type='text/css' />
<link rel='stylesheet' href='bootstrap/css/bootstrap-responsive.css'
	type='text/css' />
<script src='bootstrap/js/jquery.js'></script>
<script src='bootstrap/js/bootstrap.js'></script>

<!-- LateX importation that permits to display LateX formulas -->
<script type="text/javascript"
	src="http://latex.codecogs.com/latexit.js"></script>
<script src='satrennespagui_javascript/interpreter.js'></script>
<script src='satrennespagui_javascript/scheme_to_html.js'></script>
<script src='satrennespagui_javascript/gui.js'></script>
<script src='satrennespagui_javascript/examples.js'></script>
<title>SATRennesPa</title>
</head>
<body>
	<fmt:bundle basename="com.sdzee.language.Satrennespa">

		<div class='container'>



			<div id='page-content' class='page-content'>



				<%
					//boolean renvoyant false quand le serveur n'est pas ok
					boolean serveurOk = true;


					
					
					SATSolverSAT4J solver = new SATSolverSAT4J();
					try 
					{
						//par défaut on doit ajouter ces deux formules ( top && (not bottom) )
						solver.addFormula(new FormulaForSAT4J(new Formula("top")));
						solver.addFormula(new FormulaForSAT4J(new Formula("(not bottom)")));
						try
						{
					
					//on récupere le nombre total d'input
					int nbInput = Integer.parseInt(request.getParameter("nbInput"));
					for (int i=1;i<=nbInput;i++)
					{ 
						if(request.getParameter("textBox"+i) != null && request.getParameter("textBox"+i) != "" )
						{
							//puis on ajoute leur contenu
							solver.addFormula(new FormulaForSAT4J(new Formula(request.getParameter("textBox"+i),false)));
						}
					}
						}
						catch (NumberFormatException e) 
						{
				%>Probleme avec la variable nbInput qui vaut
				<%=request.getParameter("nbInput")%>
				<%
					serveurOk = false;
						}	
					} 
					//en cas d'erreur du solveur
					catch (Exception ex) 
					{
						SchemeWithKawa.restart();	
						try 
						{
					int nbInput = Integer.parseInt(request.getParameter("nbInput"));
					int compteurErreur = Integer.parseInt(request.getParameter("compteurErreur"));
					if(compteurErreur < 50) 
					{
				%><form id='form_erreur' action='result.jsp' method='GET'>
					<%
						for (int i=1;i<=nbInput;i++)
								{
					%><input type='hidden' id='textBox<%=i%>' name='textBox<%=i%>'
						value='<%=request.getParameter("textBox"+i)%>' />
					<%
						}
					%><input type='hidden' id='compteurErreur' name='compteurErreur'
						value='<%=compteurErreur+1%>' />
					<%
						
					%><input type='hidden' id='nbInput' name='nbInput'
						value='<%=request.getParameter("nbInput")%>' />
					<%
						
					%>
				</form>
				<%
					
				%><script>
					document.getElementById("form_erreur").submit();
				</script>
				<%
					}
								//Au cas ou on a dépassé les 50 submits (pour éviter une boucle infinie)
								else {
									serveurOk = false;
								}
							}
							//en cas d'erreur avec Integer.parseInt()
							catch (NumberFormatException e) {
				%>
				Probleme avec la variable compteurErreur
				<%=request.getParameter("compteurErreur")%>
				OU avec la variable nbInput
				<%=request.getParameter("nbInput")%>
				<%
					serveurOk = false;
							}

						}

						//si il n'y a pas d'erreur de solveur
						if (serveurOk == true) {
							ArrayList<String> propositionsVraies;
							try {
								propositionsVraies = solver.isSAT();
							} catch (Exception ex) {
								SchemeWithKawa.restart();
								out.println("error from the solver: ");
								out.println(ex);
								return;
							}
				%>
				<div id='divResult' class='row-fluid' style='display: none'>
					<div class='span6 offset3'>
						<table class='table table-bordered' id='tabResult'>
							<%
								if (propositionsVraies != null) {
							%>
							<caption>
								<fmt:message key="result.satisfiable" />
							</caption>

							<tr>
								<%
									//cpt servant à limiter la longueur du tableau à 8
												int cpt = 0;
												for (int i = 1; i < propositionsVraies.size(); i++) {
													//arrivé à 8, on revient à la ligne
													if (i % 8 == 0) {
								%>
							</tr>
							<tr>
								<%
									}
													String string = "http://latex.codecogs.com/gif.latex?" + FormulaBox.formulaSchemeToLatexCode(new Formula(propositionsVraies.get(i).toString()));
								%><td><img id='result<%=i%>'
									src='<%=FormulaBox.schemeExpressionToHTML(string)%>'
									border='0' /></td>
								<%
									cpt++;
												}
												//cas ou il n'y a pas qu'une seule ligne car si on en a que 8 ou moins, pas besoin de retour à la ligne
												if (cpt > 8) {
													while (cpt % 8 != 0) {
								%><td></td>
								<%
									cpt++;
													}
												}
								%>
							</tr>
							<%
								} else {
							%><caption>
									<fmt:message key="result.nonsatisfiable" />
							</caption>
							<%
								}
							%>
						</table>
					</div>
				</div>


				<!-- si ServeurOk ne fonctionne pas -->
				<%
					} else {
				%>
				<div id='divResult' class='row-fluid' style='display: none'>
					<div class='span6 offset4'>	<fmt:message key="result.pbsolveur" /></div>
				</div>
				<form id='form_rechargement' onsubmit="changePage('result.jsp');"
					method='GET'>
					<%
						try {
									int nbInput = Integer.parseInt(request
											.getParameter("nbInput"));
									for (int i = 1; i <= nbInput; i++) {
					%><input type='hidden' id='textBox<%=i%>' name='textBox<%=i%>'
						value='<%=request.getParameter("textBox" + i)%>' />
					<%
						}
					%><input type='hidden' id='compteurErreur' name='compteurErreur'
						value='1' />
					<%
						
					%><input type='hidden' id='nbInput' name='nbInput'
						value='<%=request.getParameter("nbInput")%>' />
					<%
						} catch (NumberFormatException e) {
					%><fmt:message key="result.pbvariable" />
					<%=request.getParameter("nbInput")%>
					<%
						}
					%>
					<!-- bouton de rechargement du serveur -->
					<div class='row'>
						<div class='span6 offset5'>
							<button type='submit' class="btn btn-info btn-large">
								<i class="icon-white icon-refresh"></i>
							</button>
						</div>
					</div>
				</form>
				<%}%>
			</div>
		</div>
	</fmt:bundle>
</body>
</html>
