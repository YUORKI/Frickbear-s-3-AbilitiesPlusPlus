if (surface_exists(PigSurf))
    surface_free(PigSurf);

sprite_delete(SPRITE_Body);
sprite_delete(SPRITE_Background);
skin_sound_delete_array(SOUND_Hmm);
skin_sound_delete_array(SOUND_Pass);
skin_sound_delete_array([SOUND_Sparkle]);
skin_sound_delete_array([SOUND_Tick]);
