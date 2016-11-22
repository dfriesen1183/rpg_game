{
    var questId = argument0;
    var encIndex = argument1;
    
    var questIndex = getQuestIndex_scr(questId);
    var enc = global.activeQuests[| questIndex];
    enc = enc[? "futureEnc"];
    enc = enc[| encIndex];
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
    var push = ds_list_create();
    ds_map_add_list(encRec, "push", push);
        push[| 0] = false;
        push[| 1] = enc[? "time"];
        push[| 2] = "";
        push[| 3] = "";
        push[| 4] = string(questId);


    var result = true;
    genLogEntry_scr(encRec, "----------", false, false);
    if (encType > 92.5) {
        //companion generated
        genFoundHero_scr(questId, enc);
    } else if (encType > 65) {
        //loot generated
        genFoundLoot_scr(questId, enc);
    } else {
        //enemy generated
        result = genFoundEnemies_scr(questId, enc);
    }
    


    
    if (result) {
        resetOnePush_scr(push);
        return 0;
    } else {
        return 1;
    }
}

