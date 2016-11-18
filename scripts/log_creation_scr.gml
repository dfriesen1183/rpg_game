{
    event_inherited();
    
    
    id.depth = -3;
    id.sprite_index = logBounding_spr;
    
    
    global.logObj = id;
    
    id.margin = ds_list_create();
        id.margin[| 0] = 20/global.roomWidth; //not technically responsive
        id.margin[| 1] = 20/global.roomWidth;
        id.margin[| 2] = 10/global.roomHeight;
        id.margin[| 3] = 20/global.roomHeight;
    id.susp_y = 20/global.roomHeight;
    id.font = simplePixels24;
    id.text = ds_list_create();
    
    if (0 <= global.quest) {
        var quest = getQuestIndex_scr(global.quest);
        var record = global.activeQuests[| quest];
        var log = record[? "log"];
        var size = ds_list_size(log);
        if (0 <= size) {
            var index = size - 1;
            //displayLogEntry2_scr(log[| index]);
        }
    } else {
        instance_destroy();
    }
}

