{
    var btn = argument0;
    var index = getHeroById_scr(btn.heroId);
    var dsHero = global.heroes[| index];
    output_map(dsHero);
    var stat_x = 3/9;
    var width = 5/9;
    
    show_debug_message(string(btn.y/global.roomHeight*16));

    //level
    var lvl_y = btn.y/global.roomHeight + 0.5/16;
    btn.objects[? "levelText"] = createInstance_scr(titleText_obj, stat_x,lvl_y, 0,0, 1,width);
    var level = btn.objects[? "levelText"];
    level.font = simplePixels28;
    level.textColor = c_white;
    level.halign = fa_left;
        level.textAlign_x = 0;
    level.text = "LVL:  "+string(dsHero[? "level"]);
    
    //hp
    var hp_y = lvl_y + 0.5/9;
    btn.objects[? "hpText"] = createInstance_scr(titleText_obj, stat_x,hp_y, 0,0, 1,width);
    var hp = btn.objects[? "hpText"];
    hp.font = simplePixels24;
    hp.textColor = c_white;
    hp.halign = fa_left;
        hp.textAlign_x = 0;
    hp.text = "    HP:  "+string(dsHero[? "hp"])+"/"+string(dsHero[? "maxHp"]);
}

