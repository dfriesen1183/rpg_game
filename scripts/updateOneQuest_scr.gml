{
    var quest = argument0;
    var record = global.activeQuests[| quest];
    var questId = record[? "id"];
    var encs = record[? "futureEnc"];
    
    //activating encounters
    var size = ds_list_size(encs);
    while (size) {
        var enc = encs[| 0];
        if (date_compare_datetime(global.sysTime[? "val"], enc[? "time"]) > 0) {
            show_debug_message("at runEncounter");
            var result = runEncounter_scr(quest, enc);
            show_debug_message("encounter run");
            ds_list_add_map(record[? "pastEnc"], enc);
            ds_list_delete(encs, 0);
            show_debug_message("enc moved");
            size--;
            if (1 == result) {
                show_debug_message("fail quest");
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
    show_debug_message("moment's encounters through");
    //ending quest if done
    if (date_compare_datetime(global.sysTime[? "val"], record[? "endTime"]) > 0) {
        show_debug_message("quest over");
        record[? "complete"] = true;
        record[? "success"] = true;
        var party = record[? "party"];
        if (questId == global.quest) {
            spawnQuestEndMenu_scr();
        }
    }
    show_debug_message("quest continue");
    //updating displayed party members
    if (questId == global.quest) {
        show_debug_message("updating party");
        updateParty_scr();
        show_debug_message("party updated");
    }
    show_debug_message("updateOne over");
}
