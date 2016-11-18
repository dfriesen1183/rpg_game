{
    var questId = argument0;
    
    if (questId == global.quest) {
        if (0 < instance_number(questVisualClock_obj)) {
            var quest = getQuestIndex_scr(global.quest);
            var record = global.activeQuests[| quest];
            global.questGold.display.text = string(record[? "gold"]);
        }
    }
}

