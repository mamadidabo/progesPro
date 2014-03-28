<div id = 'infos'>
<div class='span4' style='width: auto; float: left;padding:0px;margin:0px;'>
		<nav class='navbar'>
			<div class='navbar-inner'>
				<ul class='nav'>
				<li><a onclick='afficherH();'><fmt:message key="infos.return" /></a>
				</ul></div></nav></div>
				
				
		<div class='container'>
			<div id='page-content' class='page-content'>
				<div class='page-content' id='page-content'>
					<div class='span5 offset5'></div>
					<div class='row-fluid'>
						<div class='span12'>
							<div id='infosEng'>
								<img src="bootstrap/img/satrennespa.png" />
								<p>
									<fmt:message key="infos.intro" />
								</p>
								<br />
								<h3>
									<fmt:message key="infos.aide" />
								</h3>
								<p>
									<strong><fmt:message key="infos.synthaxique1" /></strong> <br />
									<fmt:message key="infos.synthaxique2" />
								</p>
								<br />
								<blockquote>
									&lt;phi&gt;, &lt;psi&gt; ::= &lt;atomicproposition&gt; | (not
									&lt;phi&gt;) | (&lt;phi&gt; or &lt;psi&gt;) | <br />
									(&lt;phi&gt; and &lt;psi&gt;) | (bigand &lt;var&gt; &lt;set&gt;
									&lt;phi&gt;) | (bigor &lt;var&gt; &lt;phi&gt;) | <br />
									(bigand &lt;var&gt; &lt;set&gt; &lt;booleanexpression&gt;
									&lt;phi&gt;) | <br />(bigor &lt;var&gt; &lt;set&gt;
									&lt;booleanexpression&gt; &lt;phi&gt;) <br />
									&lt;booleanexpression&gt; ::= (&lt;expression&gt; diff
									&lt;expression&gt;) <br /> &lt;expression&gt; ::= &lt;var&gt;
									| &lt;number&gt; | (&lt;expression&gt; + &lt;expression&gt;) <br />
									&lt;var&gt; ::= any symbols (example: i, j, a) <br />
									&lt;set&gt; ::= (&lt;expression&gt; .. &lt;expression&gt;) |
									(&lt;expression&gt; &lt;expression&gt;
									&lt;expression&gt;........) <br /> &lt;number&gt; ::= 0, 1, 2,
									3 etc. <br /> &lt;atomicproposition&gt; ::= any symbols |
									(symbol &lt;expression&gt; &lt;expression&gt;.........)
								</blockquote>
								<br /> <strong> <fmt:message key="infos.exemple" />
								</strong> <br />
								<blockquote>
									p <br /> (p and q) <br /> (p and (not q)) <br /> (not p) <br />
									(not (p or (not q))) <br /> (bigand i (1 2 3) (p i)) <br />
									(bigand i (1 .. 12) (p i)) <br /> (bigand i (1 2 3) ((p i) or
									(q i))) <br /> (bigand i (1 .. 12) (bigor j (1 .. 10) (i diff
									j) ((p i) or (q j))))
								</blockquote>
								<br /> <strong><fmt:message key="infos.badexemple" /></strong>
								<br />
								<blockquote>
									p and q <br /> and p q <br /> (and p q) <br /> (p and not q)
									<br /> etc.
								</blockquote>
							</div>

						</div>
					</div>
				</div>
				<h3>
					<fmt:message key="infos.history0" />
				</h3>
				<div class='page-footer'>
					<fmt:message key="infos.history1" />
					<a href='http://www.irit.fr/satoulouse/'>Satoulouse</a>
					<fmt:message key="infos.history2" />
					<div class='span12'>
						<a
							href='http://www.irit.fr/-Publications-?code=143&amp;nom=Gasquet%20Olivier'>Olivier
							Gasquet</a>, <a
							href='http://www.irit.fr/-Publications-?code=4350&amp;nom=Schwarzentruber%20Fran%C3%A7ois'>Fran&ccedil;ois
							Schwarzentruber</a>, <a
							href='http://www.irit.fr/-Publications-?code=3342&amp;nom=Strecker%20Martin'>Martin
							Strecker</a>. <a href='http://www.irit.fr/satoulouse/'>Satoulouse</a>:
						the computational power of propositional logic shown to beginners
						(regular paper). Dans : Third International Congress on Tools for
						Teaching Logic, Salamanca (Spain), 01/06/2011-04/06/2011, <a
							href='http://link.springer.com/'>Springer</a>, 2011. <a
							href='http://dbweb.irit.fr:8902/publi/publi.affiche_bibtex?code=12433'>BibTeX</a>
						<br />
					</div>
					<br /> <br /> <br /> <br /> <br />
					<fmt:message key="infos.history3" />
					<a href='mailto:bourdel.maxime[aat]hotmail.fr'>Maxime Bourdel</a>
					<fmt:message key="infos.history4" />
					<a href='mailto:brendan.carnot[aat]gmail.com'>Brendan Carnot</a>
					<fmt:message key="infos.history5" />
					
				</div>
			</div>
		</div>

</div>
