{
    var file = "settings.ini";
    
    
    ini_open(file);
    ini_write_real('prefs','sound',global.prefSound);
    ini_write_real('prefs','music',global.prefMusic);
    ini_write_real('prefs','push',global.prefPush);
    ini_close();
}

