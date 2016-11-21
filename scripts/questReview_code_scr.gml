{
    //questReview_code_scr()
    //(called from questReview_room creation code)
    //displays quest result
    

    saveGame_scr();
    
    var questId = global.quest;
    var quest = getQuestIndex_scr(questId);
    var record = global.activeQuests[| quest];
    var party = record[? "party"];

    //deleting heroes displayed
    with(hero_obj) {
        instance_destroy();
    }
    
    //updating guild data
    global.guild[? "questsTotal"]++;
    if (record[? "success"]) {
        global.guild[? "gold"] += record[? "gold"];
        global.guild[? "questsWon"]++;
    }
    
    
    var title = createInstance_scr(titleText_obj, 1/2,2/16, 0,0, 7/9,1/16);
    title.font = simplePixels44;
    title.textColor = c_aqua;
    if (record[? "success"]) {
        title.text = "VICTORY!!!";
    } else {
        title.text = "DEFEAT...";
    }
    var main = createInstance_scr(mainMenuMain_obj, 1/2,3/4, 1,0, 7/9,1/8);
    setBtnFontLarge_scr(main);
    if (record[? "success"]) {
        main.text = "COLLECT LOOT &#RETURN TO GUILD";
    } else {
        main.text = "RETURN TO GUILD";
    }

    
    //preparing stats
    //container:
    var review = createInstance_scr(reviewWindow_obj, 1/9,3.5/16, 0,0, 7/9,8/16);
    review.leftBorder = createInstance_scr(windowBorder_obj, 1/9,3.5/16, 0,0, 1/6/9,8/16);
    review.rightBorder = createInstance_scr(windowBorder_obj, 8/9,3.5/16, 2,0, 1/6/9,8/16);
    review.topBorder = createInstance_scr(windowBorder_obj, 1/9,3.5/16, 0,0, 7/9,1/6/16);
    review.bottomBorder = createInstance_scr(windowBorder_obj, 1/9,11.5/16, 0,2, 7/9,1/6/16);
    //gold
    var goldIcon = createInstance_scr(goldIcon_obj, 2/9,4/16, 1,0, -1,1.5/16);
    var goldTitle = createInstance_scr(titleText_obj, 7.5/9,4.5/16, 0,0, 4/9,1/16);
    goldTitle.font = simplePixels32;
    goldTitle.halign = fa_right;
    goldTitle.textAlign_x = 2;
    goldTitle.textColor = c_yellow;
    goldTitle.text = "Gold Looted";
    var goldMain = createInstance_scr(titleText_obj, 7.5/9,5.5/16, 0,0, 6/9,1/16);
    goldMain.font = simplePixels24;
    goldMain.halign = fa_right;
    goldMain.textAlign_x = 2;
    goldMain.textColor = c_yellow;
    goldMain.text = "+ "+string(record[? "gold"])+"g";
    
    //heroes found
    var heroIcon = createInstance_scr(heroIcon_obj, 2/9,7.5/16, 1,1, 1/9,-1);
    var foundMain = createInstance_scr(titleText_obj, 7.5/9,7/16, 0,0, 5/9,1/16);
    foundMain.font = simplePixels32;
    foundMain.halign = fa_right;
    foundMain.textAlign_x = 2;
    foundMain.textColor = c_green;
    foundMain.text = "Heroes Met:";
    
    var size = ds_list_size(global.heroes);
    var collected = ds_list_create();
    for (var i=0; i<size; i++) {
        var hero = global.heroes[| i];
        if (ds_map_find_value(hero, "found") == questId) {
            ds_list_add(collected, hero);
        }
    }
    
    var foundTitle = createInstance_scr(titleText_obj, 7.5/9,8/16, 0,0, 1/9,1/16);
    foundTitle.font = simplePixels28;
    foundTitle.halign = fa_right;
    foundTitle.textAlign_x = 2;
    foundTitle.textColor = c_green;
    size = ds_list_size(collected);
    foundTitle.text = size;
    
    if (size) {
        var new_y = 8/16;
        genHeroReview_scr(collected, new_y);
        for (var i=size-1; i>=0; i--) {
            ds_list_delete(collected, i);
        }
    }
    ds_list_destroy(collected);
    
    //heroes fallen
    var lostIcon = createInstance_scr(questIcon_obj, 2/9,10/16, 1,1, 1/9,-1);
    var lostMain = createInstance_scr(titleText_obj, 7.5/9,9.5/16, 0,0, 5/9,1/16);
    lostMain.font = simplePixels32;
    lostMain.halign = fa_right;
    lostMain.textAlign_x = 2;
    lostMain.textColor = c_red;
    lostMain.text = "Heroes Lost:";

    size = ds_list_size(global.heroes);
    var collected = ds_list_create();
    for (var i=0; i<size; i++) {
        var hero = global.heroes[| i];
        if (questId == hero[? "died"]) {
            ds_list_add(collected, global.heroes[| i]);
        }
    }
    
    var lostTitle = createInstance_scr(titleText_obj, 7.5/9,10.5/16, 0,0, 1/9,1/16);
    lostTitle.font = simplePixels28;
    lostTitle.halign = fa_right;
    lostTitle.textAlign_x = 2;
    lostTitle.textColor = c_red;
    size = ds_list_size(collected);
    lostTitle.text = size;

    if (size) {
        var new_y = 10.5/16;
        genHeroReview_scr(collected, new_y);
        for (var i=size - 1; i>=0; i--) {
            ds_list_delete(collected, i);
        }
    }
    ds_list_destroy(collected);
    
    //reseting active variables (record, party, heroes...)
    record[? "destroy"] = true;
}

