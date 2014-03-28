<%@page import="com.sdzee.servlets.VisualiserExp"%>
						<% String result=request.getParameter("exemple");
						String filePath = "C:/Users/mohamed/Desktop/eclipse/"+result ;
						String[] liste1 =VisualiserExp.lesLinesFichier(filePath).toArray(new String[VisualiserExp.lesLinesFichier(filePath).size()]);
						String maValeur1="";
						String[]  maValeur=new String [liste1.length];
%>
	
									 
<div class='row'> 
	<!--bloc central--> 

	<div class='span4'>
		<!--la zone de construction basique générale-->

		<div class="accordion-group well">
			<!--la zone titre:"Basic constructions"-->

			<div class="accordion-heading">
				<a class="accordion-toggle" href="#Formules" data-toggle="collapse"><fmt:message
						key="index.menu2.titre1" /></a>
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
					</a> <a class='btn' id='(p i)' title="Insert (p i) proposition"
						onclick="return insertValue(this.id);"> <img
						src="http://latex.codecogs.com/gif.latex?{(p\;i)}" border="0" />
					</a> <a class='btn' id='(p(i+1))' title="Insert (p(i+1)) proposition"
						onclick="return insertValue(this.id);"> <img
						src="http://latex.codecogs.com/gif.latex?{\left%20(p(\left i+1)\right})"
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
					</a> <a class='btn' id='(<phi> imply <psi>)' title="Insert involvment"
						onclick="return insertValue(this.id);"> <img
						src="http://latex.codecogs.com/gif.latex?\left(?\rightarrow?\right)"
						border="0" />
					</a> <a class='btn' id='(<phi> equiv <psi>)' title="Insert equivalence"
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
				<a class="accordion-toggle" href="#Pays" data-toggle="collapse"><fmt:message
						key="index.menu2.titre2" /></a>
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
				<a class="accordion-toggle" href="#Couleurs" data-toggle="collapse"><fmt:message
						key="index.menu2.titre3" /></a>
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
					data-toggle="collapse"><fmt:message key="index.menu2.titre4" /></a>
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
				<a class="accordion-toggle" href="#Autres" data-toggle="collapse"><fmt:message
						key="index.menu2.titre5" /></a>
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
						<form class='form-horizontal well' id='formulaire_satisfiabilite' method="post" action=AjouterExp>

						
		<form class='form-horizontal well' id='formulaire_satisfiabilite'>
			<div class='row-fluid'>
			
		
			<div id='ErrorOrDescriptionDiv' style='display: none;width: auto'></div>
	
			
				<div class='span7 offset2'>
					<label class='btn-primary btn-large' id='resultButton'
						onclick='javascript:afficheResult();'><i
						class="icon-white icon-ok"></i> <fmt:message key="index.boutonok" /></label>
				</div>
			</div>
			<div class='span8'>
				<div class='control-group' id='champsText'>

					<%
						//creation des 3 inputs et 3 divPourLaTex appeles textBox1,divAjaxtextBox1 | textBox2,divAjaxtextBox2 | ...
						for (int i = 1; i <= 3; i++) {
					%>
					<div id='ligne<%=i%>'>
						<div class='span8'>
							<input type='text' id='textBox<%=i%>' name='textBox<%=i%>'
								value=''
								onclick='fermeture();setFocusedInput(this.id);updateLaTeX(this.value,this.id)'
								onkeyup='updateLaTeX(this.value,this.id);' onkeydown='fermeture()' /> <a
								class='btn btn-danger' id='boutonSuppr<%=i%>'
								href='javascript:supprTextBox("ligne<%=i%>")'><i
								class="icon-white icon-remove"></i></a>
						</div>
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
								class="icon-white icon-plus-sign"></i>
							<fmt:message key="index.boutonNouvelleFormule" /></a>
						</div>
						<img src="bootstrap/img/satrennespa.png" />
						<!-- <div class='span4 offset2' id='boutonVider'><label class='btn btn-danger btn-large' onclick='viderNbInput(getNbInput());'><i class="icon-white icon-remove"></i> Delete all the formulas</label></div> -->
					</div>
				</div>
			</div>
		</div>
		


	










