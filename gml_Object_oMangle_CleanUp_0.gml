if (StickyNote != undefined)
    instance_destroy(StickyNote);

audio_stop_sound(SOUND_Garble);
sprite_delete(SPRITE_Cameras);
sprite_delete(SPRITE_CamRadar);
sprite_delete(SPRITE_StickyNote);
skin_sound_delete_array([SOUND_Garble]);
