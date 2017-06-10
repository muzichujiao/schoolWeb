
$(document).ready(function () {
    $(".introduct-basicInfor").each(function () {
        var introductbasicW = 0;
        var introductbasich1 = $(this).children("h1").width();
        var introductbasich2 = $(this).children("h2").width();
        if (introductbasich1 > introductbasich1)
            introductbasicW = introductbasich1;
        else introductbasicW = introductbasich2;
       
        if (introductbasicW == 325) {
            var introducttitleCont = introductbasicW + 235 + "px";
        }
       else  var introducttitleCont = introductbasicW + 125 + "px";
        $(this).parent("div").css("width", introducttitleCont);
    })



});

