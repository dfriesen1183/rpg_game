{
    var push = argument0;
    
    if (global.prefPush && true == push[| 0]) {
        push_local_notification(push[| 1], push[| 2], push[| 3], push[| 4]);
    }
}

