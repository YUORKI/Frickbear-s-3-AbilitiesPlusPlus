SongPosition = audio_sound_get_track_position(Song);

if (Countdown > 0)
{
    Countdown -= 0.016666666666666666;
    
    if (Countdown <= 0)
    {
        audio_sound_gain(mus_MyWay, 1, 0);
        Song = audio_play_sound(mus_MyWay, 50, false);
        SongPosition = 0;
        
        with (instance_create_depth(0, 0, -5, oSubtitleDrawer))
            set_voiceline(other.Song, mus_MyWay);
    }
}
