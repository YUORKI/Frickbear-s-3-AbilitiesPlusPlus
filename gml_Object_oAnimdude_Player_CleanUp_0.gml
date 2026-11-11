if (surface_exists(AnimdudeSurf))
    surface_free(AnimdudeSurf);

audio_stop_sound(SOUND_Music);
sprite_delete(SPRITE_Player);
sprite_delete(SPRITE_Dragon);
sprite_delete(SPRITE_Floor);
sprite_delete(SPRITE_Wall);
sprite_delete(SPRITE_Lava);
sprite_delete(SPRITE_SpikeShort);
sprite_delete(SPRITE_SpikeLong);
sprite_delete(SPRITE_SpikeHorizontal);
sprite_delete(SPRITE_Switch);
sprite_delete(SPRITE_Fireball);
sprite_delete(SPRITE_Frame);
sprite_delete(SPRITE_Trophy);
sprite_delete(SPRITE_Sign);
