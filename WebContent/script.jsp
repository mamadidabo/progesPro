<script src='satrennespagui_javascript/gui.js'></script>
<script >
var popup = "";
function changer(div)
{
		fermer();
		document.getElementById(div).style.display= "block";	
		popup = div;
	
	
	}

function affichage_popup(nom_de_la_page, nom_interne_de_la_fenetre) {
	window
			.open(
					nom_de_la_page,
					nom_interne_de_la_fenetre,
					config = 'height=600, width=400, toolbar=no, menubar=no, scrollbars=no, location=no, directories=no, status=no')
}



function insererExH(id)
{

fermer();	
var langue = "<c:out value="${language}" />";
insererEx(id, langue);

}

function updateLaTexH(value,id)
{
var langue = "<c:out value="${language}" />";
updateLaTeX(id, value, langue);
}



function np()
{
	fermer();
	newproblem();	
}


function fermer()
{
	if(popup != "" )
	{
	document.getElementById(popup).style.display= "none";
	}	
	
}
	
</script>