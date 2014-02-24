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
				<!--
		charger la page "index.jsp"
		'form_exemples':la zone d'en-tête principale-->

				<form id='form_exemples' action='index.jsp'>
					<!--la zone d'en-tête -->
					<div class='row-fluid'>
						<!--la zone des ongles New problem, examples, Help -->

						<div class='span4'>
							<!--bloc gauche-->
							<nav class='navbar' width='800px'>
								<!--zone de renvoi de requête-->

								<div class='navbar-inner'>
									<ul class='nav' width='800px'>
										<!--
			la partie en tête gauche qui regroupe:
			la création d'un nouveau problème "New problem"
			les exemples misent en oeuvre "examples"
				et l'aide "help"
		-->
										<li><a onclick='newproblem()'><fmt:message key="index.menu.titre1"/></a></li>
										<li class="divider-vertical"></li>
										<li class='dropdown'><a class='dropdown-toggle'
											data-toggle='dropdown'> <fmt:message key="index.menu.titre2"/> <b class='caret'></b></a>
											<ul class='dropdown-menu'>
												<li><a id='CarreLatin' onclick='insererEx(this.id)'> <fmt:message key="index.menu.titre2.soustitre1"/></a></li>
												<li><a id='Sudoku2' onclick='insererEx(this.id)'><fmt:message key="index.menu.titre2.soustitre2"/></a></li>
												<li><a id='Sudoku4' onclick='insererEx(this.id)'><fmt:message key="index.menu.titre2.soustitre3"/></a></li>
												<li><a id='Sudoku9' onclick='insererEx(this.id)'><fmt:message key="index.menu.titre2.soustitre4"/></a></li>
												<li><a id='MoutonChouLoup' onclick='insererEx(this.id)'><fmt:message key="index.menu.titre2.soustitre5"/></a></li>
												<li><a id='Carte' onclick='insererEx(this.id)'>Coloriage
														de cartes</a></li>
												<li><a id='EmploiDuTemps' onclick='insererEx(this.id)'>Emploi
														du Temps</a></li>
												<li><a id='Somme' onclick='insererEx(this.id)'>Somme</a></li>
												<li><a id='8Dames' onclick='insererEx(this.id)'>Les
														8 Dames</a></li>
												<li><a id='6Boules' onclick='insererEx(this.id)'>Les
														6 boules</a></li>
											</ul></li>
										<li class="divider-vertical"></li>

										<!-- un click sur l'onglet "Help", charge la page 'infos'-->
										<li><a href='infos.jsp'>Help <i
												class="icon-white icon-info-sign"></i></a></li>
												
												
										</li>
										<li class="divider-vertical"></li>

											<li class='dropdown'><a class='dropdown-toggle'
											data-toggle='dropdown'> Language <b class='caret'></b></a>
											<ul class='dropdown-menu'>
												<li><a href="index.jsp?language=en"><img src="icons/flags/Angleterre.png"/></a></li>
												<li><a href="index.jsp?language=fr"><img src="icons/flags/France.png"/></a></li>
											</ul></li>
												
												
												
										

												
												
												
										
									</ul>
								</div>
							</nav>
						</div>
						<div class='span5 offset1'>

							<div id='ErrorOrDescriptionDiv' style='display: none;'></div>
						</div>
					</div>
				</form>

				<!-- palette d'outils-->

				<!-- tip tip est l'outil permettant un affichage de l'aide lors d'un hoover sur les boutons-->
				<!-- <script>$(function(){$(".btn").tipTip({maxWidth: "auto", edgeOffset: 10});});</script>	  			  -->
				<!-- zone qui regroupe le bloc gauche et le bloc central de la page index -->

				<div class='row'>
					<!--bloc central-->

					<div class='span4'>
						<!--la zone de construction basique générale-->

						<div class="accordion-group well">
							<!--la zone titre:"Basic constructions"-->

							<div class="accordion-heading">
								<a class="accordion-toggle" href="#Formules"
									data-toggle="collapse"> Basic constructions</a>
							</div>
							<!--la zone des differents synboles de la construction basique-->

							<div id="Formules" class="collapse in">
								<div class="accordion-inner">
									<a class='btn' id='p' title="Insert p proposition"
										onclick="return insertValue(this.id);"> <img
										src="http://latex.codecogs.com/gif.latex?p" border="0" />
									</a> <a class='btn' id='q' title="Insert q proposition"
										onclick="return insertValue(this.id);"> <img
										src="http://latex.codecogs.com/gif.latex?q" border="0" />
									</a> <a class='btn' id='p(i)' title="Insert (p i) proposition"
										onclick="return insertValue(this.id);"> <img
										src="http://latex.codecogs.com/gif.latex?p_{i}" border="0" />
									</a> <a class='btn' id='p(i+1)' title="Insert p(i+1) proposition"
										onclick="return insertValue(this.id);"> <img
										src="http://latex.codecogs.com/gif.latex?p_{\left(i+1\right)}"
										border="0" />
									</a> <a class='btn' id='p(i,j)' title="Insert p(i,j) proposition"
										onclick="return insertValue(this.id);"> <img
										src="http://latex.codecogs.com/gif.latex?p_{i,j}" border="0" />
									</a> <a class='btn' id='(<phi> and <psi>)'
										title="Insert (and) conjunction"
										onclick="return insertValue(this.id);"> <img
										src="http://latex.codecogs.com/gif.latex?\left(?\wedge?\right)"
										border="0" />
									</a> <a class='btn' id='(not <phi>)' title="Insert negation of ..."
										onclick="return insertValue(this.id);"> <img
										src="http://latex.codecogs.com/gif.latex?\neg?" border="0" />
									</a> <a class='btn' id='(<phi> or <psi>)'
										title="Insert (or) disjunction"
										onclick="return insertValue(this.id);"> <img
										src="http://latex.codecogs.com/gif.latex?\left(?\vee?\right)"
										border="0" />
									</a> <a class='btn' id='(<phi> xor <psi>)'
										title="Insert (xor) exclusive disjunction"
										onclick="return insertValue(this.id);"> <img
										src="http://latex.codecogs.com/gif.latex?\left(?\oplus?\right)"
										border="0" />
									</a> <a class='btn' id='(<phi> imply <psi>)'
										title="Insert involvment"
										onclick="return insertValue(this.id);"> <img
										src="http://latex.codecogs.com/gif.latex?\left(?\rightarrow?\right)"
										border="0" />
									</a> <a class='btn' id='(<phi> equiv <psi>)'
										title="Insert equivalence"
										onclick="return insertValue(this.id);"> <img
										src="http://latex.codecogs.com/gif.latex?\left(?\leftrightarrow?\right)"
										border="0" />
									</a> <a class='btn' id='(bigand i (1 2 3) <phi>)'
										title="Insert BIG (and) conjunction"
										onclick="return insertValue(this.id);"> <img
										src="http://latex.codecogs.com/gif.latex?\bigwedge_{i\in\lbrace1,2,3\rbrace}?"
										border="0" />
									</a> <a class='btn' id='(bigor i (1 2 3) <phi>)'
										title="Insert BIG (or) disjunction"
										onclick="return insertValue(this.id);"> <img
										src="http://latex.codecogs.com/gif.latex?\bigvee_{i\in\lbrace1,2,3\rbrace}?"
										border="0" />
									</a> <a class='btn' id='(bigxor i (1 2 3) <phi>)'
										title="Insert BIG (xor) exclusive disjunction"
										onclick="return insertValue(this.id);"> <img
										src="http://latex.codecogs.com/gif.latex?\bigoplus_{i\in\lbrace1,2,3\rbrace}?"
										border="0" />
									</a> <a class='btn' id='(bigand i (1 2 3) (i diff j) <phi>)'
										title="Insert BIG (and) injunction"
										onclick="return insertValue(this.id);"> <img
										src="http://latex.codecogs.com/gif.latex?\bigwedge_{i\in\lbrace1,2,3\rbrace\vert\left(i\neq j\right)}?"
										border="0" />
									</a> <a class='btn' id='(bigor i (1 2 3) (i diff j) <phi>)'
										title="Insert BIG (or) disjunction"
										onclick="return insertValue(this.id);"> <img
										src="http://latex.codecogs.com/gif.latex?\bigvee_{i\in\lbrace1,2,3\rbrace\vert\left(i\neq j\right)}?"
										border="0" />
									</a>
								</div>
							</div>
						</div>
						<!--la zone des differents pays :"countries"-->
						<div class="accordion-group well">
							<!--la zone des differentes couleurs :"colors"-->
							<div class="accordion-heading">
								<a class="accordion-toggle" href="#Pays" data-toggle="collapse">
									Countries </a>
							</div>
							<div id="Pays" class="collapse">
								<div class="accordion-inner"></div>
								<div class='span3'>
									<a id=' France ' title="Insert french flag"
										onclick="return insertValue(this.id);"> <img
										src="icons/flags/France.png" border="0" />
									</a> <a id=' Allemagne ' title="Insert german flag"
										onclick="return insertValue(this.id);"> <img
										src="icons/flags/Allemagne.png" border="0" />
									</a> <a id=' Autriche ' title="Insert autrichian flag"
										onclick="return insertValue(this.id);"> <img
										src="icons/flags/Autriche.png" border="0" />
									</a> <a id=' Angleterre ' title="Insert english flag"
										onclick="return insertValue(this.id);"> <img
										src="icons/flags/Angleterre.png" border="0" />
									</a> <a id=' Luxembourg ' title="Insert luxembourg flag"
										onclick="return insertValue(this.id);"> <img
										src="icons/flags/Luxembourg.png" border="0" />
									</a> <a id=' Belgique ' title="Insert belgian flag"
										onclick="return insertValue(this.id);"> <img
										src="icons/flags/Belgique.png" border="0" />
									</a> <a id=' Italie ' title="Insert italian flag"
										onclick="return insertValue(this.id);"> <img
										src="icons/flags/Italie.png" border="0" />
									</a> <a id=' Russie ' title="Insert russian flag"
										onclick="return insertValue(this.id);"> <img
										src="icons/flags/Russie.png" border="0" />
									</a> <a id=' USA ' title="Insert american flag"
										onclick="return insertValue(this.id);"> <img
										src="icons/flags/USA.png" border="0" />
									</a> <a id=' Suisse ' title="Insert swiss flag"
										onclick="return insertValue(this.id);"> <img
										src="icons/flags/Suisse.png" border="0" />
									</a>
								</div>
							</div>
						</div>
						<!--la zone calendrier: "calendar"-->
						<div class="accordion-group well">
							<div class="accordion-heading">
								<a class="accordion-toggle" href="#Couleurs"
									data-toggle="collapse"> Colors </a>
							</div>
							<div id="Couleurs" class="collapse">
								<div class="accordion-inner"></div>
								<div class='span3'>
									<a id=' Bleu ' title="Insert Blue color"
										onclick="return insertValue(this.id);"> <img
										src="icons/couleurs/Bleu.png" border="0" />
									</a> <a id=' Rouge ' title="Insert Red color"
										onclick="return insertValue(this.id);"> <img
										src="icons/couleurs/Rouge.png" border="0" />
									</a> <a id=' Jaune ' title="Insert Yellow color"
										onclick="return insertValue(this.id);"> <img
										src="icons/couleurs/Jaune.png" border="0" />
									</a> <a id=' Vert ' title="Insert Green color"
										onclick="return insertValue(this.id);"> <img
										src="icons/couleurs/Vert.png" border="0" />
									</a> <a id=' Blanc ' title="Insert White color"
										onclick="return insertValue(this.id);"> <img
										src="icons/couleurs/Blanc.png" border="0" />
									</a> <a id=' Orange ' title="Insert Orange color"
										onclick="return insertValue(this.id);"> <img
										src="icons/couleurs/Orange.png" border="0" />
									</a>
								</div>
							</div>
						</div>
						<!--la zone des accessoires dans l'onglet "calendar"-->
						<div class="accordion-group well">
							<div class="accordion-heading">
								<a class="accordion-toggle" href="#Calendrier"
									data-toggle="collapse"> Calendar </a>
							</div>
							<div id="Calendrier" class="collapse">
								<div class="accordion-inner"></div>
								<div class='span3'>
									<a id=' birthday ' title="Insert birthday icon"
										onclick="return insertValue(this.id);"> <img
										src="icons/calendar/birthday.png" border="0" />
									</a> <a id=' cinema ' title="Insert cinema icon"
										onclick="return insertValue(this.id);"> <img
										src="icons/calendar/cinema.png" border="0" />
									</a> <a id=' compta ' title="Insert comptability icon"
										onclick="return insertValue(this.id);"> <img
										src="icons/calendar/compta.png" border="0" />
									</a> <a id=' dessin ' title="Insert drawying icon"
										onclick="return insertValue(this.id);"> <img
										src="icons/calendar/dessin.png" border="0" />
									</a> <a id=' lettres ' title="Insert letter icon"
										onclick="return insertValue(this.id);"> <img
										src="icons/calendar/lettres.png" border="0" />
									</a> <a id=' maths ' title="Insert maths icon"
										onclick="return insertValue(this.id);"> <img
										src="icons/calendar/maths.png" border="0" />
									</a> <a id=' musique ' title="Insert music icon"
										onclick="return insertValue(this.id);"> <img
										src="icons/calendar/musique.png" border="0" />
									</a> <a id=' philo ' title="Insert philosophy icon"
										onclick="return insertValue(this.id);"> <img
										src="icons/calendar/philo.png" border="0" />
									</a> <a id=' poterie ' title="Insert pottery icon"
										onclick="return insertValue(this.id);"> <img
										src="icons/calendar/poterie.png" border="0" />
									</a> <a id=' theatre ' title="Insert theater icon"
										onclick="return insertValue(this.id);"> <img
										src="icons/calendar/theatre.png" border="0" />
									</a>
								</div>
							</div>
						</div>




						<!--la zone misc: "misc"-->
						<div class="accordion-group well">
							<div class="accordion-heading">
								<a class="accordion-toggle" href="#Autres"
									data-toggle="collapse"> Misc. </a>
							</div>
							<div id="Autres" class="collapse">
								<div class="accordion-inner"></div>
								<!--la zone pour chacun des drapeaux de la premiere ligne-->
								<div class='span3'>
									<a id=' cloud ' title="Insert a cloud"
										onclick="return insertValue(this.id);"> <img
										src="icons/weather/cloud42.png" border="0" />
									</a> <a id=' rain ' title="Insert rain"
										onclick="return insertValue(this.id);"> <img
										src="icons/weather/rain32.png" border="0" />
									</a> <a id=' sun ' title="Insert a sun"
										onclick="return insertValue(this.id);"> <img
										src="icons/weather/sun32.png" border="0" />
									</a> <a id=' snow ' title="Insert snow"
										onclick="return insertValue(this.id);"> <img
										src="icons/weather/snow32.png" border="0" />
									</a> <a id=' thunder ' title="Insert thunder"
										onclick="return insertValue(this.id);"> <img
										src="icons/weather/thunder32.png" border="0" />
									</a>
								</div>
								<!--la zone pour chacun des drapeaux de la deuxime ligne-->

								<div class='span3'>
									<a id=' barque ' title="Insert a boat"
										onclick="return insertValue(this.id);"> <img
										src="icons/CHL/barque.png" border="0" />
									</a> <a id=' loup ' title="Insert a wolf"
										onclick="return insertValue(this.id);"> <img
										src="icons/CHL/loup.png" border="0" />
									</a> <a id=' chou ' title="Insert a cabbage"
										onclick="return insertValue(this.id);"> <img
										src="icons/CHL/chou.png" border="0" />
									</a> <a id=' mouton ' title="Insert a sheep"
										onclick="return insertValue(this.id);"> <img
										src="icons/CHL/mouton.png" border="0" />
									</a>
								</div>
							</div>
						</div>
					</div>
					<!--la zone centrale principale-->
					<div class='span8'>
						<form class='form-horizontal well' id='formulaire_satisfiabilite'>
							<div class='row-fluid'>
								<div class='span7 offset2'>
									<label class='btn-primary btn-large' id='resultButton'
										onclick='javascript:afficheResult();'><i
										class="icon-white icon-ok"></i> Test whether the set of
										formulas is satisfiable</label>
								</div>
							</div>
							<div class='span8'>
								<div class='control-group' id='champsText'>

									<%
										//creation des 3 inputs et 3 divPourLaTex  appeles textBox1,divAjaxtextBox1 | textBox2,divAjaxtextBox2 | ... 
											for (int i = 1; i <= 3; i++) {
									%>
									<div id='ligne<%=i%>'>
										<div class='span8'>
											<input type='text' id='textBox<%=i%>' name='textBox<%=i%>'
												value='' onchange='updateLaTeX(this.value,this.id);'
												onclick='setFocusedInput(this.id);updateLaTeX(this.value,this.id);'
												onkeyup='updateLaTeX(this.value,this.id);' /> <a
												class='btn btn-danger' id='boutonSuppr<%=i%>'
												href='javascript:supprTextBox("ligne<%=i%>")'><i
												class="icon-white icon-remove"></i></a>
										</div>
										<%
											
										%>
										<div id="divLaTeXtextBox<%=i%>" class='span8'>
											<!-- -> ici sera inséré le code laTeX en JS <- -->
										</div>
									</div>
									<%
										}
									%>
								</div>
							</div>
							<div class='row-fluid'>
								<div class='span12'>
									<div class='control-group' id='boutons'>
										<div class='span4 offset1' id='boutonAjout'>
											<a href="javascript:ajoutInput();"
												class="btn btn-success btn-large"><i
												class="icon-white icon-plus-sign"></i> Add a new formula</a>
										</div>
										<img src="bootstrap/img/satrennespa.png" />
										<!-- <div class='span4 offset2' id='boutonVider'><label class='btn btn-danger btn-large' onclick='viderNbInput(getNbInput());'><i class="icon-white icon-remove"></i> Delete all the formulas</label></div> -->
									</div>
								</div>
							</div>
							<input type='hidden' id='compteurErreur' name='compteurErreur'
								id='compteurErreur' value="1" />
						</form>
					</div>
				</div>
			</div>
		</div>

	</fmt:bundle>
</body>


</html>

