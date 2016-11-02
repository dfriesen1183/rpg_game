{
    //displayPartyMember_scr(index, index, boolean);
    //places party member onto quest board
    
    var index = argument0;
    var partyIndex = argument1;
    var found = argument2;

    var member,
        member_x, member_y;
    switch(partyIndex) {
        case 0:
            member_x = 0.5;
            member_y = 0.49;
            member = createInstance_scr(hero_obj, member_x,member_y, 1,2, 0.1,-1);
            break;
        case 1:
            member_x = 0.45;
            member_y = 0.5;
            member = createInstance_scr(hero_obj, member_x,member_y, 2,1, 0.1,-1);
            break;
        case 2:
            member_x = 0.55;
            member_y = 0.5;
            member = createInstance_scr(hero_obj, member_x,member_y, 0,1, 0.1,-1);
            break;
        default:
            member_x = 0.5;
            member_y = 0.51;
            member = createInstance_scr(hero_obj, member_x,member_y, 1,0, 0.1,-1);
            break;
    }

    member.index = index;
    member.partyIndex = partyIndex;
    member.found = found;
    
    renderHero_scr(member);
}

