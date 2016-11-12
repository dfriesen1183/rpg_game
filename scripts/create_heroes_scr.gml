{
    for (var i=0; i<3; i++) {
        var index = ds_list_size(global.heroes);
        var level = 3*(i+1);
        var hp = 30;
        
        var hero = createHero_scr(index, level, hp, hp, -1);
        addHero_scr(hero, true, -1);
    }
}

