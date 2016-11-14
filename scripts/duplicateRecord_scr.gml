{
    var des = argument0;
    var src = argument1;
    
    
    if (!is_undefined(des[? "log"]) && ds_exists(des[? "log"], ds_type_list)) {
        var heroes = des[? "heroes"];
        var size = ds_list_size(heroes);
        for (var i=size-1; i>=0; i--) {
            ds_list_delete(heroes, i);
        }
        ds_list_destroy(heroes);
    }
    ds_map_add_list(des, "heroes", ds_list_create());
    var srcHeroes = src[? "heroes"];
    var size = ds_list_size(srcHeroes);
    for (var i=0; i<size; i++) {
        ds_list_add_map(des[? "heroes"], srcHeroes[| i]);
    }
    
    
    if (!is_undefined(des[? "log"]) && ds_exists(des[? "log"], ds_type_list)) {
        var party = des[? "party"];
        var size = ds_list_size(party);
        for (var i=size-1; i>=0; i--) {
            ds_list_delete(party, i);
        }
        ds_list_destroy(party);
    }
    ds_map_add_list(des, "party", ds_list_create());
    var srcParty = src[? "party"];
    var size = ds_list_size(srcParty);
    for (var i=0; i<size; i++) {
        ds_list_add_map(des[? "party"], srcParty[| i]);
    }
    
    
    if (!is_undefined(des[? "log"]) && ds_exists(des[? "log"], ds_type_list)) {
        ds_list_destroy(des[? "log"]);
    }
    ds_map_add_list(des, "log", ds_list_create());
    ds_list_copy(des[? "log"], src[? "log"]);
    
    
    var key = ds_map_find_first(src);
    var size = ds_map_size(src);
    for (var i=0; i<size; i++) {
        if ("pastEnc" != key && "futureEnc" != key && "log" != key && "party" != key && "heroes" != key) {
            des[? key] = src[? key];
        }
        key = ds_map_find_next(src, key);
    }
}

