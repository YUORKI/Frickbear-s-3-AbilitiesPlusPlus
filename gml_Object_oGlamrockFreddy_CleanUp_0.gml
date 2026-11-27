instance_destroy(Body);
instance_destroy(Head);
instance_destroy(UpperArm);
instance_destroy(LowerArm);

with (oDoor)
    Bounce = false;

if (Voiceclip != -1)
    audio_stop_sound(Voiceclip);

clear_doorway(ID, Side);
sprite_delete(SPRITE_Head);
sprite_delete(SPRITE_Torso);
sprite_delete(SPRITE_UpperArm);
sprite_delete(SPRITE_LowerArm);
sprite_delete(SPRITE_Gregory);
skin_sound_delete_array(SOUND_Quips);
skin_sound_delete_array([SOUND_Slam, SOUND_SlamAlt, SOUND_Lean, SOUND_Footstep, SOUND_FootstepAlt, SOUND_Pluck]);
