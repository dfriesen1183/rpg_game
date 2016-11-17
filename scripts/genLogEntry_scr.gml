{
    //genLogEntry_scr(string, boolean, boolean);
    //records and displays log entry

    var rec = argument0;
    var text = argument1;
    var display = argument2;
    var add = argument3;

    var logText = rec[? "log"];
    ds_list_add(logText, text);
    show_debug_message(text);
}

