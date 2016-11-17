{
    var record = argument0;
    
    var party = record[? "party"];
    if (!is_undefined(party) && "null" != party && ds_exists(party, ds_type_list)) {
        var size = ds_list_size(party);
        for (var i=size-1; i>=0; i--) {
            ds_list_delete(party, i);
        }
        ds_list_destroy(party);
    }
    
    
    var heroes = record[? "heroes"];
    if (!is_undefined(heroes) && "null" != heroes && ds_exists(heroes, ds_type_list)) {
        var size = ds_list_size(heroes);
        for (var i=size-1; i>=0; i--) {
            ds_list_delete(heroes, i);
        }
        ds_list_destroy(heroes);
    }
    
    var log = record[? "log"];
    if (!is_undefined(log) && "null" != log && ds_exists(log, ds_type_list)) {
        ds_list_destroy(log);
    }
    
    //not stored here... need to find a better place
    var push = record[? "push"];
    if (!is_undefined(log) && "null" != log && ds_exists(log, ds_type_list)) {
        ds_list_destroy(push);
    }
    
    
    ds_map_destroy(record);
}

