{
    //displayPartyMember_scr(index, index, boolean);
    //places party member onto quest board
    
    var index = argument0;
    var partyIndex = argument1;
    var found = argument2;

    var member = createInstance_scr(hero_obj, 0,0, 0,0, 0.1,-1);
    movePartyMember_scr(member);

    member.index = index;
    member.partyIndex = partyIndex;
    member.found = found;
    
    renderHero_scr(member);
}

