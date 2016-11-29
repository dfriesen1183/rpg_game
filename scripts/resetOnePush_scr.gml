{
    var push = argument0;
    
    if (!is_undefined(push) && "null" != push && ds_exists(push, ds_type_list)) {
        if (global.prefPush && true == push[| 0]) {
            push_local_notification(push[| 1], push[| 2], push[| 3], push[| 4]);
        }
    }
}

