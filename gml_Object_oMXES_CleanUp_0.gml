with (oCamButton)
    MXESInfected = false;

instance_destroy(oMXES_Animation);
sprite_delete(SPRITE_Head);
sprite_delete(SPRITE_Body);
sprite_delete(SPRITE_Glitch);
skin_sound_delete_array([SOUND_Zapped, SOUND_Rise, SOUND_Fall]);
