if (Poser != -1)
    instance_destroy(Poser);

clear_window(UnknownEnum.Value_68);
sprite_delete(SPRITE_Body);
skin_sound_delete_array([SOUND_Whoosh, SOUND_Whistle, SOUND_Pose, SOUND_Zapped]);
skin_sound_delete_array(SOUND_Grunt);
skin_sound_delete_array(SOUND_Exposed);
skin_sound_delete_array(SOUND_Hurt);

enum UnknownEnum
{
    Value_68 = 68
}
