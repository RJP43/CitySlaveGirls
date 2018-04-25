/*function myFunction() {
    var x = document.getElementById("CSGimages");
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
    }
    function myFunction2() {
    var x = document.getElementById("CSGtext");
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}*/
/*$(window).load(function(){        
   $('#myModal').modal('show');
});*/
$(function() {
    $.fn.showField = function() {
        var selectVal = document.getElementById(this.val() + 'Div');
        return this.each(function() {
            $(selectVal).show().siblings('div').hide();
        });
    };    
    $('select#panelsSelect').change(function() {
        $(this).showField();
    });
});
$(function() {
    $.fn.showField = function() {
        var selectVal = document.getElementById(this.val() + 'Div');
        return this.each(function() {
            $(selectVal).show().siblings('div').hide();
        });
    };    
    $('select#panelsSelect2').change(function() {
        $(this).showField();
    });
});
$(function() {
    $.fn.showField = function() {
        var selectVal = document.getElementById(this.val() + 'Div');
        return this.each(function() {
            $(selectVal).show().siblings('div').hide();
        });
    };    
    $('select#panelsSelect3').change(function() {
        $(this).showField();
    });
});
$(function() {
    $.fn.showField = function() {
        var selectVal = document.getElementById(this.val() + 'Div');
        return this.each(function() {
            $(selectVal).show().siblings('div').hide();
        });
    };    
    $('select#panelsSelect4').change(function() {
        $(this).showField();
    });
});