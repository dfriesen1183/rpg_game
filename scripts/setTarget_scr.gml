{
    //setTarget_scr(boolean);
    //finds random member of the opposing party still standing

    if (argument0) {
        var targetGroup = global.enemyParty;
    } else {
        targetGroup = global.party;
    }
    
    var viableTargets = ds_list_create();
    var size = ds_list_size(targetGroup);
    for (var i=0; i<size; i++) {
        var cand = ds_list_find_value(targetGroup, i);
        if (ds_map_find_value(cand, "hp") > 0) {
            ds_list_add(viableTargets, cand);
        }
    }
    
    size = ds_list_size(viableTargets);
    if (size) {
        var index = irandom_range(0, size-1);
        return ds_list_find_value(viableTargets, index);
    } else {
        return 0;
    }
}
