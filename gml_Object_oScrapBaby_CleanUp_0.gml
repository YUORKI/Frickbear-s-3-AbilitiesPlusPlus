instance_destroy(oScrapBaby_WarningDrawer);
audio_stop_sound(SOUND_Clatter);
sprite_delete(SPRITE_Window);
sprite_delete(SPRITE_Warning);
sprite_delete(SPRITE_CamRadar);
skin_sound_delete_array([SOUND_Clatter, SOUND_Powerout]);
