{
    //displayPartyMember_scr(index, index, boolean);
    //places party member onto quest board
    
    var index = argument0;
    var partyIndex = argument1;
    var found = argument2;

    var member = createInstance_scr(hero_obj, 0,0, 0,0, 0.1,-1);
    member.index = index;
    member.partyIndex = partyIndex;
    member.found = found;
    movePartyMember_scr(member);
    
    renderHero_scr(member);
}

