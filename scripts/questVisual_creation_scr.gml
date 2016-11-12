{
    global.questVisual = id;
    var record = global.activeQuests[| global.quest];
    var party = record[? "party"];
    output_list(global.activeQuests);

    //map background
    var pos_x = 0;
    var pos_y = global.onQuestMenuOffset;
    var widthScale = 1;
    var heightScale = 1 - pos_y;
    id.background = createInstance_scr(logBounding_obj, pos_x,pos_y, 0,0, widthScale,heightScale);
    id.background.sprite_index = mapBackTemp_spr;
    id.background.depth = -1;
    //map line
    var mapLengthWidth = 0.01;
    var mapLengthLeft = widthScale/2;
    var mapLengthTop = heightScale*0.125;//mapLengthLeft*global.roomWidth/global.roomHeight + pos_y;
    id.mapLengthHeight = heightScale - mapLengthTop*2;
    mapLengthTop += pos_y;
    id.mapLength = createInstance_scr(mapLength_obj, mapLengthLeft,mapLengthTop, 1,0, mapLengthWidth,id.mapLengthHeight);
    id.mapLength.depth = -2;
    
    //map markings
    var base_y = mapLengthTop + id.mapLengthHeight;
    var width = mapLengthWidth*5;
    var height = mapLengthWidth*global.roomWidth/global.roomHeight;
    
    var duration = record[? "duration"];
    var encs = record[? "pastEnc"];
    var size = ds_list_size(encs);
    for (var i=0; i<size; i++) {
        var enc = encs[| i];
        var seconds = date_second_span(enc[? "time"], record[? "endTime"]);
        var part = (duration - seconds) / duration;
        id.party_y = -(record[? "duration"] - seconds) / record[? "duration"];
        part *= id.mapLengthHeight;
        var mark_y = base_y - part;
        var mark = createInstance_scr(mapMark_obj, mapLengthLeft,mark_y, 1,1, width,height);
        mark.depth = -3;
    }
    encs = record[? "futureEnc"];
    size = ds_list_size(encs);
    for (var i=0; i<size; i++) {
        var enc = encs[| i];
        var seconds = date_second_span(enc[? "time"], record[? "endTime"]);
        var part = (duration - seconds) / duration;
        part *= id.mapLengthHeight;
        var mark_y = base_y - part;
        var mark = createInstance_scr(mapMark_obj, mapLengthLeft,mark_y, 1,1, width,height);
        mark.depth = -3;
    }

    //placing party members
    var seconds;
    if (date_compare_datetime(global.sysTime[? "val"], record[? "endTime"]) > 0) {
        seconds = 0;
    } else {
        seconds = date_second_span(global.sysTime[? "val"], record[? "endTime"]);
    }
    id.party_y = -(duration - seconds) / duration;
    id.party_y *= id.mapLengthHeight;
    id.party_y += base_y;
    id.party_x = mapLengthLeft;
    
    var size = ds_list_size(party);
    for (var i=0; i<size; i++) {
        var hero = party[| i];
        hero[? "partyIndex"] = i;
        
        if (0 < hero[? "hp"]) {
            var index = hero[? "index"];
            displayPartyMember_scr(index,i, false);
        }
    }
}

