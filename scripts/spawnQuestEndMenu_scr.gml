{
    /*with (global.cwestCloc) {
        instance_destroy();
    }*/
    var menu_y = 1 - global.onQuestMenuOffset;
    var toReview = createInstance_scr(questMenuComplete_obj, global.roomWidth,menu_y, 2,0, -1,global.onQuestMenuOffset);
    audio_play_sound(success_snd,1,false);
}
