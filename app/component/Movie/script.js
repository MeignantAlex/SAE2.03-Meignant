let templateFile = await fetch("./component/Movie/template.html");
let template = await templateFile.text();
let templateFile2 = await fetch("./component/Movie/NoMovie.html"); 
let template2 = await templateFile2.text();  

let Movie = {};

Movie.format = function (handler, name, image) {
    let html = template;
    html = html.replace("{id}", handler);
    // html = html.replace("{{handler}}", handler);
    html = html.replace("{{name}}", name);
    html = html.replace("{{image}}", image);
    return html;
}

Movie.formatNoMovie = function () {
    let html = template2;
    return html;
}



export { Movie };
