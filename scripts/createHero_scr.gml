{
    //createHero_scr(int, int, int, int, int)
    //hero constructor
    
    var index = argument0;
    var level = argument1;
    var hp = argument2;
    var maxHp = argument3;
    var partyIndex = argument4;
    
    var hero = ds_map_create();
        hero[? "name"] = "Hero"+string(index);
        hero[? "level"] = level;
        hero[? "hp"] = hp;
        hero[? "maxHp"] = hp;
        hero[? "index"] = index;
        hero[? "friendly"] = true;
        hero[? "partyIndex"] = partyIndex;
        hero[? "questIndex"] = -1;
        hero[? "sprite"] = irandom_range(0,36);
        
    return hero;
}

