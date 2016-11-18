{
    event_inherited();
    
    id.depth = -3;
    id.sprite_index = logBounding_spr;
    
    
    global.questGold = id;
    
    id.margin = ds_list_create();
        id.margin[| 0] = 20/global.roomWidth;
        id.margin[| 1] = 20/global.roomWidth;
        id.margin[| 2] = 10/global.roomHeight;
        id.margin[| 3] = 20/global.roomHeight;
    id.font = simplePixels24;
    
    
    if (0 <= global.quest) {
        var quest = getQuestIndex_scr(global.quest);
        var record = global.activeQuests[| quest];
        var text = "0000";
        
        id.display = instance_create(0,0, questVisualGoldText_obj);
        id.display.text = text;
        id.display.font = id.font;
        draw_set_font(id.font);
        id.display.width = string_width(text);
        id.display.height = string_height(text);
        
        updateGoldCount_scr(global.quest);
    } else {
        instance_destroy();//include checks in destroy code to avoid having to create ds unnecessarily
    }
}



