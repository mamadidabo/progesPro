<script src='satrennespagui_javascript/gui.js'></script>
<script >
var popup = "";
window.onbeforeunload = function (e)
{
	sauvInput();
	
}


function changer(div)
{
		
		fermer();
		if(div != popup )
		{
			popup = div;
			document.getElementById(div).style.display= "block";
		}
		
		else
			{			
				popup = "";
			}
		
	
	
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

function sauvInput()
{
	var form = document.getElementById("formulaire_satisfiabilite");
	var donnee = "";
	for (i=0 ; i<= form.length-1 ; i++)
	{
			
	 if (form[i].type == 'text')
	 {
		
		 var id = form[i].name;
		 donnee =donnee+$("#" + id).val() + "/";
	 }
	}
	
	window.name= donnee;
}


function langue(lg)
{
	
	sauvInput();
	location.href="index.jsp?language=" + lg;
	
	
}

function initPage()
{
	cache = window.name;
	var input = cache.split("/");
	var nb = input.length;		
									
	for (var i = 1 ; i<= nb -1; i++) //les 2 dernier input sont vide .
		{
		
		if($("#textBox" + i).val() == undefined)
			{		
				ajoutInput();
			}
		else
			{
			incrementNbInput();	//	 le comptage est apres le chargement de la page ...
			}
		$("#textBox" + i).val(input[i-1]);
		updateLaTeX(input[i-1],'textBox'+ i);    
					
		}
	
}					
			

</script>