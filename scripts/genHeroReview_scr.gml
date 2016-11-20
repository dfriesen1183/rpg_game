{
    var list = argument0;
    var top = argument1;
    var left = 3.5;
    
    var size = ds_list_size(list);
    for (var i=0; i<size && i<4; i++) {
        var hero = createInstance_scr(hero_obj, (left + i)/9,top, 1,1, -1,0.5/16);
        var dsHero = list[| i];
        hero.heroId = dsHero[? "id"];
        renderHero_scr(hero);
    }
}

