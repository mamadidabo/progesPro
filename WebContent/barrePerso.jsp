<!-- argggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg -->
<%@page import="org.apache.jasper.tagplugins.jstl.core.Set"%>




	<div class='span4' style='width: auto; float: right;padding:0px;'>
		<nav class='navbar'>
			<div class='navbar-inner'>
				<ul class='nav'>

					<c:choose>


						<c:when test="${ empty sessionScope.sessionUtilisateur.email}">
							
		
		
							<li>							
				
							<li> <a onclick="changer('connect');"><u><fmt:message key="index.menu.connect"/></u></a>		
							
							<li class="divider-vertical"></li>
							<li> <a onclick ="affichage_popup('inscription.jsp','Aide');"><u><fmt:message key="index.menu.inscription"/></u></a>							
							</li>



						</c:when>



						<c:otherwise>



<li><a>${sessionScope.sessionUtilisateur.email}</a></li>

<li class="divider-vertical"></li>

<li><a>
		<form method="get" action="deconnexion">
			<input type="submit" value="sign out" class="sansLabel"
				style="bordeur: 0; background-color: transparent; color: white; border-style: none;" />
	
		</form>

</a></li>
</c:otherwise>

</c:choose>



</ul>
</div>
</nav>



<div id = "connect" style = 'display : none;float : right; '>
<form method="post" action="connexion">
 <fieldset>
                
               

                <label for="nom">Email <span class="requis">*</span></label>
                <input type="texte" id="email" name="email" value="<c:out value="${utilisateur.email}"/>" size="20" maxlength="60" style ="width:auto;"/>
                <span class="erreur">${form.erreurs['email']}</span>
             

                <label for="motdepasse">Mot de passe <span class="requis">*</span></label>
                <input type="password" id="motdepasse" name="motdepasse" value="" size="20" maxlength="20" style ="width:auto;"/>
                <span class="erreur">${form.erreurs['motdepasse']}</span>


                <input type="submit" value="Connexion" class="sansLabel" style="bordeur: 2px; background-color: transparent; color: black;  margin: 0px"/>
                
                <br />
                <label for="memoire">Se souvenir de moi</label>
                <input type="checkbox" id="memoire" name="memoire" />
                <br />
                
                
                <p class="${empty form.erreurs ? 'succes' : 'erreur'}">${form.resultat}</p>
                
                <%-- Vérification de la présence d'un objet utilisateur en session --%>
                <c:if test="${!empty sessionScope.sessionUtilisateur}">
                    <%-- Si l'utilisateur existe en session, alors on affiche son adresse email. --%>
                    <p class="succes">Vous êtes connecté(e) avec le pseudo : ${sessionScope.sessionUtilisateur.email}</p>
                </c:if>
            </fieldset>
            </form>
</div>

</div>
