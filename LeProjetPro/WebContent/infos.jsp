<%@ page pageEncoding='UTF-8' %> <!-- We set the page encoding  -->

<!-- Java importations -->
<%@  page import="java.util.*"%>
<%@  page import="org.apache.*"%>
<!-- <%@  page import="satoulouse.*"%> -->

<!DOCTYPE html>
<html>
	<head>
		<meta charset='utf-8' />
		<!-- Bootstrap importations -->
		<link rel='stylesheet' href='bootstrap/css/bootstrap.min.css' type='text/css' />
		<link rel='stylesheet' href='bootstrap/css/bootstrap-responsive.css' type='text/css' />
		<script src='bootstrap/js/jquery.js'></script>
		<script src='bootstrap/js/bootstrap.js'></script>
		
		<!-- LateX importation that permits to display LateX formulas -->
		<script type="text/javascript" src="http://latex.codecogs.com/latexit.js"></script>
		<script src='satrennespagui_javascript/interpreter.js'></script>
		<script src='satrennespagui_javascript/scheme_to_html.js'></script>
		<script src='satrennespagui_javascript/gui.js'></script>
		<script src='satrennespagui_javascript/examples.js'></script>
		<title>SATRennesPa</title>
	</head>
	<body>
		<div class='container'>
			


	<div id='page-content' class='page-content'>
	
	
	
<div class='page-content' id='page-content'>
	<div class='span5 offset5'>
			<a href='javascript:changeLangue();'>
				<button class='btn-primary btn-large' id='btnChangeLangue'>English</button>
			</a>
	</div>
	<div class='row-fluid'>
		<div class='span12'>
			<div id='infosEng'>
			      <img src="bootstrap/img/satrennespa.png" />
				<p>The aim of this tool is to introduce the satisfiability problem with a user-friendly
					tool. The aim is also to show that the satisfiability problem of propositional
					formulas solves TRUE problems: sudoku, planification, etc.</p>
				<br />
				<h3>Help</h3>
				<p>
					<strong>What is the syntax of the formulas in SATRennesPa ?</strong>
					<br />
					The syntax of formulas in SATRennesPa looks like the s-expressions of the language Scheme. Here is the formal grammar:
				</p>
				<br />
				<blockquote>
					&lt;phi&gt;, &lt;psi&gt; ::= &lt;atomicproposition&gt; | (not
					&lt;phi&gt;) | (&lt;phi&gt; or &lt;psi&gt;) | <br /> (&lt;phi&gt;
					and &lt;psi&gt;) | (bigand &lt;var&gt; &lt;set&gt; &lt;phi&gt;) |
					(bigor &lt;var&gt; &lt;phi&gt;) | <br /> (bigand &lt;var&gt;
					&lt;set&gt; &lt;booleanexpression&gt; &lt;phi&gt;) | <br />(bigor
					&lt;var&gt; &lt;set&gt; &lt;booleanexpression&gt; &lt;phi&gt;) <br />
					&lt;booleanexpression&gt; ::= (&lt;expression&gt; diff
					&lt;expression&gt;) <br /> &lt;expression&gt; ::= &lt;var&gt; |
					&lt;number&gt; | (&lt;expression&gt; + &lt;expression&gt;) <br />
					&lt;var&gt; ::= any symbols (example: i, j, a) <br /> &lt;set&gt;
					::= (&lt;expression&gt; .. &lt;expression&gt;) |
					(&lt;expression&gt; &lt;expression&gt; &lt;expression&gt;........)
					<br /> &lt;number&gt; ::= 0, 1, 2, 3 etc. <br />
					&lt;atomicproposition&gt; ::= any symbols | (symbol
					&lt;expression&gt; &lt;expression&gt;.........)
				</blockquote>
				<br /> <strong>Examples of well-formed formulas:</strong> <br />
				<blockquote>
					p <br /> (p and q) <br /> (p and (not q)) <br /> (not p) <br />
					(not (p or (not q))) <br /> (bigand i (1 2 3) (p i)) <br />
					(bigand i (1 .. 12) (p i)) <br /> (bigand i (1 2 3) ((p i) or (q
					i))) <br /> (bigand i (1 .. 12) (bigor j (1 .. 10) (i diff j) ((p
					i) or (q j))))
				</blockquote>
				<br /> <strong>Strings that are NOT well-formed formulas:</strong>
				<br />
				<blockquote>
					p and q <br /> and p q <br /> (and p q) <br /> (p and not q) <br />
					etc.
				</blockquote>
			</div>
			<div id='infosFran'  style='display:none'>
				<p>Introduire la satisfiabilité d'une formule via un outil
					convivial. Montrer que le probl me de satisfiabilit&eacute; de
					formules propositionnelles r sout de VRAIS probl mes : sudoku,
					planification, etc.</p>
				<br />
				<p><strong>Quelle est la syntaxe des formules de
						SATRennesPa ?</strong> <br /> La syntaxe des formules reconnues pas
					SATRennesPa est proche des s-expression du langage Scheme. Voici la
					grammaire formelle : <br />
				</p>
				<blockquote>
					&lt;phi&gt;, &lt;psi&gt; ::= &lt;proposition&gt; | (not
					&lt;phi&gt;) | (&lt;phi&gt; or &lt;psi&gt;) | <br /> (&lt;phi&gt;
					and &lt;psi&gt;) | (bigand &lt;var&gt; &lt;ensemble&gt;
					&lt;phi&gt;) | (bigor &lt;var&gt; &lt;phi&gt;) | <br /> (bigand
					&lt;var&gt; &lt;ensemble&gt; &lt;expressionbooleenne&gt;
					&lt;phi&gt;) | <br />(bigor &lt;var&gt; &lt;ensemble&gt;
					&lt;expressionbooleenne&gt; &lt;phi&gt;) <br />
					&lt;expressionbooleenne&gt; ::= (&lt;expression&gt; diff
					&lt;expression&gt;) <br /> &lt;expression&gt; ::= &lt;var&gt; |
					&lt;nombre&gt; | (&lt;expression&gt; + &lt;expression&gt;) <br />
					&lt;var&gt; ::= n'importe quel symbole (exemple: i, j, a) <br />
					&lt;ensemble&gt; ::= (&lt;expression&gt; .. &lt;expression&gt;) |
					(&lt;expression&gt; &lt;expression&gt; &lt;expression&gt;........)
					<br /> &lt;nombre&gt; ::= 0, 1, 2, 3 etc. <br />
					&lt;proposition&gt; ::= n'importe quel symbole | (symbole
					&lt;expression&gt; &lt;expression&gt;.........)
				</blockquote>
				<br /> <strong>Exemples de formules correctes:</strong> <br />
				<blockquote>
					p <br /> (p and q) <br /> (p and (not q)) <br /> (not p) <br />
					(not (p or (not q))) <br /> (bigand i (1 2 3) (p i)) <br />
					(bigand i (1 .. 12) (p i)) <br /> (bigand i (1 2 3) ((p i) or (q
					i))) <br /> (bigand i (1 .. 12) (bigor j (1 .. 10) (i diff j) ((p
					i) or (q j))))
				</blockquote>
				<br /> <strong>Formules non correctes:</strong> <br />
				<blockquote>
					p and q <br /> and p q <br /> (and p q) <br /> (p and not q) <br />
					etc.
				</blockquote>
			</div>
		</div>
	</div>
	</div>
	
	
	<h3>History of this tool</h3>
	<div class='page-footer'>
		Here are some information about the history of this tool. This project comes from SAToulouse which was a tool developped in JAVA. The tool that inspired SATRennesPa is still available here: <a href='http://www.irit.fr/satoulouse/'>Satoulouse</a>. There is also a publication about this software:
	
	
	
		<div class='span12'>
			<a href='http://www.irit.fr/-Publications-?code=143&amp;nom=Gasquet%20Olivier'>Olivier Gasquet</a>, 
			<a href='http://www.irit.fr/-Publications-?code=4350&amp;nom=Schwarzentruber%20Fran%C3%A7ois'>Fran&ccedil;ois Schwarzentruber</a>,
			<a href='http://www.irit.fr/-Publications-?code=3342&amp;nom=Strecker%20Martin'>Martin Strecker</a>. 
			<a href='http://www.irit.fr/satoulouse/'>Satoulouse</a>: the computational power of propositional logic shown to beginners (regular paper). Dans : Third International Congress on Tools for Teaching Logic, Salamanca (Spain), 01/06/2011-04/06/2011,
			<a href='http://link.springer.com/'>Springer</a>, 2011. 
			<a href='http://dbweb.irit.fr:8902/publi/publi.affiche_bibtex?code=12433'>BibTeX</a>
			<br />
			
		</div>
		<br/>
		<br/><br/><br/><br/>

		The online tool SATRennesPa was then adapted to the web by two students in 3rd year of Licence MIAGE in Rennes: <a href='mailto:bourdel.maxime[aat]hotmail.fr'>Maxime Bourdel</a> and
				<a href='mailto:brendan.carnot[aat]gmail.com'>Brendan Carnot</a> under the supervision of Sophie Pinchinat and François Schwarzentruber.

			
			

			
		<div class='span12'>
			<a href='index.jsp'>
				<button class='btn-primary'><i class="icon-white icon-arrow-left"></i> Retour &agrave; l'accueil</button>
			</a>
		</div>
	</div>
	</div>
	</body>
	</html>
