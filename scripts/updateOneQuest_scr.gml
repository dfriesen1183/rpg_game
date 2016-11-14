{
    var quest = argument0;
    show_debug_message("quest");
    show_debug_message(quest);
    var record = global.activeQuests[| quest];
    show_debug_message("record");
    output_map(record);
    var questId = record[? "id"];
    show_debug_message("questId");
    show_debug_message(questId);
    var encs = record[? "futureEnc"];
    
    //activating encounters
    var size = ds_list_size(encs);
    while (size) {
        var enc = encs[| 0];
        if (date_compare_datetime(global.sysTime[? "val"], enc[? "time"]) > 0) {
            show_debug_message("enc");
            output_map(enc);
            show_debug_message("encRecord");
            output_map(enc[? "record"]);
            var result = runEncounter_scr(quest, enc);
            ds_list_add_map(record[? "pastEnc"], enc);
            ds_list_delete(encs, 0);
            size--;
            if (1 == result) {
                record[? "complete"] = true;
                record[? "success"] = false;
                if (questId == global.quest) {
                    spawnQuestEndMenu_scr();
                }
            }
        } else {
            break;
        }
    }

    //ending quest if done
    if (date_compare_datetime(global.sysTime[? "val"], record[? "endTime"]) > 0) {
        record[? "complete"] = true;
        record[? "success"] = true;
        var party = record[? "party"];
        if (questId == global.quest) {
            spawnQuestEndMenu_scr();
        }
    }
    //updating displayed party members
    updateParty_scr(questId);
}

