{
    //displayGuildHero_scr(heroButton_obj);
    //associates and renders hero for given heroButton
    
    var button = argument0;
    
    var hero_x = (button.x + button.scale_x*button.width/2) / global.roomWidth;
    var hero_y = (button.y + button.scale_y*button.height/2) / global.roomHeight;
    
    var heroScale = 0.60*(button.width*button.scale_x/global.roomWidth);
    button.ownHero = createInstance_scr(hero_obj, hero_x,hero_y, 1,1, heroScale,-1);
        button.ownHero.heroId = button.heroId;
    renderHero_scr(button.ownHero);
}

