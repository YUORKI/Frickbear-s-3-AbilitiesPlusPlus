surface_free(DeedeeSurf);

if (instance_exists(OBJ_FishingLine))
    instance_destroy(OBJ_FishingLine);

if (instance_exists(OBJ_Sign))
    instance_destroy(OBJ_Sign);

instance_destroy(oToken);
audio_stop_sound(SOUND_Reel);
sprite_delete(SPRITE_Deedee);
sprite_delete(SPRITE_Background);
sprite_delete(SPRITE_FishingLine);
sprite_delete(SPRITE_Sign);
sprite_delete(SPRITE_Tokens);
skin_sound_delete_array(SOUND_Clicked);
skin_sound_delete_array(SOUND_Hurt);
skin_sound_delete_array([SOUND_Reel, SOUND_Splash, SOUND_Drain, SOUND_Kick, SOUND_Slip]);
