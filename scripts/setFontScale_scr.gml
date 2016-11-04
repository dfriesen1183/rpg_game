{
    //setFontScale_scr()
    //(called from object)

    if (id.scale_x >= 2) {//probably ultimately to be based on room size
        draw_set_font(id.fontLrg);
    } else if (id.scale_x >= 1.5) {
        draw_set_font(id.fontMed);
    } else {
        draw_set_font(id.fontSml);
    }
}

