{
    //createHero_scr(int, int, int, int, int)
    //hero constructor
    
    var index = argument0;
    var level = argument1;
    var hp = argument2;
    var maxHp = argument3;
    var partyIndex = argument4;
    
    var hero = ds_map_create();
        //maybe invest in a proper constructor for general use
        ds_map_add(hero,"found",true);
        ds_map_add(hero,"name","Hero"+string(index));
        ds_map_add(hero,"level",level);
        ds_map_add(hero,"hp",hp);
        ds_map_add(hero,"maxHp",hp);
        ds_map_add(hero,"index",index);
        ds_map_add(hero,"friendly",true);
        ds_map_add(hero,"partyIndex",partyIndex);
        ds_map_add(hero,"sprite",irandom_range(0,36));
        
    return hero;
}

