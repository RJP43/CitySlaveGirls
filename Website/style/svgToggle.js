window.addEventListener('DOMContentLoaded',init,false);

function init() {

var buttons = document.getElementsByTagName("button")

var button1 = buttons[0]
button1.addEventListener('click',show_hide1,false);

var button2 = buttons[1]
button2.addEventListener('click',show_hide2,false);
}

function show_hide1() {
var p1 = document.getElementById("svg1Text")
    if (p1.style.display != "none")
    {p1.style.display = "none"}
    else
    {p1.style.display = "inline"}
}

function show_hide2() {
var p2 = document.getElementById("svg2Text")
    if (p2.style.display != "none")
    {p2.style.display ="none"}
    else
    {p2.style.display ="inline"}
}