{
    var heroId = argument0;
    
    var size = ds_list_size(global.heroes);
    for (var i=0; i<size; i++) {
        var hero = global.heroes[| i];
        if (heroId == hero[? "id"]) {
            return i;
        }
    }
    return -1;
}

