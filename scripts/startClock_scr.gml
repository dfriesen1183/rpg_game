{
    var clock = global.questClock;
    
    
    var clockWidth = clock.display.width/global.roomWidth + clock.margin[| 0] + clock.margin[| 1];
    var clockHeight = clock.display.height/global.roomHeight + clock.margin[| 2] + clock.margin[| 3];
    moveInstance_scr(clock, 0,0.15, 0,0, clockWidth,clockHeight);
    
    clock.display.x = clock.x + clock.margin[| 0]*global.roomWidth;
    clock.display.y = clock.y + clock.margin[| 2]*global.roomHeight;
}

