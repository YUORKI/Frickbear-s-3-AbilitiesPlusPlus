if (instance_exists(Body))
    instance_destroy(Body);

clear_window(UnknownEnum.Value_5);
sprite_delete(SPRITE_Window);
skin_sound_delete_array([SOUND_Appear, SOUND_Stare]);

enum UnknownEnum
{
    Value_5 = 5
}
