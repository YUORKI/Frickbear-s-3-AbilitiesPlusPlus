instance_destroy(Body);
instance_destroy(Head);

if (!is_undefined(Sound))
    audio_stop_sound(Sound);
