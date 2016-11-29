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
    if (record[? "complete"]) {
        questActive = false;
    } else {
        questActive = true;
    }
    
    setBackgroundImage_scr(setupStageNav_spr);
    
    global.questVisual = instance_create(0,0, questVisual_obj);
    
    //log
    var _width = 15/16;
    global.questLog = createInstance_scr(questLog_obj, (1-_width)/2,0, 0,0, _width,0);
    //clock
    var topHudOffset = 3/16;
    global.questClock = createInstance_scr(questVisualClock_obj, 0,topHudOffset, 0,0, 0,0);
    startClock_scr();
    //gold
    global.questGold = createInstance_scr(questVisualGold_obj, 0,topHudOffset, 0,0, 0,0);
    startGoldCount_scr();
    //title
    var title = createInstance_scr(titleText_obj, 1/2,1/8, 0,0, 7/9,1/8);
    title.text = record[? "title"];
    
    
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
    displayLogEntry_scr(log[| index]);
}

