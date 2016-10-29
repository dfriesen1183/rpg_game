{
    //output_list(list)
    
    var ds = argument0;
    
    var store = ds_map_create();
    ds_map_add_list(store, "list", ds);
    output_map(store);
    ds_map_delete(store, "list");
    ds_map_destroy(store);
}

