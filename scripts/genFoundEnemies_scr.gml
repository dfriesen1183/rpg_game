{
    //genFoundEnemies_scr();
    //returns boolean 'party defeat'
    //generates enemy encounter
    //  generates enemy party
    //  determines ambush advantage
    //  loops through battle until one party is defeated
    //    determines attack order
    //    attackers find targets and deal damage

    var battles = ds_map_find_value(global.record, "battles") + 1;
    ds_map_replace(global.record, "battles", battles);
    var dmgTaken = 0;
    var dmgDealt = 0;
    
    //assembling enemy party
    var enemyCount = irandom_range(1,3);
    genLogEntry_scr(string(enemyCount)+" enemies found", false, false);
    global.enemyParty = ds_list_create();
    for (var i=0; i<enemyCount; i++) {
        ds_list_add(global.enemyParty, ds_map_create());
        var enemy = ds_list_find_value(global.enemyParty, i);
            var level = irandom_range(1,3);
            var hp = irandom_range(4,10);
            ds_map_add(enemy, "name", "Enemy"+string(i));
            ds_map_add(enemy, "level", level);
            ds_map_add(enemy, "hp", hp);
            ds_map_add(enemy, "maxHp", hp);
            ds_map_add(enemy, "index", i);
            ds_map_add(enemy, "friendly", false);
    }
    
    //determining attack order
    var ambushChance = irandom_range(1,100);
    if (67 > ambushChance) {
        var order = ds_list_create();
        //party ambushes enemy
        genLogEntry_scr("Party caught the enemy by surprise", false, false);
        var tempList = ds_list_create();
        var size = ds_list_size(global.party);
        for (var i=0; i<size; i++) {
            ds_list_add(tempList, ds_list_find_value(global.party, i));
        }
        ds_list_shuffle(tempList);
        for (var i=0; i<size; i++) {
            ds_list_add(order, ds_list_find_value(tempList,i));
        }

        /*ds_list_clear(tempList);
        size = ds_list_size(global.enemyParty);
        for (var i=0; i<size; i++) {
            ds_list_add(tempList, ds_list_find_value(global.enemyParty, i));
        }
        ds_list_shuffle(tempList);
        for (var i=0; i<size; i++) {
            ds_list_add(order, ds_list_find_value(tempList,i));
        }
        ds_list_destroy(tempList);*/
        
    } else if (33 > ambushChance) {
        //level opportunity
        var order = orderAttackers_scr();
    } else {
        genLogEntry_scr("Enemy caught the party by surprise", false, false);
        var order = ds_list_create();
        //enemy ambushes party
        var tempList = ds_list_create();
        var size = ds_list_size(global.enemyParty);
        for (var i=0; i<size; i++) {
            ds_list_add(tempList, ds_list_find_value(global.enemyParty, i));
        }
        ds_list_shuffle(tempList);
        for (var i=0; i<size; i++) {
            ds_list_add(order, ds_list_find_value(tempList,i));
        }

        /*ds_list_clear(tempList);
        size = ds_list_size(global.party);
        for (var i=0; i<size; i++) {
            ds_list_add(tempList, ds_list_find_value(global.party, i));
        }
        ds_list_shuffle(tempList);
        for (var i=0; i<size; i++) {
            ds_list_add(order, ds_list_find_value(tempList,i));
        }
        ds_list_destroy(tempList);*/
        
    }

    var victory = false;
    var fighting = true;
    while(fighting) {
        show_debug_message("-- new round --");
    
        var i_size = ds_list_size(order);
        for (var i=0; i<i_size; i++) {
            var attacker = 0;
            while (true) {
                if (i >= i_size) {
                    break;
                } else {
                    attacker = ds_list_find_value(order, i);
                    if (ds_map_find_value(attacker, "hp") > 0) {
                        break;
                    }
                }
                i++;
            }
            if (i >= i_size) {
                break;
            }
            
            var target = setTarget_scr(ds_map_find_value(attacker, "friendly"));
            //this should never trigger
            if (target == 0) {
                fighting = false;
                if (ds_map_find_value(attacker, "friendly")) {
                    victory = true;
                }
                break;
            }
            
            var dmg = irandom_range(1, 3)*ds_map_find_value(attacker, "level")/2;
            var newHp = ds_map_find_value(target, "hp") - dmg;
            ds_map_replace(target, "hp", newHp);
            if (ds_map_find_value(target, "hp") < 0) { ds_map_replace(target, "hp", 0);}
            
            if (target[? "friendly"]) {
                dmgTaken += dmg;
            } else {
                dmgDealt += dmg;
            }
            
            if (ds_map_find_value(target, "hp") <= 0) {
                genLogEntry_scr(string(ds_map_find_value(attacker, "name"))+" felled "+string(ds_map_find_value(target, "name")), false, false);
                
                //attending to visual representation upon hero defeat
                if (ds_map_find_value(target, "friendly")) {
                    var deadIndex = ds_map_find_value(target,"partyIndex");
                    with(hero_obj) {
                        if (self.partyIndex == deadIndex) {
                            instance_destroy();
                        }
                    }
                    var partyIndex = 0;
                    var j_size = ds_list_size(global.party);
                    for (var j=0; j<j_size; j++) {
                        var hero = ds_list_find_value(global.party, j);
                        if (ds_map_find_value(hero, "hp") > 0) {
                            var shiftIndex = ds_map_find_value(hero, "partyIndex");
                            ds_map_replace(hero, "partyIndex", partyIndex);
                            switch(partyIndex) {
                                case 0:
                                    with(hero_obj) {
                                        if (self.partyIndex == shiftIndex) {
                                            self.x = 375;
                                            self.y = 675;
                                            self.partyIndex = partyIndex;
                                        }
                                    }
                                    break;
                                case 1:
                                    with(hero_obj) {
                                        if (self.partyIndex == shiftIndex) {
                                            self.x = 300;
                                            self.y = 712.5;
                                        }
                                    }
                                    break;
                                case 2:
                                    with(hero_obj) {
                                        if (self.partyIndex == shiftIndex) {
                                            self.x = 450;
                                            self.y = 712.5;
                                        }
                                    }
                                    break;
                            }
                            partyIndex++;
                        }
                    }
                }
                
                //seeing if party still stands
                if (ds_map_find_value(attacker, "friendly")) {
                    var targetParty = global.enemyParty;
                } else {
                    targetParty = global.party;
                }
                var j_size = ds_list_size(targetParty);
                var partyDefeated = true;
                for (var j=0; j<j_size; j++) {
                    var member = ds_list_find_value(targetParty, j);
                    if (ds_map_find_value(member, "hp") > 0) {
                        partyDefeated = false;
                        break;
                    }
                }
                if (partyDefeated) {
                    fighting = false;
                    if (ds_map_find_value(attacker, "friendly")) {
                        victory = true;
                    }
                    break;
                }
            } else {
                genLogEntry_scr(string(ds_map_find_value(attacker, "name"))+" hit "+string(ds_map_find_value(target, "name"))+" for "+string(dmg)+"dmg. "+string(ds_map_find_value(target, "name"))+" has "+string(ds_map_find_value(target, "hp"))+" health left", false, false);
            }
        }
        if (false == fighting) {
            break;
        }

        //either this or shuffle
        ds_list_destroy(order);
        order = orderAttackers_scr();
    }

    battleRecap_scr(victory, dmgDealt, dmgTaken);
        
    var size = ds_list_size(global.enemyParty);
    for (var i=size-1; i>=0; i--) {
        ds_map_destroy(ds_list_find_value(global.enemyParty, i));
    }
    ds_list_destroy(global.enemyParty);

    if (victory) {
        return 0;
    } else {
        return 1;
    }

}
