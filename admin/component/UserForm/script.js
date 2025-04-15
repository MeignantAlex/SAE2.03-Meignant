let templateFile = await fetch('./component/UserForm/template.html');
let template = await templateFile.text();

let UserForm = {}

UserForm.format = function (addu){
    let html= template;
    html = html.replace('{{addu}}', addu);
    return html;
}



export {UserForm};