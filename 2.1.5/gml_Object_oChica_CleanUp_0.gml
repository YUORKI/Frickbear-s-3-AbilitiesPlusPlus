instance_destroy(Eyes);
sprite_delete(SPRITE_Cameras);
sprite_delete(SPRITE_Eyes);

if (audio_get_type(SOUND_Steps))
    audio_destroy_stream(SOUND_Steps);

if (audio_get_type(SOUND_Growl))
    audio_destroy_stream(SOUND_Growl);
