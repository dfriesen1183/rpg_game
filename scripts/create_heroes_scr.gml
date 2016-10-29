{
    for (var i=0; i<3; i++) {
        var hp = 30;
        var level = 3*(i+1);
        var hero = ds_map_create();
            ds_map_add(hero,"index",string(ds_list_size(global.heroes)-1));//identifier
            ds_map_add(hero,"name","Hero"+string(i));
            ds_map_add(hero,"level",level);
            ds_map_add(hero,"hp",hp);
            ds_map_add(hero,"maxHp",hp);
            ds_map_add(hero,"friendly",true);
            ds_map_add(hero,"sprite",irandom_range(0,5));
        addHero_scr(hero, true);
    }
}

