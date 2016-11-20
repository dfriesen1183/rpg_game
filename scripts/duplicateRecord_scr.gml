{
    var des = argument0;
    var src = argument1;
    
    
    var heroes = des[? "heroes"];
    if (!is_undefined(heroes) && "null" != heroes && ds_exists(heroes, ds_type_list)) {
        var size = ds_list_size(heroes);
        for (var i=size-1; i>=0; i--) {
            ds_list_delete(heroes, i);
        }
    } else {
        heroes = ds_list_create();
        ds_map_add_list(des, "heroes", heroes);
    }
    var srcHeroes = src[? "heroes"];
    var size = ds_list_size(srcHeroes);
    for (var i=0; i<size; i++) {
        ds_list_add_map(heroes, srcHeroes[| i]);
    }
    
    
    var party = des[? "party"];
    if (!is_undefined(party) && "null" != party && ds_exists(party, ds_type_list)) {
        var size = ds_list_size(party);
        for (var i=size-1; i>=0; i--) {
            ds_list_delete(party, i);
        }
    } else {
        party = ds_list_create();
        ds_map_add_list(des, "party", party);
    }
    var srcParty = src[? "party"];
    var size = ds_list_size(srcParty);
    for (var i=0; i<size; i++) {
        ds_list_add_map(party, srcParty[| i]);
    }
    
    
    var log = des[? "log"];
    if (!is_undefined(log) && "null" != log && ds_exists(log, ds_type_list)) {
        ds_list_clear(des[? "log"]);
    } else {
        log = ds_list_create();
        ds_map_add_list(des, "log", log);
    }
    ds_list_copy(log, src[? "log"]);
    
    
    var key = ds_map_find_first(src);
    var size = ds_map_size(src);
    for (var i=0; i<size; i++) {
        switch(key) {
            case "pastEnc": break;
            case "futureEnc": break;
            case "log": break;
            case "party": break;
            case "heroes": break;
            case "beginTime": break;
            case "endTime": break;
            case "duration": break;
            case "title": break;
            default:
                des[? key] = src[? key];
                break;
        }
        key = ds_map_find_next(src, key);
    }
}

