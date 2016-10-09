{
    var newHero_x = 375+instance_number(hero_obj)*2;
    var newHero_y = 675;
    var newHero = instance_create(newHero_x, newHero_y, hero_obj);
    newHero.attr_speed = floor(random_range(3,8));
    newHero.attr_strength = floor(random_range(3,8));
    newHero.attr_magic = floor(random_range(3,8));
    show_debug_message("found hero with "+string(newHero.attr_speed)+" speed, "+string(newHero.attr_strength)+" strength, and "+string(newHero.attr_magic)+" magic");
}
