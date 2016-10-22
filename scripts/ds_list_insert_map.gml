{
    //ds_list_add_map(list, index, map)
    //extends ds_list_insert()

    var list = argument0;
    var index = argument1;
    var value = argument2;
    ds_list_insert(list, index, value);
    ds_list_mark_as_map(list, index);
}

