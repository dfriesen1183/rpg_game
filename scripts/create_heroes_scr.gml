{
<<<<<<< HEAD
    for (var i=0; i<17; i++) {
        var index = ds_list_size(global.heroes);
        var heroVal = genHero_scr(i%3);
=======
    for (var i=0; i<3; i++) {
        var index = ds_list_size(global.heroes);
        var heroVal = genHero_scr(i);
>>>>>>> b6196ee7a61332223c08d0d6c06c8bd72016c8dd
            var level = heroVal[0];
            var maxHp = heroVal[1];
            var sprite = heroVal[2];
        
        var hero = createHero_scr(index, level, maxHp, maxHp, sprite, -1);
        addHero_scr(hero, true, -1);
    }
}

