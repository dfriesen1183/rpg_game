{
    //displayGuildHero_scr(heroButton_obj);
    //associates and renders hero for given heroButton
    
    var button = argument0;
    
    var hero_x = button.x + button.scale*sprite_get_width(button.sprite_index)/2;
    var hero_y = button.y + button.scale*sprite_get_height(button.sprite_index)/2;
    button.ownHero = instance_create(hero_x, hero_y, hero_obj);
        button.ownHero.index = button.index;
    renderHero_scr(button.ownHero);
    button.ownHero.x -= sprite_get_width(button.ownHero.sprite_index)/2;
    button.ownHero.y -= sprite_get_height(button.ownHero.sprite_index)/2;
}

