
let templateFile = await fetch("./component/MovieCategory/template.html");
let template = await templateFile.text();

let MovieCategory = {};

MovieCategory.format = function (movies) {
    let resultHTML = "";
    for (let movie of movies) {
        let html = template;
        html = html.replace("{id}", movie.id);
        html = html.replace("{{image}}", movie.image);
        html = html.replace("{{name}}", movie.name);
        resultHTML += html;
    }
    return resultHTML;
    
};



export { MovieCategory };


