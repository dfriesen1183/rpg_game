{
    var time = argument0;
    var largestUnit = argument1; //0=s, 1=m, 2=h...
    
    var formatted = "";
    var toAdd;
    for (var i=0; time > 0 || i <= largestUnit; i++) {
        if (i > 0) formatted = ":"+formatted;
        switch(i) {
            case 0:
                toAdd = time%60;
                if (toAdd < 10) {
                    toAdd = "0"+string(toAdd);
                } else {
                    toAdd = string(toAdd);
                }
                formatted = toAdd+formatted;
                time = floor(time/60);
                break;
            case 1:
                toAdd = time%60;
                if (toAdd < 10) {
                    toAdd = "0"+string(toAdd);
                } else {
                    toAdd = string(toAdd);
                }
                formatted = toAdd+formatted;
                time = floor(time/60);
                break;
            case 2:
                toAdd = time%24;
                if (toAdd < 10) {
                    toAdd = "0"+string(toAdd);
                } else {
                    toAdd = string(toAdd);
                }
                formatted = toAdd+formatted;
                time = floor(time/24);
                break;
        }
    }
    
    return formatted;
}

