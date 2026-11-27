instance_destroy(oCandyBowl);
instance_destroy(oDreadbearCandy);
instance_destroy(lHand);
instance_destroy(rHand);
instance_destroy(lLArm);
instance_destroy(rLArm);
instance_destroy(lUArm);
instance_destroy(rUArm);
instance_destroy(brow);
instance_destroy(head);
instance_destroy(jaw);
instance_destroy(torso);
clear_window(UnknownEnum.Value_38);
sprite_delete(SPRITE_Head);
sprite_delete(SPRITE_Torso);
sprite_delete(SPRITE_UpperArm);
sprite_delete(SPRITE_LowerArm);
sprite_delete(SPRITE_Hand);
sprite_delete(SPRITE_Bubble);
sprite_delete(SPRITE_Bowl);
sprite_delete(SPRITE_Candy);
skin_sound_delete_array([SOUND_Creak, SOUND_Slam, SOUND_Scare]);
skin_sound_delete_array(SOUND_Appear);
skin_sound_delete_array(SOUND_Fed);

enum UnknownEnum
{
    Value_38 = 38
}
