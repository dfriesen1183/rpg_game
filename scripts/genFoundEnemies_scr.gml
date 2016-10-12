{
    global.record.battleCount += 1;
    
    var enemyCount = floor(random_range(1,4));
    show_debug_message("party of "+string(enemyCount)+" enemies found");
    var enemyParty = ds_list_create();
    for (var i=0; i<enemyCount; i++) {
        var enemy = instance_create(0,0,enemy_obj);
        enemy.hp = floor(random_range(4,11));
        enemy.totalHp = enemy.hp;
        enemy.level = floor(random_range(1,4));
        ds_list_add(enemyParty, enemy);
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
            var dmg = floor(random_range(1, 4))*attacker.level/2;
            target.hp -= dmg; //trying to balance...
            if (target.hp < 0) { target.hp = 0;}
            
            if (target.hp <= 0) {
                show_debug_message("Hero["+string(i)+"] slew Enemy["+string(targetIndex)+"]");
                ds_list_delete(enemyParty, targetIndex);
                if (ds_list_size(enemyParty) <= 0) {
                    fighting = false;
                    break;
                }
            } else {
                show_debug_message("Hero["+string(i)+"] hit Enemy["+string(targetIndex)+"] for "+string(dmg)+"dmg. Enemy has "+string(target.hp)+" health left");
            }
        }
        if (fighting) {
            //enemy turn
            show_debug_message("Enemy Turn:");
            for (var i=0; i<ds_list_size(enemyParty); i++) {
                var attacker = ds_list_find_value(enemyParty,i);

                var targetIndex = floor(random_range(0, ds_list_size(global.party)));
                var target = ds_list_find_value(global.party, targetIndex);
                var dmg = floor(random_range(1, 4))*attacker.level/2;
                target.hp -= dmg;
                if (target.hp < 0) { target.hp = 0;}
                
                if (target.hp <= 0) {
                    show_debug_message("Enemy["+string(i)+"] slew Hero["+string(targetIndex)+"]");
                    //deleting hero from party
                    with(hero_obj) {
                        if (0 >= self.hp) {
                            instance_destroy();
                        }
                    }
                    ds_list_delete(global.party, targetIndex);
                    
                    //shifting heroes to fill visual gaps in party
                    for (var j=targetIndex; j<ds_list_size(global.party); j++) {
                        var hero = ds_list_find_value(global.party,j);
                        switch(j) {
                            case 0:
                                hero.x = 375;
                                hero.y = 675;
                                break;
                            case 1:
                                hero.x = 300;
                                hero.y = 712.5;
                                break;
                            case 2:
                                hero.x = 450;
                                hero.y = 712.5;
                                break;
                        }
                    }
                    if (ds_list_size(global.party) <= 0) {
                        fighting = false;
                        break;
                    }
                } else {
                    show_debug_message("Enemy["+string(i)+"] hit Hero["+string(targetIndex)+"] for "+string(dmg)+"dmg. Hero has "+string(target.hp)+" health left");
                }
            }
        }
    }
}
