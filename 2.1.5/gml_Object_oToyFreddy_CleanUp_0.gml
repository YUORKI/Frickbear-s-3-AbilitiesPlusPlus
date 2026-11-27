event_inherited();
audio_stop_sound(SOUND_Crying);
audio_sound_gain(SOUND_Crying, 1, 0);
sprite_delete(SPRITE_Cameras);
skin_sound_delete_array([SOUND_Defeated, SOUND_Crying]);
