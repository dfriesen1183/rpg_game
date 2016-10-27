{
    //genLogEntry_scr(string, boolean, boolean);
    //records and displays log entry

    var text = argument0;
    var display = argument1;
    var add = argument2;

    show_debug_message(text);
    ds_list_add(global.logText, text);
    if (display) {
        displayLogEntry_scr(text, add);
    }
}

