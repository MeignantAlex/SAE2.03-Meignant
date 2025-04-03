let templateFile = await fetch("./component/Movie/template.html");
let template = await templateFile.text();
 
let Movie = {};

Movie.format = function(Titre, Image){
    let html= template;
    html = html.replace('{{Titre}}', Titre);
    html = html.replace('{{Image}}', Image);
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
