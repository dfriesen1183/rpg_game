{
    //quest_code_scr()
    //(called from quest_room creation code)
    //readies quest board

    
    //checking quest activity
    var partyActive = false;
    var partyIndex = 0;
    var size = ds_list_size(global.party);
    for (var i=0; i<size; i++) {
        var hero = global.party[| i];
        if (0 < hero[? "hp"]) {
            partyActive = true;
            break;
        }
    }
    var questActive;
    if (global.record[? "time"] < global.record[? "duration"]) {
        questActive = true;
    } else {
        questActive = false;
    }
    
    if (questActive && partyActive) {
        //initiating quest cycle
        if (!size) {
            var durHuman = secToTime_scr(global.record[? "duration"]);
            genLogEntry_scr("Embarked on a "+string(durHuman)+" quest", true, false);
        }
        if (0 >= global.record[? "time"]) {
            planEncounters_scr();
        }
        global.questVisual = instance_create(0,0, questVisual_obj);
    } else {
        //returning to end screen
        show_debug_message("inactive quest");
        spawnQuestEndMenu_scr();
    }
}

