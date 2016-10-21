{
    //function to automatically mark value as list/map, parallel to stock ds_map_add_list/map
    var list = argument0;
    var value = argument1;
    ds_list_add(list, value);
    ds_list_mark_as_map(list, ds_list_size(list)-1);
}

