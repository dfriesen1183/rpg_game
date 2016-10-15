{
    var size = ds_list_size(global.party);
    for (var i=size-1; i>=0; i--) {
        var hero = ds_list_find_value(global.party, i);
        ds_map_destroy(hero);
    }
    ds_list_clear(global.party);

    size = ds_list_size(global.heroes);
    for (var i=0; i<size; i++) {
        var hero = ds_list_find_value(global.heroes, i);
        ds_map_replace(hero,"index",i);
    }

    ds_map_replace(global.record,"duration",0);
    ds_map_replace(global.record,"time",0);
    ds_list_clear(ds_map_find_value(global.record, "log"));
}
