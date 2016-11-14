{
    //renderHero_scr(index);
    //draws hero
    
    var hero = argument0;
    var dsHeroIndex = getHeroById_scr(hero.heroId);
    var dsHero = global.heroes[| dsHeroIndex];
    var index = dsHero[? "sprite"];
    hero.sprite_index = asset_get_index("hero"+string(index)+"_spr");
}

