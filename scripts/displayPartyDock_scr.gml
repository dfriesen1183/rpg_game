{
    with (partyDockBtn_obj) {
        instance_destroy();
    }

    var memWidth = 1.5/9;
    var memHeight = 2/16;
    var mem_x = 1/9;
    var sep = 1/3/9;
    var mem_y = 9.5/16;
    var heroHeight = 0.9*memHeight;
    
    var hero_x = mem_x + memWidth/2;
    var hero_y = mem_y + memHeight/2;
    
    
    var size = ds_list_size(global.party);
    for (var i=0; i<size; i++) {
        var iMem_x = mem_x + (sep + memWidth)*i;
        var member = createInstance_scr(partyDockBtn_obj, iMem_x,mem_y, 0,0, memWidth,memHeight);
        var dsMember = global.party[| i];
        member.heroId = dsMember[? "id"];
        member.index = dsMember[? "index"];
        
        var iHero_x = iMem_x + hero_x - mem_x;
        member.objects[? "hero"] = createInstance_scr(hero_obj, iHero_x,hero_y, 1,1, -1,heroHeight);
        member.objects[? "hero"].heroId = member.heroId;
        renderHero_scr(member.objects[? "hero"]);
    }
}

