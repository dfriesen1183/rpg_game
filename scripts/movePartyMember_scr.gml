{
    var member = argument0;
    var member_x = global.questVisual.party_x;
    var member_y = global.questVisual.party_y;

    switch(member.partyIndex) {
        case 0:
            member_y -= 0.01;
            moveInstance_scr(member, member_x,member_y, 1,2, 0.1,-1);
            break;
        case 1:
            member_x -= 0.05;
            moveInstance_scr(member, member_x,member_y, 2,1, 0.1,-1);
            break;
        case 2:
            member_x += 0.05;
            moveInstance_scr(member, member_x,member_y, 0,1, 0.1,-1);
            break;
        default:
            member_y += 0.01;
            moveInstance_scr(member, member_x,member_y, 1,0, 0.1,-1);
            break;
    }
}

