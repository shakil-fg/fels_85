var tracker;
var questions_limit = 20;
$(document).ready(
    function() { sessionStorage.setItem("tracker", 1);
    setBlocksVisibility();
    });

function setBlocksVisibility() {
    var current, i;
    current = sessionStorage.getItem("tracker");
    for(i=1; i<=questions_limit; i++){
        if(i!=current){$("#"+i).hide();}
        else{$("#"+i).show();}
    }
}

$(document).ready(function(){
    $("input").click(function(){
        var current = sessionStorage.getItem("tracker");
        if(current==questions_limit){ sessionStorage.removeItem("tracker");
                $("form").submit();
        }
        else{
            sessionStorage.setItem("tracker", parseInt(sessionStorage.getItem("tracker"))+1);
            setBlocksVisibility();
        }
    });
});