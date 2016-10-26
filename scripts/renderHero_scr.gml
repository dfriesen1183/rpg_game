{
    //renderHero_scr(index);
    //draws hero
    
    var hero = argument0;
    var index = ds_map_find_value(ds_list_find_value(global.heroes, hero.index), "sprite");
    hero.sprite_index = asset_get_index("hero"+string(index)+"_spr");
}

