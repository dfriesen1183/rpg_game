{
    var level = floor(random_range(3,13));
    var hp = floor(random_range(20,35));
    show_debug_message("found a level "+string(level)+" hero with "+string(hp)+" hp");

    var partySize = ds_list_size(global.party);
    if (partySize < 4) {
        var hero = instance_create(0,0,hero_obj);
        hero.level = level;
        hero.hp = hp;
        hero.totalHp = hero.hp;
        ds_list_add(global.party, hero);
        
        switch(partySize) {
            case 1:
                hero.x = 300;
                hero.y = 712.5;
                break;
            case 2:
                hero.x = 450;
                hero.y = 712.5;
                break;
            case 3:
                hero.x = 375;
                hero.y = 750;
                break;
        }
        hero.visible = true;
    } else {
        show_debug_message("no room in party");
    }
}

