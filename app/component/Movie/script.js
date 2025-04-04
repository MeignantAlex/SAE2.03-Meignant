let templateFile = await fetch("./component/Movie/template.html");
let template = await templateFile.text();


let Movie = {};

Movie.format = function (name, image) {
    let html = template;
    html = html.replace("{{name}}", name);
    html = html.replace("{{image}}", image);
    return html;
}




export { Movie };
