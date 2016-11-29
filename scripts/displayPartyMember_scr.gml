{
    //displayPartyMember_scr(index, index, boolean);
    //places party member onto quest board
    
    var hero = argument0;

    if (0 > hero[? "died"]) {
        var member = createInstance_scr(hero_obj, 0,0, 0,0, 0.1,-1);
        member.heroId = hero[? "id"];
        member.index = hero[? "index"];
        member.partyIndex = hero[? "partyIndex"];
        member.found = hero[? "found"];
        movePartyMember_scr(member);
        
        renderHero_scr(member);
    }
}

