{
    //battleRecap_scr(boolean, int, int)
    //logs summary of last battle
    

    var record = argument0;
    var party = record[? "party"];
        
    var victory = argument1;
    var dmgDealt = argument2;
    var dmgTaken = argument3;
    var message = "";
    
    var enemyCount = ds_list_size(global.enemyParty);
    
    var hpLeft = 0;
    var size = ds_list_size(party);
    for (var i=0; i<size; i++) {
        hpLeft += ds_map_find_value(party[| i], "hp");
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
    
    genLogEntry_scr(record, message, true, false);
}

