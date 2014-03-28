<script src='satrennespagui_javascript/gui.js'></script>
<script >
var popup = "";
function changer(div)
{
	if(popup != "" )
		{
		document.getElementById(popup).style.display= "none";
		}
	
		document.getElementById(div).style.display= "block";	
		popup = div;
	
	
	}

function afficherH()
{
	document.getElementById("home").style.display= "block";		
	document.getElementById("infos").style.display="none";
}
function afficherI()
{
	document.getElementById("infos").style.display= "block";		
	document.getElementById("home").style.display="none";
}

function insererExH(id)
{

	var langue = "<c:out value="${langue}" />";
	var pageA = "<c:out value="${pageA}" />";	

	if(pageA == 'home'|| pageA == 'ex' ||pageA == 'infos')
		{
			afficherH();
			insererEx(id, langue);
		}
	else
		{
		document.location.href="index.jsp?pageA=ex&id="+id;			
		}

}

function np()
{

	var pageA = "<c:out value="${pageA}" />";	
	if(pageA == 'home'|| pageA == 'ex' ||pageA == 'infos')
		{
		afficherH();
		newproblem();		
		}
	else
		{
		document.location.href="index.jsp?pageA=home";			
		}

}

function infos()
{
	var pageA = "<c:out value="${pageA}" />";	
	if(pageA == 'home'|| pageA == 'ex' ||pageA == 'infos')
	{
		afficherI();
	}
	else
	{
		document.location.href="index.jsp?pageA=infos";			
	}

}
function affichage(div)
{
	if (document.getElementById(div).style.display=="none")

		{
		document.getElementById(div).style.display= "block";		


		}

	else
		{
		document.getElementById(div).style.display="none";
		}

	}
</script>