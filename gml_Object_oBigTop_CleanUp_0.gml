clear_doorway(ID, Side);

if (Hand != -1)
{
    instance_destroy(Hand);
    Hand = -1;
}

if (Eyes != -1)
{
    instance_destroy(Eyes);
    Eyes = -1;
}

audio_stop_sound(SOUND_MusicBox);
sprite_delete(SPRITE_Eyes);
sprite_delete(SPRITE_Hand);
skin_sound_delete_array([SOUND_Creak, SOUND_Slam, SOUND_MusicBox]);
skin_sound_delete_array(SOUND_TicketsPlease);
