{
    //viewActiveData_scr()
    //iterates through data structures indexed in global.saveIndex,
    //and outputs data to complier

    var size = ds_map_size(global.saveIndex);
    var key = ds_map_find_first(global.saveIndex);
    for (var i=0; i<size; i++) {
        viewActiveStructure_scr(key);
        key = ds_map_find_next(global.saveIndex, key);
    }
}

