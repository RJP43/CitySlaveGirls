function init() {
    var checks= document.getElementsByTagName("input");
    for (var i = 0; i < checks.length; i++)
    checks[i].addEventListener('click', toggle, false);
}

function toggle() {
    clear()
   var id = this.id;
    switch (id) {
     case "CT": {
            var cts = document.getElementsByClassName("CT");
            for (var i = 0; i < cts.length; i++) {
                cts[i].classList.toggle("on")
            }
        };
        break;
        case "WSGC": {
            var wsgcs = document.getElementsByClassName("WSGC");
            for (var i = 0; i < wsgcs.length; i++) {
                wsgcs[i].classList.toggle("on")
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