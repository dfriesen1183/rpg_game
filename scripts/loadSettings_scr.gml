{
    var file = "settings.ini";

        
    ini_open(file);
    global.prefSound = ini_read_real('prefs','sound',1);
    global.prefMusic = ini_read_real('prefs','music',1);
    global.prefPush = ini_read_real('prefs','push',1);
    ini_close();
    
    saveSettings_scr();
}

