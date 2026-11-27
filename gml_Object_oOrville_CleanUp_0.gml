instance_destroy(oOrville_Animations);

if (audio_is_playing(Voiceline))
    audio_stop_sound(Voiceline);

sprite_delete(SPRITE_Head);
sprite_delete(SPRITE_Hand);
sprite_delete(SPRITE_Body);
sprite_delete(SPRITE_Cards);
skin_sound_delete_array([SOUND_Sparkle, SOUND_Swoosh, SOUND_Appear, SOUND_WhipCrack]);
