{
    var quest = argument0;
    var index = argument1;
    
    var enc = global.activeQuests[| quest];
    enc = enc[? "futureEnc"];
    enc = enc[| index];
    var encType = enc[? "type"];
    var encRec = enc[? "record"];
    
    //duplicating party to separate present from simulation
    var encParty = ds_list_create();
    //output_list(encParty);
    var oldParty = encRec[? "party"];
    var size = ds_list_size(oldParty);
    for (var i=0; i<size; i++) {
        var member = ds_map_create();
        ds_map_copy(member, oldParty[| i]);
        ds_list_add_map(encParty, member);
    }
    ds_map_delete(encRec, "party");
    ds_map_add_list(encRec, "party", encParty);
    
    //preparing push notification container
    ds_map_add_list(enc, "push", ds_list_create());
        var push = enc[? "push"];
        push[| 0] = "";
        push[| 1] = enc[? "time"];
        push[| 2] = "";
        push[| 3] = "";
        push[| 4] = quest;


    var result = true;
    genLogEntry_scr(encRec, "----------", false, false);
    if (encType > 90) {
        //companion generated
        genFoundHero_scr(enc, quest);
    } else if (encType > 75) {
        //loot generated
        genFoundLoot_scr(enc, quest);
    } else {
        //enemy generated
        result = genFoundEnemies_scr(enc, quest);
    }
    

    //priming push notification
    var push = enc[? "push"];
    push_local_notification(push[| 1], push[| 2], push[| 3], push[| 4]);
    
    
    if (result) {
        return 0;
    } else {
        saveGame_scr();
        return 1;
    }
}

