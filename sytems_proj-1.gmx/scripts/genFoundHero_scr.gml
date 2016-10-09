{
    var newHero = instance_create(375+instance_number(hero_obj)*2, 675, hero_obj);
    newHero.attr_speed = floor(random(2,8));
    newHero.attr_strength = floor(random(2,8));
    newHero.attr_magic = floor(random(2,8));
    show_debug_message("found hero with"+string(newHero.attr_speed)+" speed, "+string(newHero.attr_strength)+" strength, and "+string(newHero.attr_magic)+" magic");
}
