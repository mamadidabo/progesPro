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

<body>
<%@page import="com.sdzee.servlets.VisualiserExp"%>
						<% String result=request.getParameter("exemple");
						String filePath = "C:/Users/mohamed/Desktop/eclipse/"+result ;
						String[] liste1 =VisualiserExp.lesLinesFichier(filePath).toArray(new String[VisualiserExp.lesLinesFichier(filePath).size()]);
						String maValeur1="";
						String[]  maValeur=new String [liste1.length];
%>
	<fmt:bundle basename="com.sdzee.language.Satrennespa">
		<div class='container'>
			


			<c:choose>
				<c:when test="${empty param.pageA}">
					<c:if test="${empty pageA}">
						<c:set var="pageA" value="home" scope="session" />
					</c:if>
				</c:when>
				<c:otherwise>
					<c:set var="pageA" value="${param.pageA}" scope="session" />
				</c:otherwise>
			</c:choose>
		
			<c:set var="id" value="${param.id}" scope="session" />

<%@include file="script.jsp" %>
	<%@include file="header.jsp"%>
			<c:choose>
				<c:when test="${pageA == 'home' or pageA == 'infos' or pageA == 'ex'}">
					<%@include file="home.jsp"%>
					<%@include file="infos.jsp"%>
					<c:choose>
						<c:when test="${pageA=='home' || pageA=='ex'  }">
							<script type="text/javascript">
								afficherH();
							</script>
							
							<c:choose>
								<c:when test="${pageA=='home'}">
										<script type="text/javascript">
											newproblem();
										</script>								
								</c:when>
								<c:otherwise>
										<script type="text/javascript">
											var id = "<c:out value="${id}" />";
											var langue = "<c:out value="${langue}" />";
											insererEx(id, langue);
										</script>
								</c:otherwise>
							
							</c:choose>					
						</c:when>
						<c:otherwise>
							<script type="text/javascript">
							afficherI();
							
							</script>

						</c:otherwise>

					</c:choose>
				</c:when>	



				<c:when test="${pageA == 'inscription'}">
					<%@include file="inscription.jsp"%>
				</c:when>
				
			
				
				
		</c:choose>

	<%! String[] lavue =AjouterExp.listIds();%>




		</div>


	</fmt:bundle>
<%! int m=0;  %>
</body>


</html>









