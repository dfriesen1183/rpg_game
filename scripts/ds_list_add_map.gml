{
    //ds_list_add_map(list, map)
    //automatically marks value as list/map, parallel to stock ds_map_add_list/map

    var list = argument0;
    var value = argument1;
    var data = ds_map_create();
    ds_map_add_list(data, "party", list);
    var output = json_encode(data);
    show_debug_message(output);
    ds_map_delete(data, "party");
    ds_map_destroy(data);
    
    ds_list_add(list, value);
    var data = ds_map_create();
    ds_map_add_list(data, "party", list);
    var output = json_encode(data);
    show_debug_message(output);
    ds_map_delete(data, "party");
    ds_map_destroy(data);

    ds_list_mark_as_map(list, ds_list_size(list)-1);
    var data = ds_map_create();
    ds_map_add_list(data, "party", list);
    var output = json_encode(data);
    show_debug_message(output);
    ds_map_delete(data, "party");
    ds_map_destroy(data);
    
    var output = json_encode(value);
    show_debug_message(output);
}

