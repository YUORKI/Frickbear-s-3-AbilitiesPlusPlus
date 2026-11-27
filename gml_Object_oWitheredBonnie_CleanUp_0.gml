audio_stop_sound(SOUND_Stare);

if (Head != undefined)
    instance_destroy(Head);

if (Torso != undefined)
    instance_destroy(Torso);

if (Arm != undefined)
    instance_destroy(Arm);

if (Legs != undefined)
    instance_destroy(Legs);

if (Wires != undefined)
    instance_destroy(Wires);

sprite_delete(SPRITE_Head);
sprite_delete(SPRITE_Torso);
sprite_delete(SPRITE_Legs);
sprite_delete(SPRITE_Arm);
sprite_delete(SPRITE_Wires);
skin_sound_delete_array([SOUND_Stare]);
