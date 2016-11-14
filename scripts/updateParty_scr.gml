{
    /*var party = ds_map_find_value(global.activeQuests[| global.quest], "party");
    with (hero_obj) {
        var member = global.heroes[| member.index];
        if (member[? "hp"] > 0) {
        
        } else {
        
        }
    }*/
    
    var questId = argument0;
    var quest = getQuestIndex_scr(questId);

    
    if (questId == global.quest) {
        with (questVisual_obj) {
            var record = global.activeQuests[| quest];
            var duration = record[? "duration"];
            var seconds;
            if (date_compare_datetime(global.sysTime[? "val"], record[? "endTime"]) > 0) {
                seconds = 0;
            } else {
                seconds = date_second_span(global.sysTime[? "val"], record[? "endTime"]);
            }
            id.party_y = -(duration - seconds) / duration;
            id.party_y *= id.mapLengthHeight;
            id.party_y += id.base_y;
        }

        var party = ds_map_find_value(global.activeQuests[| quest], "party");
        var size = ds_list_size(party);
        for (var i=0; i<size; i++) {
            var member = party[| i];
            if (0 < member[? "hp"]) {
                var _heroUnfound = true;
                with (hero_obj) {
                    if (id.heroId == member[? "id"]) {
                        _heroUnfound = false;
                        id.index = member[? "index"];
                        id.partyIndex = member[? "partyIndex"];
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

