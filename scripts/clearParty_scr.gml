{
    while(ds_list_size(global.party)) {
        ds_list_delete(global.party, 0);
    }
    
    //none of these work vvv 
    
    //var size = ds_list_size(global.party);
    //for (var i=0; i<size; i++) {
    //  ds_list_delete(global.party, i);
    //}
    
    //ds_lsit_destroy(global.party);
    //ds_map_add_list(global.data, "party", ds_list_create());
    //global.party = ds_map_find_value(global.data, "party");
    
    //ds_list_clear(global.party);
}

