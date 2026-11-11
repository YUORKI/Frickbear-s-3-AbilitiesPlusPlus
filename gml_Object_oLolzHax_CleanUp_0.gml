if (Head != undefined)
    instance_destroy(Head);

if (LTenna != undefined)
    instance_destroy(LTenna);

if (RTenna != undefined)
    instance_destroy(RTenna);

if (Body != undefined)
    instance_destroy(Body);

if (LArm != undefined)
    instance_destroy(LArm);

if (RArm != undefined)
    instance_destroy(RArm);

audio_stop_sound(SOUND_ThemeSong);
sprite_delete(SPRITE_Head);
sprite_delete(SPRITE_Body);
sprite_delete(SPRITE_Arm);
sprite_delete(SPRITE_Antenna);
sprite_delete(SPRITE_Window);
skin_sound_delete_array(SOUND_Appear);
skin_sound_delete_array(SOUND_Chosen);
skin_sound_delete_array([SOUND_Static, SOUND_ThemeSong]);
