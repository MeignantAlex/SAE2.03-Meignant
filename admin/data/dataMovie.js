let HOST_URL = "https://mmi.unilim.fr/~meignant3/SAE2.03-Meignant"; // CHANGE THIS TO MATCH YOUR CONFIG

let DataMovie = {};

/** 
* @param {*} fdata
* @returns
*/
 
DataMovie.add = async function(fdata){
    // fetch permet d'envoyer une requête HTTP à l'URL spécifiée. 
    // L'URL est construite en concaténant HOST_URL à "/server/script.php?direction=" et la valeur de la variable dir. 
    // L'URL finale dépend de la valeur de HOST_URL et de dir.
    let config = {
        method: "POST",
        body: fdata

    }

    let answer = await fetch(HOST_URL + "server/script.php?todo=updateMovie", config);
    let data = await answer.json();
    return data;
}

export {DataMovie};

