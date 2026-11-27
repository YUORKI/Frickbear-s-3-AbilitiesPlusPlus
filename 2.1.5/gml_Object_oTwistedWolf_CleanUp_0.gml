if (Disc != undefined)
    instance_destroy(Disc);

if (Legs != undefined)
    instance_destroy(Legs);

if (Torso != undefined)
    instance_destroy(Torso);

if (Head != undefined)
    instance_destroy(Head);

if (BackArm != undefined)
    instance_destroy(BackArm);

if (FrontArm != undefined)
    instance_destroy(FrontArm);

if (Hand != undefined)
    instance_destroy(Hand);

if (Plushie != undefined)
    instance_destroy(Plushie);

skin_sound_delete_array([SOUND_Appear, SOUND_Clicked, SOUND_Vanish]);
sprite_delete(SPRITE_Plushie);
sprite_delete(SPRITE_Head);
sprite_delete(SPRITE_Torso);
sprite_delete(SPRITE_Legs);
sprite_delete(SPRITE_FrontArm);
sprite_delete(SPRITE_Hand);
sprite_delete(SPRITE_BackArm);
sprite_delete(SPRITE_Disc);
