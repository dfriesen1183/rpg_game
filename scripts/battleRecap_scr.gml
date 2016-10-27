{
    //battleRecap_scr(boolean, int, int)
    //logs summary of last battle
    
    var victory = argument0;
    var dmgDealt = argument1;
    var dmgTaken = argument2;
    var message = "";
    
    var enemyCount = ds_list_size(global.enemyParty);
    
    var hpLeft = 0;
    var size = ds_list_size(global.party);
    for (var i=0; i<size; i++) {
        hpLeft += ds_map_find_value(global.party[| i], "hp");
    }
    
    message += "Party fought";
    if (enemyCount > 1) {
        message += " a group of "+string(enemyCount)+" enemies";
    } else {
        message += " an enemy";
    }
    if (victory) {
        message += " and won";
        if (dmgTaken > dmgDealt) {
            if (dmgTaken > hpLeft) {
                message += ", but at great cost...";
            } else {
                message += ".";
            }
        } else {
            if (dmgTaken > hpLeft) {
                message += " against all odds!";
            } else {
                message += ".";
            }
        }
    } else {
        //more detail here
        message += " and lost...#Quest unfinished.";
    }
    
    genLogEntry_scr(message, true, false);
}

