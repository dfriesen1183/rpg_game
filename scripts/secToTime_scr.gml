{
    //decToSec_scr(num)
    //converts seconds to min:sec
    //returns string
    
    var num = argument0;
    var m = floor(num/60);
    var s = num - m*60;
    if (m < 10 && s) { m = "0"+string(m);}
    if (s) {
        if (s < 10) { s = "0"+string(s);}
        return m+":"+string(s);
    }
    return string(m);
}

