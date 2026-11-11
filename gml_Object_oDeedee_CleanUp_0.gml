surface_free(DeedeeSurf);

if (instance_exists(OBJ_FishingLine))
    instance_destroy(OBJ_FishingLine);

if (instance_exists(OBJ_Sign))
    instance_destroy(OBJ_Sign);

instance_destroy(oToken);
audio_stop_sound(sfxDeedee_Reel);
