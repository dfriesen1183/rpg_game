{
    //quest_code_scr()
    //(called from quest_room creation code)
    //readies quest board

    
    var record = global.activeQuests[| global.quest];
    var party = record[? "party"];
    
    //checking quest activity
    var partyActive = false;
    var partyIndex = 0;
    var size = ds_list_size(party);
    for (var i=0; i<size; i++) {
        var hero = party[| i];
        if (0 < hero[? "hp"]) {
            partyActive = true;
            break;
        }
    }
    var questActive;
    if (date_compare_datetime(record[? "endTime"], global.sysTime[? "val"]) > 0) {
        questActive = true;
    } else {
        questActive = false;
    }
    
    global.onQuestMenuOffset = 0.05;
    var backToQuests = createInstance_scr(mainMenuQuests_obj, 0,0, 0,0, -1,global.onQuestMenuOffset);
    
    global.questVisual = instance_create(0,0, questVisual_obj);
    if (questActive && partyActive) {
        //initiating quest cycle
        if (!size) {
            var durHuman = secToTime_scr(record[? "duration"]);
            genLogEntry_scr(record, "Embarked on a "+string(durHuman)+" quest", true, false);
        }
    } else {
        //returning to end screen
        show_debug_message("inactive quest");
        spawnQuestEndMenu_scr();
    }
}

