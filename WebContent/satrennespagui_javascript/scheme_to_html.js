	

     
            var parenthese = 0;
     
    //methode mere rafraishissant le code latex tout en le convertissant
    function updateLaTeX(schemeExpression,id)
    {
            //si le contenu de l'input est correct
            refresh(schemeExpression , id ) ;
            compteurscheme();
    }
     
     
    //methode fille raffraichissant l'affichage du code LaTeX
    function refresh(value, id)
    {
            if (value != "")
            {
                    document.getElementById('divLaTeX' + id).innerHTML = schemeExpressionToHTML(value);
     
            }
            else
            {
                    document.getElementById('divLaTeX' + id).innerHTML = "";
            }
    }
     
    function compteurscheme() {
            for(var i=1;i<=getNbInput();i++)
            {                      
                    //on remplace en codage html correct le contenu des inputs
                    var contenuInput = updateHTML(document.getElementById("formulaire_satisfiabilite").elements['textBox'+i].value);                       
                    for(var j=0;j<=contenuInput.length;j++){
                            if(contenuInput.charAt(j) == ")"){
                                    parenthese--;
                            }
                            if(contenuInput.charAt(j) == "("){
                                    parenthese++;
                            }
                    }
                    if(parenthese != 0){
                            if(parenthese > 0){
                                    afficheErreur("Il manque "+parenthese+" parentheses fermantes a la ligne "+i+" ! <br>");
                            }else{
                                    parenthese = Math.abs(parenthese);
                                    afficheErreur("Il manque "+parenthese+" parentheses ouvrantes a la ligne "+i+" ! <br>");
                            }
                            parenthese =0;
                    }
            }
    }
     
     
     
     
     
     
    function schemeExpressionToHTML(schemeExpression)
    {
     
            return schemeParsedExpressionToHTML(scheme.parse(schemeExpression));
     
    }
     
     
     
     
    function schemeParsedExpressionToHTML(R)
    {
            if(R instanceof Array)
            {
                    if(R[0] == 'bigand' && R.length==4)
                            return createHTMLBigConstruction4('\\bigwedge', R);
                    else if(R[0] == 'bigand' && R.length==5)
                            return createHTMLBigConstruction5('\\bigwedge', R);
                    else if(R[0] == 'bigor' && R.length==4)
                            return createHTMLBigConstruction4('\\bigvee', R);
                    else if(R[0] == 'bigor' && R.length==5)
                            return createHTMLBigConstruction5('\\bigvee', R);
                    else if(R[0] == 'bigxor' && R.length==4)
                            return createHTMLBigConstruction4('\\bigoplus', R);
                    else if(R[0] == 'bigxor' && R.length==5)
                            return createHTMLBigConstruction5('\\bigoplus', R);
     
     
                    else
                    {
                            return "(" + treatMultipleSchemeParsedExpressions(R, ' ') + ")";
     
                    }
     
            }
            else
            {
                    return textToImage(R);
                    //return R;
            }
    }
     
     
     
    function treatMultipleSchemeParsedExpressions(R, separator)
    {
            var s = '';
            for(var i in R)
            {
                    if(s != '') s += separator;
                    s += schemeParsedExpressionToHTML(R[i]);
            }
     
            return s;
    }
     
     
    function createHTMLBigConstruction(bigsymbol, blablaindices, rest)
    {
            return '<table style="white-space: nowrap; word-wrap: break-word">' +
            '<tr> <td align="center" >' + bigsymbol + '</td>' +
            '<td rowspan="2">' + rest + '</td> </tr>' +
            '<tr> <td  align="center" nowrap="wrap" style="max-width:2000px; word-wrap: break-word">' + blablaindices +
            '</td></tr>' +
            '</table>';
    }
     
     
    function createHTMLBigConstruction4(latexbigsymbol, R)
    {
            return createHTMLBigConstruction(latexize(latexbigsymbol),
     
                            schemeParsedExpressionToHTML(R[1]) +
                            latexize('\\in \\{') +
                            treatMultipleSchemeParsedExpressions(R[2], ', ') +
                            latexize('\\}'),
     
                            schemeParsedExpressionToHTML(R[3]));
    }
     
     
    function createHTMLBigConstruction5(latexbigsymbol, R)
    {
            return createHTMLBigConstruction(latexize(latexbigsymbol),
     
                            schemeParsedExpressionToHTML(R[1]) +
                            latexize('\\in \\{') +
                            schemeParsedExpressionToHTML(R[2]) +
                            latexize('\\} \\mid  ') +
                            schemeParsedExpressionToHTML(R[3]),
     
     
                            schemeParsedExpressionToHTML(R[4]));
    }
     
     
     
    function latexize(latexcode)
    {
            return "<img src=\'http://latex.codecogs.com/gif.latex?" + latexcode + "\' border=\'0\'/>";
    }
     
     
     
     
     
     
     
    /*function schemeExpressionToHTML(schemeExpression)
                    {
     
     
                      var latex = schemeExpressionToLaTeX(value);
                      return "<div> <img src=\'http://latex.codecogs.com/gif.latex?" + latex + "\' border=\'0\'/> </div>";
     
                    }*/
     
     
     
     
     
     
    function codeForImage(url)
    {
            return "<img src=\'" + url + "\'>";
    }
     
     
     
     
     
     
    function textToImage(schemeExpression)
    {
            if(!(typeof schemeExpression == 'string'))
                    return schemeExpression;
            else
                    return schemeExpression
     
     
                    .replace(/or/g,                                                  latexize("\\vee"))
                    .replace(/not/g, latexize("\\neg"))
                    .replace(/diff/g,       latexize("\\neq"))
                    .replace(/bigand/g,     latexize("\\bigwedge"))
                    .replace(/and/g,                 latexize("\\wedge"))
                    .replace(/bigxor/g,              latexize("\\bigoplus"))
                    .replace(/bigand/g,             latexize("\\bigwedge"))
                    .replace(/xor/g,                 latexize(      "\\oplus"))
                    .replace(/bigor/g,               latexize(      "\\bigvee"))
     
                    .replace(/imply/g,                       latexize("\\rightarrow"))
                    .replace(/equiv/g,                       latexize("\\leftrightarrow"))
     
     
                    .replace(/sun|sun()$/g, codeForImage('icons/weather/sun.png'))
                    .replace(/cloud|cloud()$/g, codeForImage('icons/weather/cloud.png'))
                    .replace(/rain|rain()$/g,codeForImage('icons/weather/rain.png'))
                    .replace(/snow|snow()$/g, codeForImage('icons/weather/snow.png'))
                    .replace(/thunder|thunder()$/g,  codeForImage('icons/weather/thunder.png'))
     
     
                    .replace(/Russie|Russie()$/g, codeForImage('icons/flags/Russie.png'))
                    .replace(/USA|USA()$/g, codeForImage('icons/flags/USA.png'))
                    .replace(/Angleterre|Angleterre()$/g, codeForImage('icons/flags/Angleterre.png'))
                    .replace(/France|France()$/g, codeForImage('icons/flags/France.png'))
                    .replace(/Luxembourg|Luxembourg()$/g,   codeForImage('icons/flags/Luxembourg.png'))
                    .replace(/Suisse|Suisse()$/g,   codeForImage('icons/flags/Suisse.png'))
                    .replace(/Belgique|Belgique()$/g,   codeForImage('icons/flags/Belgique.png'))
                    .replace(/Allemagne|Allemagne()$/g,   codeForImage('icons/flags/Allemagne.png'))
                    .replace(/Autriche|Autriche()$/g,   codeForImage('icons/flags/Autriche.png'))
                    .replace(/Italie|Italie()$/g,    codeForImage('icons/flags/Italie.png'))
                    .replace(/loup|loup()$/g,       codeForImage('icons/CHL/loup.png'))
                    .replace(/mouton|mouton()$/g,    codeForImage('icons/CHL/mouton.png'))
                    .replace(/chou|chou()$/g,       codeForImage('icons/CHL/chou.png'))
                    .replace(/barque|barque()$/g,    codeForImage('icons/CHL/barque.png'))
     
                    .replace(/Blanc|Blanc()$/g,     codeForImage('icons/couleurs/Blanc.png'))
                    .replace(/Bleu|Bleu()$/g,       codeForImage('icons/couleurs/Bleu.png'))
                    .replace(/Jaune|Jaune()$/g,     codeForImage('icons/couleurs/Jaune.png'))
                    .replace(/Orange|Orange()$/g,    codeForImage('icons/couleurs/Orange.png'))
                    .replace(/Rouge|Rouge()$/g,     codeForImage('icons/couleurs/Rouge.png'))
                    .replace(/Vert|Vert()$/g,       codeForImage('icons/couleurs/Vert.png'))
     
                    .replace(/birthday|birthday()$/g,   codeForImage('icons/calendar/birthday.png'))
                    .replace(/cinema|cinema()$/g,    codeForImage('icons/calendar/cinema.png'))
                    .replace(/compta|compta()$/g,    codeForImage('icons/calendar/compta.png'))
                    .replace(/dessin|dessin()$/g,    codeForImage('icons/calendar/dessin.png'))
                    .replace(/lettres|lettres()$/g,    codeForImage('icons/calendar/lettres.png'))
                    .replace(/maths|maths()$/g,     codeForImage('icons/calendar/maths.png'))
                    .replace(/musique|musique()$/g,    codeForImage('icons/calendar/musique.png'))
                    .replace(/philo|philo()$/g,     codeForImage('icons/calendar/philo.png'))
                    .replace(/poterie|poterie()$/g,    codeForImage('icons/calendar/poterie.png'))
                    .replace(/theatre|theatre()$/g,    codeForImage('icons/calendar/theatre.png'))
     
                    ;
     
    }

