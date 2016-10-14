{
    var battles = ds_map_find_value(global.record, "battles") + 1;
    ds_map_replace(global.record, "battles", battles);
    
    var enemyCount = floor(random_range(1,4));
    show_debug_message("party of "+string(enemyCount)+" enemies found");
    var enemyParty = ds_list_create();
    for (var i=0; i<enemyCount; i++) {
        ds_list_add(enemyParty, ds_map_create());
        var enemy = ds_list_find_value(enemyParty, i);
            var level = floor(random_range(1,4));
            var hp = floor(random_range(4,11));
            ds_map_add(enemy, "level", level);
            ds_map_add(enemy, "hp", hp);
            ds_map_add(enemy, "maxHp", hp);
            ds_map_add(enemy, "index", i);
    }
    var fighting = true;
    while(fighting) {
        //hero turn
        show_debug_message("Hero Turn:");
        for (var i=0; i<ds_list_size(global.party); i++) {
            var attacker = ds_list_find_value(global.party,i);
            //attacks random target, maybe not ideal (e.g. attack lowest health, most vulnerable to own attributes...)
            var targetIndex = floor(random_range(0, ds_list_size(enemyParty)));
            var target = ds_list_find_value(enemyParty, targetIndex);
            var dmg = floor(random_range(1, 4))*ds_map_find_value(attacker, "level")/2;
            var newHp = ds_map_find_value(target, "hp") - dmg;
            ds_map_replace(target, "hp", newHp); //trying to balance...
            if (ds_map_find_value(target, "hp") < 0) { ds_map_replace(target, "hp", 0);}
            
            if (ds_map_find_value(target, "hp") <= 0) {
                show_debug_message("Hero["+string(ds_map_find_value(attacker, "index"))+"] slew Enemy["+string(ds_map_find_value(target, "index"))+"]");
                ds_map_destroy(ds_list_find_value(enemyParty, targetIndex));
                ds_list_delete(enemyParty, targetIndex);
                if (ds_list_size(enemyParty) <= 0) {
                    fighting = false;
                    break;
                }
            } else {
                show_debug_message("Hero["+string(ds_map_find_value(attacker, "index"))+"] hit Enemy["+string(ds_map_find_value(target, "index"))+"] for "+string(dmg)+"dmg. Enemy has "+string(ds_map_find_value(target, "hp"))+" health left");
            }
        }
        if (fighting) {
            //enemy turn
            show_debug_message("Enemy Turn:");
            for (var i=0; i<ds_list_size(enemyParty); i++) {
                var attacker = ds_list_find_value(enemyParty,i);

                var targetIndex = floor(random_range(0, ds_list_size(global.party)));
                var target = ds_list_find_value(global.party, targetIndex);
                var dmg = floor(random_range(1, 4))*ds_map_find_value(attacker, "level")/2;
                var newHp = ds_map_find_value(target, "hp") - dmg;
                ds_map_replace(target, "hp", newHp);
                if (ds_map_find_value(target, "hp") < 0) { ds_map_replace(target, "hp", 0);}
                
                if (ds_map_find_value(target, "hp") <= 0) {
                    show_debug_message("Enemy["+string(ds_map_find_value(attacker, "index"))+"] slew Hero["+string(ds_map_find_value(target, "index"))+"]");
                    //deleting hero from party
                    var deadIndex = ds_map_find_value(target,"index");
                    with(hero_obj) {
                        if (self.index == deadIndex) {
                            instance_destroy();
                        }
                    }
                    ds_map_destroy(ds_list_find_value(global.party, targetIndex));
                    ds_list_delete(global.party, targetIndex);
                    
                    //shifting heroes to fill visual gaps in party
                    for (var j=targetIndex; j<ds_list_size(global.party); j++) {
                        var shiftIndex = ds_map_find_value(ds_list_find_value(global.party, j), "index");
                        switch(j) {
                            case 0:
                                with(hero_obj) {
                                    if (self.index == shiftIndex) {
                                        self.x = 375;
                                        self.y = 675;
                                    }
                                }
                                break;
                            case 1:
                                with(hero_obj) {
                                    if (self.index == shiftIndex) {
                                        self.x = 300;
                                        self.y = 712.5;
                                    }
                                }
                                break;
                            case 2:
                                with(hero_obj) {
                                    if (self.index == shiftIndex) {
                                        self.x = 450;
                                        self.y = 712.5;
                                    }
                                }
                                break;
                        }
                    }
                    if (ds_list_size(global.party) <= 0) {
                        fighting = false;
                        break;
                    }
                } else {
                    show_debug_message("Enemy["+string(ds_map_find_value(attacker, "index"))+"] hit Hero["+string(ds_map_find_value(target, "index"))+"] for "+string(dmg)+"dmg. Hero has "+string(ds_map_find_value(target, "hp"))+" health left");
                }
            }
        }
    }
}
