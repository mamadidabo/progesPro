	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="language"
	value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}"
	scope="session" />
<fmt:setLocale value="${language}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Inscription</title>
<link type="text/css" rel="stylesheet" href="form.css" />
</head>
<body>
	<fmt:bundle basename="com.sdzee.language.Satrennespa">
		<form method="post" action="inscription">
			<fieldset>
				<legend>
					<fmt:message key="inscription.titre" />
				</legend>

				<p>
					<fmt:message key="inscription.soustitre" />
				</p>



				<label for="email">
				<fmt:message key="inscription.email" /><span class="requis">*</span>
				</label> 
				<input type="email" id="email" name="email" value="<c:out value="${utilisateur.email}"/>" size="20" maxlength="60" /> 
				<span class="erreur">${form.erreurs['email']}</span>
				<br /> 
				<label for="motdepasse">
				<fmt:message key="inscription.mdp" /> <span class="requis">*</span>
				</label>
				<input type="password" id="motdepasse" name="motdepasse" value="" size="20" maxlength="20" /> 
				<span class="erreur">${form.erreurs['motdepasse']}</span>
				<br />
				 <label for="confirmation">
				 <fmt:message key="inscription.confirmmdp" /> <span class="requis">*</span>
				</label>
				<input type="password" id="confirmation" name="confirmation" value="" size="20" maxlength="20" /> 
				<span class="erreur">${form.erreurs['confirmation']}</span>
				<br /> 
				<label for="nom"> <fmt:message key="inscription.nomUser" /> </label>
				<input type="text" id="nom" name="nom" value="<c:out value="${utilisateur.nom}"/>" size="20" maxlength="20" />
				<span class="erreur">${form.erreurs['nom']}</span>
				<br /> 
				<label for="prenom"><fmt:message key="inscription.prenomUser" /></label>
				<input type="text" id="prenom" name="prenom" value="<c:out value="${utilisateur.prenom}"/>" size="20" maxlength="20" />
				<span class="erreur">${form.erreurs['prenom']}</span>
				<br /> <input type="submit" value="Inscription" class="sansLabel" />
				<br /> <input type="reset" value="Annuler" class="sansLabel" /> <br />

				<p class="${empty form.erreurs ? 'succes' : 'erreur'}">${form.resultat}</p>
			</fieldset>
		</form>
	</fmt:bundle>

</body>
</html>