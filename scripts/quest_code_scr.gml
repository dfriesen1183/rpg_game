{
    //quest_code_scr()
    //(called from quest_room creation code)
    //readies quest board

    
    var quest = getQuestIndex_scr(global.quest);
    var record = global.activeQuests[| quest];
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
    
    global.onQuestMenuOffset = 0;//0.08;
    global.questFeedOffset = 0.1;
    var menu_y = 1 - global.onQuestMenuOffset;
    //var backToQuests = createInstance_scr(mainMenuQuests_obj, 0,menu_y, 0,0, -1,global.onQuestMenuOffset);
    
    global.questVisual = instance_create(0,0, questVisual_obj);
    
    var _width = 0.95;
    //var log_y = global.roomHeight - global.questFeedOffset
    global.logObj = createInstance_scr(logBounding_obj, (1-_width)/2,0, 0,0, _width,0);
    
    
    var log = record[? "log"];
    if (questActive && partyActive) {
        size = ds_list_size(log);
        if (0 >= size) {
            var durHuman = secToTime_scr(record[? "duration"]);
            genLogEntry_scr(record, "Embarked on a "+string(durHuman)+" quest", true, false);
        }
    } else {
        //returning to end screen
        show_debug_message("inactive quest");
        spawnQuestEndMenu_scr();
    }
    
    var log = record[? "log"];
    var index = ds_list_size(log) - 1;
    displayLogEntry2_scr(log[| index]);
}

