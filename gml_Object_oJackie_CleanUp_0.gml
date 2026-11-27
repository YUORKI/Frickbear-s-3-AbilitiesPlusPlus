if (Body != -1)
{
    instance_destroy(Body);
    instance_destroy(Head);
    instance_destroy(ArmL);
    instance_destroy(HandL);
    instance_destroy(PigtailL);
    instance_destroy(ArmR);
    instance_destroy(HandR);
    instance_destroy(PigtailR);
}

sprite_delete(SPRITE_Arm);
sprite_delete(SPRITE_Body);
sprite_delete(SPRITE_Crank);
sprite_delete(SPRITE_Hair);
sprite_delete(SPRITE_Hand);
sprite_delete(SPRITE_Head);
skin_sound_delete_array([SOUND_Drop, SOUND_Slam, SOUND_Popup, SOUND_Impact, SOUND_Release, SOUND_Crank, SOUND_Pull, SOUND_Launch]);
skin_sound_delete_array(SOUND_Appear);
