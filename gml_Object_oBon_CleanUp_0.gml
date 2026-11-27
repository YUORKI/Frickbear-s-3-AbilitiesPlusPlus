if (surface_exists(Surf))
    surface_free(Surf);

audio_stop_sound(SOUND_Clatter);
audio_stop_sound(SOUND_Music);
sprite_delete(SPRITE_Body);
sprite_delete(SPRITE_Ear);
sprite_delete(SPRITE_Hand);
sprite_delete(SPRITE_Head);
sprite_delete(SPRITE_Jaw);
sprite_delete(SPRITE_Leg);
sprite_delete(SPRITE_LowerArm);
sprite_delete(SPRITE_Tie);
sprite_delete(SPRITE_UpperArm);
sprite_delete(SPRITE_Zapper);
sprite_delete(SPRITE_Life);
skin_sound_delete_array([SOUND_Clatter, SOUND_Music, SOUND_Impact, SOUND_Zapped, SOUND_Clicked, SOUND_Error]);
skin_sound_delete_array(SOUND_Move);
