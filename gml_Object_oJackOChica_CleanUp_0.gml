event_inherited();

with (Cupcake)
    instance_destroy();

with (Torso)
    instance_destroy();

with (Arm)
    instance_destroy();

with (Head)
    instance_destroy();

audio_stop_sound(BurningSound);
sprite_delete(SPRITE_Head);
sprite_delete(SPRITE_Arm);
sprite_delete(SPRITE_Torso);
sprite_delete(SPRITE_Cupcake);
skin_sound_delete_array([SOUND_Footstep, SOUND_FootstepAlt, SOUND_Burning, SOUND_HeadTurn]);
