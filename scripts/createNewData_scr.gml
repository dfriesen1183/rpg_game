{
    //createNewData_scr();
    //readies new data for use

    createSaveIndex_scr();
    
    //creating new save data
    var size = ds_map_size(global.saveIndex);
    var key = ds_map_find_first(global.saveIndex);
    for (var i=0; i<size; i++) {
        var scriptToCall = asset_get_index("create_"+key+"_scr");
        script_execute(scriptToCall);
        key = ds_map_find_next(global.saveIndex, key);
    }
    
    saveGame_scr();
}

