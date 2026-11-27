surface_free(StaticSurf);
audio_stop_sound(Static);
instance_destroy(oFoxyEXE_FakerParent);
audio_stop_sound(SOUND_Countdown);
sprite_delete(SPRITE_Screen);
sprite_delete(SPRITE_CamRadar);
skin_sound_delete_array([SOUND_Countdown, SOUND_Glitch, SOUND_Static]);
skin_sound_delete_array(SOUND_Laugh);
