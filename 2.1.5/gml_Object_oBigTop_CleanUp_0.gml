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

audio_stop_sound(sfxBigTopMusicBox);
