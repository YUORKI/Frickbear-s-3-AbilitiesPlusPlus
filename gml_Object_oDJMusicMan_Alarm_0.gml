Head = instance_create_layer(-256, -256, "Behind_Wall", oDJMusicMan_Head);
instance_create_depth(-64, -64, -5, oDJMusicMan_RhythmBar);
SavedMusicLevel = audio_sound_get_gain(global.Music);
audio_sound_gain(global.Music, 0, 1000);

with (Head)
{
    sprite_index = other.SPRITE_Head;
    DrawDepth = -20;
}
