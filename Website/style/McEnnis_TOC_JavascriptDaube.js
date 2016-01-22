function init() {
    var fieldset = document.getElementsByTagName('input');
    for (var i = 0; i < fieldset.length; i++) {
        fieldset[i].addEventListener('click', toggle, false);
    }
}

function toggle() {
    var id = this.id;
    switch (id) {
        case "conds": {
            var conds = document.getElementsByClassName("conds");
            for (var i = 0; i < conds.length; i++) {
                conds[i].classList.toggle("on")
            }
        };
        break;
        case "workers": {
            var workers = document.getElementsByClassName("workers");
            for (var i = 0; i < workers.length; i++) {
                workers[i].classList.toggle("on")
            }
        };
        break;
        case "wages": {
            var wages = document.getElementsByClassName("wages");
            for (var i = 0; i < wages.length; i++) {
                wages[i].classList.toggle("on")
            }
        };
        break;
        case "laborLaws": {
            var wages = document.getElementsByClassName("laborLaws");
            for (var i = 0; i < wages.length; i++) {
                wages[i].classList.toggle("on")
            }
        };
        break;
        case "nelsonRef": {
            var wages = document.getElementsByClassName("nelsonRef");
            for (var i = 0; i < wages.length; i++) {
                wages[i].classList.toggle("on")
            }
        };
        break;
    }
  }

window.onload = init;