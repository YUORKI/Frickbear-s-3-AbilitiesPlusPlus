if (Head != -1)
{
    instance_destroy(Head);
    instance_destroy(Body);
    instance_destroy(LUpperArm);
    instance_destroy(RUpperArm);
    instance_destroy(LLowerArm);
    instance_destroy(RLowerArm);
    instance_destroy(Pelvis);
}

audio_stop_sound(Static);
clear_window(ID);
sprite_delete(SPRITE_Head);
sprite_delete(SPRITE_LowerArm);
sprite_delete(SPRITE_Pelvis);
sprite_delete(SPRITE_Torso);
sprite_delete(SPRITE_UpperArm);
skin_sound_delete_array([SOUND_Ambience, SOUND_Scare, SOUND_Appear, SOUND_Hit, SOUND_Leave]);
