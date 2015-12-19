var originalBackground;
function toggleHighlight() {
    var pos = this.getAttribute('value');
    var color;
    switch (pos) {
        case 'nellNelson':
        color = '#A3C9A8';
        break;
        case 'workingGirl':
        color = '#FAF3DD';
        break;
        case 'female':
        color = '#FFAAEA';
        break;
        case 'male':
        color = '#B9CDDA';
        break; 
    }
    var status = this.checked;
    // the status to which you've just changed the checkbox
    var spans = document.getElementsByClassName(pos);
    for (var i = 0; i < spans.length; i++) {
        if (status == true) {
            spans[i].style.backgroundColor = color;
        } else {
            spans[i].style.backgroundColor = originalBackground;
        }
    }
}
function init() {
    originalBackground = document.body.style.backgroundColor;
    var checkboxes = document.getElementsByTagName('input');
    for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].addEventListener('click', toggleHighlight, false);
    }
}
window.addEventListener('DOMContentLoaded', init, false);
