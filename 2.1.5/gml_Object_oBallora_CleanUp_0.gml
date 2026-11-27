audio_stop_sound(SOUND_MusicBox);
audio_stop_sound(SOUND_Warning);
sprite_delete(SPRITE_Minireenas);
skin_sound_delete_array(SOUND_Clicked);
skin_sound_delete_array([SOUND_MusicBox, SOUND_Warning]);
