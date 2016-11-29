{
    //createHero_scr(int, int, int, int, int)
    //hero constructor
    
    var index = argument0;
    var level = argument1;
    var hp = argument2;
    var maxHp = argument3;
    var sprite = argument4;
    var partyIndex = argument5;
    
    var hero = ds_map_create();
        hero[? "name"] = "Hero"+string(index);
        hero[? "level"] = level;
        hero[? "hp"] = hp;
        hero[? "maxHp"] = maxHp;
        hero[? "id"] = random(1);
        hero[? "index"] = index;
        hero[? "friendly"] = true;
        hero[? "partyIndex"] = partyIndex;
        hero[? "questIndex"] = -1;
        hero[? "died"] = -1;
        hero[? "sprite"] = sprite;
        
    return hero;
}

