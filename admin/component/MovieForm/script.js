let templateFile = await fetch('./component/MovieForm/template.html');
let template = await templateFile.text();


let MovieForm = {};

MovieForm.format = function(handlerSubmit, handlerSelect){
    let html= template;
    html = html.replace('{{handler}}', handler);
    return html;
}

export {NewMenuForm};

