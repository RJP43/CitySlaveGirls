function init() {
    var checks= document.getElementsByTagName("input");
    for (var i = 0; i < checks.length; i++)
    checks[i].addEventListener('click', toggle, false);
}

function toggle() {
    clear()
   var id = this.id;
    switch (id) {
     case "sarcasmWit": {
            var sarcs = document.getElementsByClassName("sarcasmWit");
            for (var i = 0; i < sarcs.length; i++) {
                sarcs[i].classList.toggle("on")
            }
        };
        break;
        case "prayer": {
            var prays = document.getElementsByClassName("prayer");
            for (var i = 0; i < prays.length; i++) {
                prays[i].classList.toggle("on")
            }
        };
        break;
        case "sexual": {
            var sexuals = document.getElementsByClassName("sexual");
            for (var i = 0; i < sexuals.length; i++) {
                sexuals[i].classList.toggle("on")
            }
        };
                break;
        case "pity": {
            var pity = document.getElementsByClassName("pity");
            for (var i = 0; i < pity.length; i++) {
                pity[i].classList.toggle("on")
            }
        };
                break;
        case "woe": {
            var woes = document.getElementsByClassName("woe");
            for (var i = 0; i < woes.length; i++) {
                woes[i].classList.toggle("on")
            }
        };
                break;
        case "positive": {
            var pos = document.getElementsByClassName("positive");
            for (var i = 0; i < pos.length; i++) {
                pos[i].classList.toggle("on")
            }
        };
                break;
        case "negative": {
            var neg = document.getElementsByClassName("negative");
            for (var i = 0; i < neg.length; i++) {
                neg[i].classList.toggle("on")
            }
        };
                break;
        case "offended": {
            var offended = document.getElementsByClassName("offended");
            for (var i = 0; i < offended.length; i++) {
                offended[i].classList.toggle("on")
            }
        };
                break;
        case "descriptionNeutral": {
            var desc = document.getElementsByClassName("descriptionNeutral");
            for (var i = 0; i < desc.length; i++) {
                desc[i].classList.toggle("on")
            }
        };
                break;
        case "intimidated": {
            var intim = document.getElementsByClassName("intimidated");
            for (var i = 0; i < intim.length; i++) {
                intim[i].classList.toggle("on")
            }
        };
                break;
        case "angry": {
            var angry = document.getElementsByClassName("angry");
            for (var i = 0; i < angry.length; i++) {
                angry[i].classList.toggle("on")
            }
        };
    }
  }

function clear() {
    var radios= document.querySelectorAll("g > g");
    /*g > g specifies only g's that are immediate children of g's (not all descendents which would be g g */
    for (var j=0; j< radios.length; j++)
        radios[j].classList.remove("on")

}

window.onload = init;