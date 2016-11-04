{
    //drawText_scr()
    //(called from object)

    draw_set_color(id.textColor);
    draw_set_alpha(1);
    draw_set_halign(id.halign);
    draw_set_valign(id.valign);
    
    draw_text_ext(pos_x, pos_y, id.text, id.lineHeight, id.width*id.scale_x);
}
