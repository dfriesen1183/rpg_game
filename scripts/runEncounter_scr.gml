{
    var quest = argument0;
    var record = global.activeQuests[| quest];
    var questId = record[? "id"];
    var enc = argument1;
    var encRec = enc[? "record"];
    
    
    //updating record data
    duplicateRecord_scr(record, encRec);
    
    
    //updating real data
    //heroes
    var encs = record[? "futureEnc"];
    var futureEnc = encs[| 0];
    var futureEncRec = futureEnc[? "record"];
    
    var encIndex = ds_list_size(record[? "pastEnc"]) - 1;
    if (0 <= encIndex) {
        var encs = record[? "pastEnc"];
        var pastEnc = encs[| encIndex];
        var pastEncRec = pastEnc[? "record"];
        encIndex = ds_list_size(pastEncRec[? "heroes"]);
    } else {
        encIndex = 0;
    }
    
    var heroes = record[? "heroes"];
    var j_size = ds_list_size(heroes);
    for (var j=encIndex; j<j_size; j++) {
        var hero = heroes[| j];
        hero[? "index"] = ds_list_size(global.heroes);
        ds_list_add_map(global.heroes, hero);
    }
    
    //party //mostly redundant, but possibility exists a party member will not join overfull guild
    var party = record[? "party"];
    var j_size = ds_list_size(party);
    for (var j=0; j<j_size; j++) {
        var member = party[| j];
        var index = getHeroById_scr(member[? "id"]);
        if (0 > index) {
            index = ds_list_size(global.heroes);
        }

        global.heroes[| index] = party[| j];
        ds_list_mark_as_map(global.heroes, index);
    }
    
    
    //showing latest log entry
    var log = record[? "log"];
    var size = ds_list_size(log);
    for (var i=0; i<size; i++) {
        var index = size - 1;
        displayLogEntry_scr(log[| index]);
    }


    if (record[? "complete"] && false == record[? "success"]) {
        return 1;
    }
    return 0;
}

