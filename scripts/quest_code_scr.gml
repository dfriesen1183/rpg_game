{
    //quest_code_scr()
    //(called from quest_room creation code)
    //readies quest board

    
    //readying party
    var partyActive = false;
    var partyIndex = 0;
    var size = ds_list_size(global.party);
    for (var i=0; i<size; i++) {
        var hero = global.party[| i];
        hero[? "partyIndex"] = partyIndex;
        
        if (0 < hero[? "hp"]) {
            partyActive = true;
            var index = hero[? "index"];
            displayPartyMember_scr(index, partyIndex, false);
            partyIndex++;
        }
    }
    var questActive;
    if (global.record[? "time"] < global.record[? "duration"]) {
        questActive = true;
    } else {
        questActive = false;
    }

    
    //background tile assembly
    global.tileSpawner = instance_create(0,0,bgTileSpawner_obj);
    
    //readying log
    var outerMarg = ds_list_create();
    outerMarg[| 0] = 5;//left
    outerMarg[| 1] = 5;//right
    outerMarg[| 2] = 850;//top
    outerMarg[| 3] = 5;//bottom
    var innerMarg = ds_list_create();
    innerMarg[| 0] = 20;//left
    innerMarg[| 1] = 20;//right
    innerMarg[| 2] = 5;//top
    innerMarg[| 3] = 10;//bottom

    global.logFormat = ds_map_create();
    global.logFormat[? "outMarg"] = outerMarg;
    global.logFormat[? "inMarg"] = innerMarg;
    global.logFormat[? "outWidth"] = room_width - (outerMarg[| 0] + outerMarg[| 1]);
    global.logFormat[? "outHeight"] = room_height - (outerMarg[| 2] + outerMarg[| 3]);
    global.logFormat[? "inWidth"] = global.logFormat[? "outWidth"] - (innerMarg[| 0] + innerMarg[| 1]);
    global.logFormat[? "inHeight"] = global.logFormat[? "outHeight"] - (innerMarg[| 2] + innerMarg[| 3]);
    global.logFormat[? "font"] = simplePixels20;

    global.logBounding = instance_create(outerMarg[| 0],outerMarg[| 2],logBounding_obj);
    
    //readying clock
    global.cwestCloc = instance_create(0,0,clock_obj);
    

    var index = 0;
    var heightTotal = 0;
    var width = global.logFormat[? "inWidth"];
    var boundingInnerHeight = global.logFormat[? "inHeight"];

    draw_set_font(global.logFormat[? "font"]);
    size = ds_list_size(global.logText);
    if (ds_list_size(global.logText)) {
        displayLogEntry_scr(global.logText[| size-1], false);
    }
    /*for (; index<size; index++) {
        if (heightTotal > boundingInnerHeight) {
            break;
        }
        var text = global.logText[| index];
        var height = string_height_ext(text, -1, width);
        heightTotal += height;
    }
    for (var i=index-1; i>=0; i--) {
        var text = global.logText[| i];
        displayLogEntry_scr(text);
    }*/
    

    //initiating quest cycle
    if (questActive && partyActive) {
        if (!size) {
            var durHuman = secToTime_scr(global.record[? "duration"]);
            genLogEntry_scr("Embarked on a "+string(durHuman)+" quest", true, false);
        }
        if (0 < global.record[? "time"]) {
            if (global.record[? "next"] < global.record[? "duration"]) {
                createSpawner_scr(encSpawner_obj);
            } else {
                createSpawner_scr(endTimer_obj);
            }
        } else {
            questLogic_scr();
        }
        updateClock_scr(global.cwestCloc);
    } else {
        if (false == partyActive) {
            global.tileSpawner.active = false;
        }
        spawnQuestEndMenu_scr();
    }
}

