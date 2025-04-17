// URL où se trouve le répertoire "server" sur mmi.unilim.fr
let HOST_URL = "https://mmi.unilim.fr/~meignant3/SAE2.03-Meignant";//"http://mmi.unilim.fr/~????"; // CHANGE THIS TO MATCH YOUR CONFIG

let DataMovie = {};


DataMovie.request = async function(){
    // fetch permet d'envoyer une requête HTTP à l'URL spécifiée. 
    // L'URL est construite en concaténant HOST_URL à "/server/script.php?direction=" et la valeur de la variable dir. 
    // L'URL finale dépend de la valeur de HOST_URL et de dir.
    let answer = await fetch(HOST_URL + "/server/script.php?todo=movie");
    // answer est la réponse du serveur à la requête fetch.
    // On utilise ensuite la méthode json() pour extraire de cette réponse les données au format JSON.
    // Ces données (data) sont automatiquement converties en objet JavaScript.
    let data = await answer.json();
    // Enfin, on retourne ces données.
    return data;
}


DataMovie.requestMovieDetail = async function($id){
    let answer = await fetch(HOST_URL + "/server/script.php?todo=movieDetails&id=" + $id);
    let data = await answer.json();
    return data;
}

/*DataMovie.requestMovieCategory = async function () {
    let answer = await fetch(HOST_URL + "/server/script.php?todo=category");
    let data = await answer.json();
    return data; 
};*/


DataMovie.requestCat = async function (cat) {
    let answer2 = await fetch(
      HOST_URL + "/server/script.php?todo=readMoviesCat&category=" + cat
    );
    let data2 = await answer2.json();
    return data2;
  };

export {DataMovie};



 