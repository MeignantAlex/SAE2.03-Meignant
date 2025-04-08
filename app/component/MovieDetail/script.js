let templateFile = await fetch("./component/MovieDetail/template.html");
let template = await templateFile.text();

let MovieDetail = {};

MovieDetail.format = function (image, name, year, category, description, director, min_age, trailer) {
    let html = template;
    html = html.replace("{{image}}", image);
    html = html.replace("{{name}}", name);
    html = html.replace("{{year}}", year);
    html = html.replace("{{category}}", category);
    html = html.replace("{{description}}", description);
    html = html.replace("{{director}}", director);
    html = html.replace("{{min_age}}", min_age);
    html = html.replace("{{trailer}}", trailer);
    return html;
}

export { MovieDetail };