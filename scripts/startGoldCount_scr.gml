{
    var gold = global.questGold;
    
    var _height = gold.display.height/global.roomHeight;
    gold.icon = createInstance_scr(goldIcon_obj, 0,0, 0,0, -1,_height);
    
    var goldWidth = (gold.display.width + gold.icon.width*gold.icon.scale_x)/global.roomWidth + gold.margin[| 0] + gold.margin[| 1];
    var goldHeight = _height + gold.margin[| 2] + gold.margin[| 3];
    var gold_x = 1 - goldWidth;
    moveInstance_scr(gold, gold_x,gold.y, 0,0, goldWidth,goldHeight);
    var iconWidth = gold.icon.width*gold.icon.scale_x;
    
    gold.icon.x = gold.x + gold.margin[| 0]*global.roomWidth;
    gold.icon.y = gold.y + gold.margin[| 2]*global.roomHeight;
    gold.display.x = gold.x + (goldWidth - gold.margin[| 1])*global.roomWidth;
    gold.display.y = gold.y + gold.margin[| 2]*global.roomHeight;
}

