if (Head != undefined)
{
    instance_destroy(Head);
    instance_destroy(Torso);
    instance_destroy(ArmL);
    instance_destroy(ArmR);
    instance_destroy(HandL);
    instance_destroy(HandR);
}

audio_stop_sound(SOUND_Garble);
sprite_delete(SPRITE_Head);
sprite_delete(SPRITE_Body);
sprite_delete(SPRITE_Arm);
skin_sound_delete_array([SOUND_Appear, SOUND_Garble, SOUND_Scare]);
