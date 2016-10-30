{
    var dim = argument0;
    var list = argument1;
    
    switch(dim){
        case "left":
            ds_list_copy(global.left, list);
            break;
        case "right":
            ds_list_copy(global.right, list);
            break;
        case "up":
            ds_list_copy(global.up, list);
            break;
        case "down":
            ds_list_copy(global.down, list);
            break;
        default:
            show_debug_message("invalid dimension");
            break;
    }
}

