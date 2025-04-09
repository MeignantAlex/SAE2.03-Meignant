let templateFile = await fetch("./component/MovieDetail/template.html");
let template = await templateFile.text();

let MovieDetail = {};

MovieDetail.format = function (obj) {
    let html = template;
    html = html.replace("{{image}}", obj.image);
    html = html.replace("{{name}}", obj.name);
    html = html.replace("{{year}}", obj.year);
    html = html.replace("{{category}}", obj.category);
    html = html.replace("{{description}}", obj.description);
    html = html.replace("{{director}}", obj.director);
    html = html.replace("{{min_age}}", obj.min_age);
    html = html.replace("{{trailer}}", obj.trailer);
    return html;
}

export { MovieDetail };