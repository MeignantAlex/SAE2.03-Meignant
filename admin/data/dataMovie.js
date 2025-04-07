let HOST_URL = "https://mmi.unilim.fr/~meignant3/SAE2.03-Meignant"; // CHANGE THIS TO MATCH YOUR CONFIG

let DataMovie = {};


 
DataMovie.add = async function(){
    let fdata = new FormData();
    
    let config = {
        method: "POST",
        body: fdata

    }

    let answer = await fetch(HOST_URL + "server/script.php?todo=update", config);
    let data = await answer.json();
    return data;
}

export {DataMovie};

