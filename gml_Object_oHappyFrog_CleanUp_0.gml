surface_free(FrogSurf);
audio_stop_sound(SOUND_Rumble);
audio_stop_sound(SOUND_Music);

if (TabletUp)
    global.PanelUp = false;

sprite_delete(SPRITE_HappyFrog);
sprite_delete(SPRITE_Background);
sprite_delete(SPRITE_Border);
sprite_delete(SPRITE_Buttons);
sprite_delete(SPRITE_Tiles);
sprite_delete(SPRITE_Tablet);
skin_sound_delete_array([SOUND_Music, SOUND_Rumble, SOUND_Flip, SOUND_Correct, SOUND_Error, SOUND_Select]);
skin_sound_delete_array(SOUND_Solved);
instance_destroy(oHappyFrogTablet);
