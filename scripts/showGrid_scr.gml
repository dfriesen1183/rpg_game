{
    var width = 2/global.roomWidth;
    var hDiv = 9;
    for (var i=1; i<hDiv; i++) {
        createInstance_scr(gridMarker_obj, i/hDiv,0, 1,0, width,1);
    }
    var vDiv = 16;
    for (var i=1; i<vDiv; i++) {
        createInstance_scr(gridMarker_obj, 0,i/vDiv, 0,1, 1,width);
    }
}

