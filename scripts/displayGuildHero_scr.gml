{
    //displayGuildHero_scr(heroButton_obj);
    //associates and renders hero for given heroButton
    
    var button = argument0;
    
    var hero_x = 2/9;//button.x / global.roomWidth;
    var hero_y = (button.y + button.scale_y*button.height/2) / global.roomHeight;
    
    button.objects[? "hero"] = createInstance_scr(hero_obj, hero_x,hero_y, 1,1, -1,1.5/16);
    button.objects[? "hero"].heroId = button.heroId;
    renderHero_scr(button.objects[? "hero"]);
}

