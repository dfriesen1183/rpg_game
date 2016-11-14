{
    //genFoundEnemies_scr();
    //returns boolean 'party defeat'
    //generates enemy encounter
    //  generates enemy party
    //  determines ambush advantage
    //  loops through battle until one party is defeated
    //    determines attack order
    //    attackers find targets and deal damage
    
    
    var questId = argument0;
    var quest = getQuestIndex_scr(questId);
    var enc = argument1;
    var record = enc[? "record"];
    var rootRecord = global.activeQuests[| quest];
    var party = record[? "party"];

    record[? "battles"] += 1;
    var dmgTaken = 0;
    var dmgDealt = 0;
    
    //assembling enemy party
    var enemyCount = irandom_range(1,4);
    genLogEntry_scr(record, string(enemyCount)+" enemies found", false, false);
    global.enemyParty = ds_list_create();
    
    for (var i=0; i<enemyCount; i++) {
        global.enemyParty[| i] = ds_map_create();
        var enemy = global.enemyParty[| i];
            var level = irandom_range(2,3);
            var hp = irandom_range(5,15);
            enemy[? "name"] = "Enemy"+string(i);
            enemy[? "level"] = level;
            enemy[? "hp"] = hp;
            enemy[? "maxHp"] = hp;
            enemy[? "index"] = i;
            enemy[? "friendly"] = false;
    }
    
    //determining attack order
    var ambushChance = irandom_range(1,100);
    if (67 > ambushChance) {
        //party ambushes enemy
        genLogEntry_scr(record, "Party caught the enemy by surprise", false, false);
        var order = ds_list_create();
        var size = ds_list_size(party);
        for (var i=0; i<size; i++) {
            ds_list_add(order, party[| i]);
        }
        ds_list_shuffle(order);
        
    } else if (33 > ambushChance) {
        //level opportunity
        var order = orderAttackers_scr(record);
    } else {
        //enemy ambushes party
        genLogEntry_scr(record, "Enemy caught the party by surprise", false, false);
        var order = ds_list_create();
        var size = ds_list_size(global.enemyParty);
        for (var i=0; i<size; i++) {
            ds_list_add(order, global.enemyParty[| i]);
        }
        ds_list_shuffle(order);
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
                    attacker = order[| i];
                    if (0 < attacker[? "hp"]) {
                        break;
                    }
                }
                i++;
            }
            if (i >= i_size) {
                break;
            }
            
            var target = setTarget_scr(record, attacker[? "friendly"]);
            //this should never trigger
            if (target == 0) {
                fighting = false;
                if (attacker[? "friendly"]) {
                    victory = true;
                }
                break;
            }
            
            var dmg = irandom_range(1, 3)*attacker[? "level"]/2;
            target[? "hp"] -= dmg;
            if (0 > target[? "hp"]) { target[? "hp"] = 0;}
            
            if (target[? "friendly"]) {
                dmgTaken += dmg;
            } else {
                dmgDealt += dmg;
            }
            
            if (0 >= target[? "hp"]) {
                genLogEntry_scr(record, string(attacker[? "name"])+" felled "+string(target[? "name"]), false, false);
                
                //attending to visual representation upon hero defeat
                if (target[? "friendly"]) {
                    target[? "partyIndex"] = -1;
                    target[? "died"] = questId;
                    var _partyIndex = 0;
                    var partySize = ds_list_size(party);
                    for (var j=0; j<partySize; j++) {
                        var hero = party[| j];
                        if (0 < hero[? "hp"]) {
                            hero[? "partyIndex"] = _partyIndex;
                            _partyIndex++;
                        }
                    }
                }
                
                //seeing if party still stands
                if (attacker[? "friendly"]) {
                    var targetParty = global.enemyParty;
                } else {
                    targetParty = party;
                }
                var j_size = ds_list_size(targetParty);
                var partyDefeated = true;
                for (var j=0; j<j_size; j++) {
                    var member = targetParty[| j];
                    if (0 < member[? "hp"]) {
                        partyDefeated = false;
                        break;
                    }
                }
                if (partyDefeated) {
                    fighting = false;
                    if (attacker[? "friendly"]) {
                        victory = true;
                    }
                    break;
                }
            } else {
                genLogEntry_scr(record, string(attacker[? "name"])+" hit "+string(target[? "name"])+" for "+string(dmg)+"dmg. "+string(target[? "name"])+" has "+string(target[? "hp"])+" health left", false, false);
            }
        }
        if (false == fighting) {
            break;
        }

        //either this or shuffle
        ds_list_destroy(order);
        order = orderAttackers_scr(record);
    }

    battleRecap_scr(record, victory, dmgDealt, dmgTaken);
        
    var size = ds_list_size(global.enemyParty);
    for (var i=size-1; i>=0; i--) {
        ds_map_destroy(global.enemyParty[| i]);
    }
    ds_list_destroy(global.enemyParty);


    if (victory) {
        var push = enc[? "push"];
        push[| 2] = "Fought a battle and won!"
        push[| 3] = "Fought "+string(enemyCount)+" enemies";
        return true;
    } else {
        var push = enc[? "push"];
        push[| 2] = "Quest Failed!"
        push[| 3] = "The party failed the quest...";
        return false;
    }

}
