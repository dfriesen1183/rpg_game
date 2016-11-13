{
    var record = argument0;
    
    var party = record[? "party"];
    var size = ds_list_size(party);
    for (var i=size-1; i>=0; i--) {
        ds_list_delete(party, i);
    }
    ds_list_destroy(party);
    
    ds_list_destroy(record[? "log"]);
    
    ds_map_destroy(record);
}

