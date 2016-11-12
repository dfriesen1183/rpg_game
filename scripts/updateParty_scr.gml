{
    /*var party = ds_map_find_value(global.activeQuests[| global.quest], "party");
    with (hero_obj) {
        var member = global.heroes[| member.index];
        if (member[? "hp"] > 0) {
        
        } else {
        
        }
    }*/
    var party = ds_map_find_value(global.activeQuests[| global.quest], "party");
    var size = ds_list_size(party);
    for (var i=0; i<size; i++) {
        var member = party[| i];
        if (0 < member[? "hp"] && 0 <= member[? "partyIndex"]) {
            var heroUnfound = true;
            with (hero_obj) {
                if (id.partyIndex == member[? "partyIndex"]) {
                    heroUnfound = false;
                    movePartyMember_scr(id);
                }
            }
            if (heroUnfound) {
                show_debug_message(string(member[? "index"])+", "+string(member[? "partyIndex"])+", "+string(member[? "found"]));
                displayPartyMember_scr(member[? "index"], member[? "partyIndex"], member[? "found"]);
                with (hero_obj) {
                    show_debug_message(string(id.index)+", "+string(id.partyIndex)+", "+string(id.found));
                }
            }
        } else {
            with (hero_obj) {
                if (id.partyIndex == member[? "partyIndex"]) {
                    instance_destroy();
                }
            }
        }
    }
}

