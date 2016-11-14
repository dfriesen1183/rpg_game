{
    /*var party = ds_map_find_value(global.activeQuests[| global.quest], "party");
    with (hero_obj) {
        var member = global.heroes[| member.index];
        if (member[? "hp"] > 0) {
        
        } else {
        
        }
    }*/
    
    var questId = argument0;
    show_debug_message(questId);
    
    if (questId == global.quest) {
        var quest = getQuestIndex_scr(questId);
        var party = ds_map_find_value(global.activeQuests[| quest], "party");
        var size = ds_list_size(party);
        for (var i=0; i<size; i++) {
            var member = party[| i];
            if (0 < member[? "hp"]) {
                var _heroUnfound = true;
                with (hero_obj) {
                    if (id.heroId == member[? "id"]) {
                        _heroUnfound = false;
                        movePartyMember_scr(id);
                    }
                }
                if (_heroUnfound) {
                    displayPartyMember_scr(member);
                }
            } else {
                with (hero_obj) {
                    if (id.heroId == member[? "id"]) {
                        instance_destroy();
                    }
                }
            }
        }
    }
}

