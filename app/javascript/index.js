var ready=function(){

};

$(document).ready(ready);

document.addEventListener("turbo:load", ready);

document.addEventListener("DOMContentLoaded", (event) => {
    Rails.start();
});
