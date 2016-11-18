{
    var questId = argument0;
    
    if (questId == global.quest) {
        if (0 < instance_number(questVisualClock_obj)) {
            var quest = getQuestIndex_scr(global.quest);
            var record = global.activeQuests[| quest];
            var timeVal = ceil(date_second_span(global.sysTime[? "val"], record[? "startTime"]));
            global.questClock.time = timeVal;
            global.questClock.display.text = secToClock_scr(timeVal, 1);
        }
    }
}

