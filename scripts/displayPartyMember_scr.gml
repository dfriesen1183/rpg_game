{
    var index = argument0;
    var partyIndex = argument1;
    var found = argument2;

    var member_x, member_y;
    switch(partyIndex) {
        case 0:
            member_x = 375;
            member_y = 675;
            break;
        case 1:
            member_x = 300;
            member_y = 712.5;
            break;
        case 2:
            member_x = 450;
            member_y = 712.5;
            break;
        case 3:
            member_x = 375;
            member_y = 750;
            break;
    }

    var member = instance_create(member_x, member_y, hero_obj);
    member.index = index;
    member.partyIndex = partyIndex;
    member.found = found;
    
    renderHero_scr();
}

