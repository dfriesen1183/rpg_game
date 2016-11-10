{
    //encSpawnerCode_scr()
    //(called from encSpawner_obj.alarm[0])
    //increments quest time; generates encounter after set period

    id.time++;
    global.record[? "time"] = id.time;
    
    var duration = global.record[? "duration"];
    
    //moving party
    global.questVisual.party_y -= 1/duration * global.questVisual.mapLengthHeight;
    var size = ds_list_size(global.party);
    for (var i=0; i<size; i++) {
        var member = global.party[| i];
        if (member[? "hp"] > 0) {
            with (hero_obj) {//create parallel array of hero_obj
                if (id.partyIndex = i) {//update dead members to negative partyIndex?
                    movePartyMember_scr(id);
                }
            }
        }
    }
    
    //create parallel array for time + ref to ds/index?
    var encounters = global.record[? "encounters"];
    var index = global.record[? "encIndex"];
    var enc = encounters[| index];
    
    if (enc[? "unmet"])
    {
        if (enc[? "time"] <= id.time) {
            var result = encLogic_scr();
            enc[? "unmet"] = false;
            if (result == 0) {
                //updateClock_scr(global.cwestCloc);
            } else {
                saveGame_scr();
                endQuest_scr(false);
                return 0;
            }
            if (index + 1 < ds_list_size(encounters)) {
                global.record[? "encIndex"]++;
            }
            saveGame_scr();
        } else {
            saveStructure_scr("record");
        }
    }
    else if (id.time >= duration)
    {
        endQuest_scr(true);
        return 0;
    }
    else
    {
        saveStructure_scr("record");
    }
    
    id.alarm[0] = room_speed;
}

