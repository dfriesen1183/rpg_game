{
    //displayGuildHero_scr(heroButton_obj);
    //associates and renders hero for given heroButton
    
    var button = argument0;
    
    var hero_x = button.x + button.scale*sprite_get_width(button.sprite_index)/2;
    var hero_y = button.y + button.scale*sprite_get_height(button.sprite_index)/2;
    button.hero = instance_create(hero_x, hero_y, hero_obj);
        button.hero.index = button.index;
    renderHero_scr(button.hero);
    button.hero.x -= sprite_get_width(button.hero.sprite_index)/2;
    button.hero.y -= sprite_get_height(button.hero.sprite_index)/2;
}

