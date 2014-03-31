	

     
    var nbInput = 0;
    //variable globale stockant le nombre d'inputs pr√©sents dans la page
    window.onload = function(){nbInput = compterNbInput();};
    //variable globale stockant le dernier input ayant eu le focus pour retenir dans quelle textBox ajouter le contenu du bouton lors d'un clic sur ce bonton
    var focusedInput = "textBox1";
     
    function incrementNbInput()
    {
            nbInput++;
    }
    function decrementNbInput()
    {
            nbInput--;
    }
    function getNbInput()
    {
            return nbInput;
    }
     
     
    function getFocusedInput()
    {
            return focusedInput;
    }
    function setFocusedInput(id)
    {
            focusedInput=id;
    }
     
     
     
    //m√©thode servant √  ins√©rer la valeur des boutons dans l'input ayant le focus
    function insertValue(chaineAj)
    {
            var myForm = document.getElementById("formulaire_satisfiabilite").elements[getFocusedInput()];
     
    //      IE support
            if (document.selection)
            {
                    myForm.focus();
                    sel = document.selection.createRange();
                    sel.text = chaineAj;
            }
    //      MOZILLA/NETSCAPE support
            else if (document.getElementById("formulaire_satisfiabilite").elements[getFocusedInput()].selectionStart || document.getElementById("formulaire_satisfiabilite").elements[getFocusedInput()].selectionStart == "0")
            {
                    var startPos = document.getElementById("formulaire_satisfiabilite").elements[getFocusedInput()].selectionStart;
                    var endPos = document.getElementById("formulaire_satisfiabilite").elements[getFocusedInput()].selectionEnd;
                    var chaine = document.getElementById("formulaire_satisfiabilite").elements[getFocusedInput()].value;
                    myForm.value = chaine.substring(0, startPos) + chaineAj + chaine.substring(endPos, chaine.length);
            }
            else
            {
                    myForm.value += chaineAj;
            }
    //      on fait un update de l'input ayant eu le dernier focus
            updateLaTeX(myForm.value,getFocusedInput());   
    }
     
     
     
     
     
     
     
     
     
    //function to initialize a new problem
    function newproblem()
    {
    		deleteAllIput();
            viderNbInput(1);
            ajoutInput();
            ajoutInput();
            afficheDescription("New problem", "");
     
    }
     
     
     
     
    function setFormula(i, text)
    {
            document.getElementById("formulaire_satisfiabilite").elements['textBox' + i].value= text;
            updateLaTeX(text,'textBox' + i);
     
    }
     
     
     
     
     
     
     
     
     
    function deleteAllInput()
    {
    //      On supprime les inputs jusqu'√  ce qu'il n'en reste aucun
            while(getNbInput()!=1)
            {
                    supprTextBox("ligne"+getNbInput());
            }
    }
     
    //Ajout d'un nombre pr√©cis textBox dans la page index
    function setNbInput(nombreInput)
    {
    //      on supprime toutes les autres
            deleteAllInput();
    //      puis on ajoute le nombre ad√©quat d'inputs
            for(var i=1;i<=nombreInput;i++)
            {
                    ajoutInput();
            }
    }
     
    //Chargement du tableau uniquement si tout est bien charge
    $(function (){
            $(document).ready(function(){
                    var i=0;
                    var bool=true;
                    if($("#nonSAT").length){
                            $('#divResult').attr("style","display:yes");
                    }
                    else{
                            while($("#result"+i).length)
                            {
                                    if($("#result"+i).load){
                                    }
                                    else{
                                            bool = false;  
                                    }      
                                    i++;
                            }
                            if (bool==true){
                                    $('#divResult').attr("style","display:yes");
                            }
                    }
            });
    });
     
    //Ajout d'une textBox dans la page index
    function ajoutInput()
    {      
            incrementNbInput();
    //      initialisation de la div ainsi que de son contenu
            var string = "";       
            string += "<div class='span8' id='ligne"+getNbInput()+"'"+">";
            string +=       "<input type='text' id='textBox"+getNbInput()+"'"+" name='textBox"+getNbInput()+"' " + " value='' onchange='updateLaTeX(this.value,this.id);' onclick='fermeture();setFocusedInput(this.id);updateLaTeX(this.value,this.id)' onkeyup='updateLaTeX(this.value,this.id);' onkeydown='fermeture()'/>";
            string += " <a class='btn btn-danger' id='boutonSuppr"+getNbInput()+"'"+"href='javascript:supprTextBox(\"ligne"+getNbInput()+"\")'><i class='icon-white icon-remove'></i></a>";
            string += "<div id='divLaTeXtextBox"+getNbInput()+"'"+"></div>";
            string += "</div>";
            $('#champsText').append(string); //insertion des nouvelles lignes a la fin de la div champsText
    }
     
     
    //supprimer textBox
    function supprTextBox(maDiv)
    {
    //      on rÈcupere le numÈro de la Div
            var numDiv=parseInt(maDiv.substring(5));
     
            if(compterNbInput()!=1){
                    for(var i=numDiv+1;i<=getNbInput();i++)
                    {
                            $('#ligne'+i).attr('id','ligne'+(i-1));
                            $('#textBox'+i).attr('name','textBox'+(i-1));
                            $('#textBox'+i).attr('id','textBox'+(i-1));
                            $('#boutonSuppr'+i).attr('href','javascript:supprTextBox("ligne'+(i-1)+'"'+')');
                            $('#boutonSuppr'+i).attr('id','boutonSuppr'+(i-1));
                            $('#divLaTeXtextBox'+i).attr('id','divLaTeXtextBox'+(i-1));
                    }
                    $('#'+maDiv).remove();
                    decrementNbInput();
            }
            else{
                    afficheErreur("Vous devez garder au moins un champ texte !");
            }
    }
     
    //Vider un nombre defini de textBox de la page index
    function viderNbInput(nbInput) {
            for(var i=1;i<=nbInput;++i)
            {
    //              on vide l'input
                    document.getElementById("formulaire_satisfiabilite").elements['textBox'+i].value= "";
    //              puis on rafraichit l'affichage latex
                    updateLaTeX("",'textBox'+i);
            }
    }
     
     
     
    //Comptage du nombre de textBox actuel
    function compterNbInput()
    {
            var cpt=1;
            while($('#ligne'+cpt).length)
            {
                    cpt++;
            }
            return cpt-1;
    }
     
     
    //changement de page Ajax
    function changePage(monUrl)
    {
            $.ajax({
                    url: monUrl,
                    type: 'GET',
                    datatype:'html',
                    success : function(code_html, statut){
                            $("#page-content").append(code_html);
                    },
                    error : function(resultat, statut,erreur){
                            $("#page-content").append(code_html);
                    }
            });
    }
     
     
     
    //fonction permettant d'encoder au format HTML les caracteres sp√©ciaux contenus dans les inputs
    function updateHTML(schemeExpression)
    {
            return encodeURI(schemeExpression)
            .replace( /,/g, "%2C" )
    //      slash ?
            .replace( /[?]/g, "%3f" )
            .replace( /:/g, "%3a" )
            .replace( /@/g, "%40" )
            .replace( /&/g, "%26" )
            .replace( /=/g, "%3d" )
            .replace( /[+]/g, "%2b" )
            .replace( /[$]/g, "%24" )
            .replace( /#/g, "%23" );
    }
     
    //gestion des messages d'erreur
    function afficheErreur(monMessage){
            $("#ErrorOrDescriptionDiv").attr('class','alert alert-danger');
            $("#ErrorOrDescriptionDiv").append(monMessage);
            $("#ErrorOrDescriptionDiv").fadeIn(300);
    }      
     
    function fermeture(){
            $("#ErrorOrDescriptionDiv").empty();
            $("#ErrorOrDescriptionDiv").fadeOut(100);
    }      
     
     
    //gestion des descriptions d'exemples
    function afficheDescription(monExemple, maDescription){
            $("#ErrorOrDescriptionDiv").attr('class','alert alert-info');
            var string="<h2>"+monExemple+"</h2>"+"<p>"+maDescription+"</p>";
            $("#ErrorOrDescriptionDiv").html(string);
            $("#ErrorOrDescriptionDiv").fadeIn(1000);
    }      
     
     
     
    //changement de langue
    function changeLangue(){
            if($("#btnChangeLangue").html()=='English'){
                    $("#infosFran").hide();
                    $("#infosEng").show();
                    $("#btnChangeLangue").html('Fran&ccedil;ais');
            }
            else{
                    $("#infosEng").hide();
                    $("#infosFran").show();
                    $("#btnChangeLangue").html('English');
            }
    }
     
     
     
     
     
     
    //fenetre affichant la page result.jsp sous forme de popUp
    function afficheResult()
    {
    //      value contient le contenu de GET
            var value = "?";
            if($("#textBox1").val()){
                    for(var i=1;i<=getNbInput();i++)
                    {      
    //                      on remplace en codage html correct le contenu des inputs
                            var contenuInput = updateHTML(document.getElementById("formulaire_satisfiabilite").elements['textBox'+i].value);
    //                      puis on met au format textbox1=(...)&textbox2=(...)textbox3=(...) ...
                            value += document.getElementById("formulaire_satisfiabilite").elements['textBox'+i].id + "=" + contenuInput + "&";
                    }
                    value+="compteurErreur=1&nbInput="+getNbInput();
     
    //              au final on a value = result.jsp?textBox1=(...)&textBox2=(...) ... &compteurErreur=1&nbInput=(nombre d'inputs)
     
    //              on ouvre la fenetre popup
                    window.open('result.jsp' + value, "Resultat", "location=1, status=1, scrollbars=1, width=800, height=455");
            }
            else{
                    afficheErreur("Vous devez remplir au moins le 1er champ texte !");
            }
    }

