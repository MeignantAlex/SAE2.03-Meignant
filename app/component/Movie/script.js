let templateFile = await fetch("./component/Movie/template.html");
let template = await templateFile.text();
 
let Movie = {};

Movie.format = function(Titre, Image){
    let html= template;
    html = html.replace('{{Titre}}', Titre);
    html = html.replace('{{Image}}', Image);
    return html;
}

export {Movie};
