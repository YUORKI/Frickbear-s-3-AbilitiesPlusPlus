draw_set_font(global.FontW97Black);
draw_set_halign(fa_left);

if (global.Music == undefined || !audio_is_playing(global.Music))
{
}
else
{
    var TrackPos = audio_sound_get_track_position(global.Music);
    var TrackStart = audio_sound_get_loop_start(global.Music);
    var TrackEnd = audio_sound_get_loop_end(global.Music);
    var CurrentBeat = TrackPos * (BPM / 60);
    
    if (LastBeat != floor(CurrentBeat))
    {
        LastBeat = floor(CurrentBeat);
        audio_play_sound(sfxBitCrunch, 5, false);
    }
    
    if (input_check_pressed(UnknownEnum.Value_0))
    {
        BeatOffset = abs(CurrentBeat - floor(CurrentBeat) - 0.5);
        audio_play_sound(sfxBitCrunch, 10, false);
    }
    
    draw_text(320, 16, "Current Beat: " + string(floor(CurrentBeat)));
    draw_text(320, 32, "Beat Offset from Intended: " + string(BeatOffset));
    var NoteOffset = (CurrentBeat - floor(CurrentBeat)) * 32;
    draw_sprite(sMManiac_BG, 0, 0, 0);
    draw_sprite(sMManiac_MusicMan, CurrentBeat % 2, 32, 16);
    
    for (var i = -3; i <= 3; i++)
        draw_sprite(sMManiac_Note, 0, (i * 32) + NoteOffset + 80, 128);
}

check_reset();

enum UnknownEnum
{
    Value_0
}
