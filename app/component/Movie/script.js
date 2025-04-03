let templateFile = await fetch("./component/Movie/template.html");
let template = await templateFile.text();
 
let Main = {};

Main.format = function(movie){
    let html= template;
    html = html.replace('{{Titre}}', movie.Titre);
    html = html.replace('{{Image}}', movie.Image);
    return html;
}

Main.formatMany = function(movies){
    let html = '';
    for (const movie of movies) {
        html += Menu.format(movie);
    }
    return html;
}
export {Movie};
