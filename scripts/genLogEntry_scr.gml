{
    //genLogEntry_scr(string);
    //records and displays log entry
    
    var text = argument0;
    ds_list_insert(global.logText, 0, text);
    displayLogEntry_scr(text);
}

