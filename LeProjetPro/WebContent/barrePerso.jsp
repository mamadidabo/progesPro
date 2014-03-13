<!-- argggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg -->


<form method="post" action="connexion">

	<div class='span4' style='width: auto; float: right;'>
		<nav class='navbar'>
			<div class='navbar-inner'>
				<ul class='nav'>

					<c:choose>


						<c:when test="${ empty sessionScope.sessionUtilisateur.email}">
							<br>

							<li style='width: auto;'><a> <label for="nom">Email
										<span class="requis">*</span>
								</label> <input type="texte" id="email" name="email"
									style="width: auto;"
									value="<c:out value="${utilisateur.email}"/>" size="20"
									maxlength="60" /> <span class="erreur">${form.erreurs['email']}</span>


							</a></li>

							<li style='width: auto;'><a> <label style="width: 60px;"><fmt:message key="index.menu.titre2.mdp"/></label>

									<input type="password" name="motdepasse" value="" size="20"
									maxlength="20" style="width: auto;" /> <span class="erreur">${form.erreurs['motdepasse']}</span>

							</a>
								<p class="${empty form.erreurs ? 'succes' : 'erreur'}">${form.resultat}</p>
							</li>

							<li class="divider-vertical"></li>
							<li><a> <input type="submit" value="<fmt:message key='index.menu.connect'/>" 
									class="sansLabel"
									style="bordeur: 0; background-color: transparent; color: white; border-style: none;" />
							</a> <a href="index.jsp?pageA=inscription"><u><fmt:message key="index.menu.inscription"/></u></a></li>



						</c:when>



						<c:otherwise>
</form>


<li><a>${sessionScope.sessionUtilisateur.email}</a></li>
<li class="divider-vertical"></li>


<li class='dropdown'><a class='dropdown-toggle'
	data-toggle='dropdown'>my examples <b class='caret'></b></a>
	<ul class='dropdown-menu'>
		<li>a inserer</li>
	</ul></li>

<li class="divider-vertical"></li>
<li><a>My account</a></li>

<li class="divider-vertical"></li>

<li><a>
		<form method="get" action="deconnexion">
			<input type="submit" value="sign out" class="sansLabel"
				style="bordeur: 0; background-color: transparent; color: white; border-style: none;" />
</a></li>
</c:otherwise>

</c:choose>


</form>

</ul>
</div>
</nav>
</div>
