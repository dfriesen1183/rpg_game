{
    var tier = argument0;
    
    
    var totalTiers = 5;
    var totalSprites = 37;
    
    //level
    var levelFactor = (tier + 1)/(totalTiers + 1);
    var level = 1;
    var percentile = random(1)/totalTiers;
    while (levelFactor > percentile) {
        //break;
        level++;
        levelFactor *= levelFactor + (1 - levelFactor)/2;
    }
    
    //health //should set up to be more meaningful than this
    var hp = 25 + irandom_range(0, 10);
    
    //sprite
    var spriteEnd = totalSprites - power(2, totalTiers - 1 - tier);
    var spriteStart;
    if (0 == tier) {
        spriteStart = 0;
    } else {
        var spriteStart = totalSprites - power(2, totalTiers - tier);
        if (spriteStart < 0) {
            spriteStart = 0;
        }
    }
    var sprite = irandom_range(spriteStart, spriteEnd);
    
    
    var hero;
        hero[0] = level;
        hero[1] = hp;
        hero[2] = sprite;
    
    return hero;
}

