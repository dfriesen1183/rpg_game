{
    //displayGuildHero_scr(heroButton_obj);
    //associates and renders hero for given heroButton
    
    var button = argument0;
    
<<<<<<< HEAD
    var hero_x = 2/9;//button.x / global.roomWidth;
    var hero_y = (button.y + button.scale_y*button.height/2) / global.roomHeight;
    
    button.objects[? "hero"] = createInstance_scr(hero_obj, hero_x,hero_y, 1,1, -1,1.5/16);
    button.objects[? "hero"].heroId = button.heroId;
    renderHero_scr(button.objects[? "hero"]);
=======
    var hero_x = (button.x + button.scale_x*button.width/2) / global.roomWidth;
    var hero_y = (button.y + button.scale_y*button.height/2) / global.roomHeight;
    
    var heroScale = 0.60*(button.width*button.scale_x/global.roomWidth);
    button.ownHero = createInstance_scr(hero_obj, hero_x,hero_y, 1,1, heroScale,-1);
        button.ownHero.heroId = button.heroId;
    renderHero_scr(button.ownHero);
>>>>>>> b6196ee7a61332223c08d0d6c06c8bd72016c8dd
}

