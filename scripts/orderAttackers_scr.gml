{
    //orderAttackers_scr();
    //concatenates opposing parties, shuffles list created
    
    
    var record = argument0;
    var party = record[? "party"];


    var order = ds_list_create();
    
    var size = ds_list_size(party);
    for (var i=0; i<size; i++) {
        var hero = ds_list_find_value(party, i);
        if (ds_map_find_value(hero,"hp") > 0) {
            ds_list_add(order, hero);
        }
    }
    size = ds_list_size(global.enemyParty);
    for (var i=0; i<size; i++) {
        var enemy = ds_list_find_value(global.enemyParty, i);
        if (ds_map_find_value(enemy,"hp") > 0) {
            ds_list_add(order, enemy);
        }
    }
    
    ds_list_shuffle(order);
    
    return order;
}
