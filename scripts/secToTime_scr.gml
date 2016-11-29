{
    //decToSec_scr(num)
    //converts seconds to min:sec
    //returns string
    
    var num = argument0;
    /*var m = floor(num/60);
    var s = num - m*60;
    if (m < 10 && s) { m = "0"+string(m);}
    if (s) {
        if (s < 10) { s = "0"+string(s);}
        return m+":"+string(s);
    }
    return string(m);*/
    var converted = "";
    var i = -1;
    while (num > 0) {
        i++;
        if (converted != "") {
            converted = ":"+converted;
        }
        var unit;
        switch(i){
            case 0:
                unit = num%60;
                num = floor(num/60);
                break;
            case 1:
                unit = num%60;
                num = floor(num/60);
                break;
            case 2:
                unit = num%24;
                num = floor(num/24);
                break;
            default:
                unit = num;
                num = 0;
                break;
        }
        if (unit || converted != "") {
            converted = string(unit)+converted;
            if (num > 0 && unit < 10) {
                converted = "0"+converted;
            }
        }
    }
    switch(i){
        case 0: converted += " sec"; break;
        case 1: converted += " min"; break;
        case 2: converted += " hour"; break;
        case 3: converted += " day"; break;
    }
    return converted;
}

