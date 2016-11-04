{
    var member = argument0;
    var member_x,
        member_y;

    switch(member.partyIndex) {
        case 0:
            member_x = 0.5;
            member_y = 0.49;
            moveInstance_scr(member, member_x,member_y, 1,2, 0.1,-1);
            break;
        case 1:
            member_x = 0.45;
            member_y = 0.5;
            moveInstance_scr(member, member_x,member_y, 2,1, 0.1,-1);
            break;
        case 2:
            member_x = 0.55;
            member_y = 0.5;
            moveInstance_scr(member, member_x,member_y, 0,1, 0.1,-1);
            break;
        default:
            member_x = 0.5;
            member_y = 0.51;
            moveInstance_scr(member, member_x,member_y, 1,0, 0.1,-1);
            break;
    }
}

