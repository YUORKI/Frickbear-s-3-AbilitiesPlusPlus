set_target_to_ui();
draw_set_font(global.FontW97Black);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var Text = "Mute Call";
draw_sprite_stretched(sWindowBase, 1 - min(PhoneActive, 1), PhoneButtonX - (ButtonWidth / 2), PhoneButtonY, ButtonWidth, ButtonHeight);
draw_text_color(PhoneButtonX, (PhoneButtonY + (ButtonHeight / 2)) - 2, Text, c_white, c_white, c_white, c_white, 1);

if (PhoneActive == 2 && Timer > 10 && TonightsCall != undefined && subtitles_enabled())
{
    Text = get_call_speaker(TonightsCall) + ": ";
    
    if (global.ShuffleMode)
        Text = "";
    
    draw_set_valign(fa_bottom);
    Text += SubtitleList[SubtitleEntry];
    var SubtitleEndpoint = 999;
    
    if (SubtitleEntry < (array_length(SubtitleTimingList) - 1))
        SubtitleEndpoint = SubtitleTimingList[SubtitleEntry + 1];
    
    if (audio_sound_get_track_position(TonightsCallPlaying) > SubtitleEndpoint)
        SubtitleEntry++;
    
    for (var FontDirection = 0; FontDirection < 360; FontDirection += 45)
        draw_text_ext(320 + round(lengthdir_x(1, FontDirection)), 300 + round(lengthdir_y(1, FontDirection)), Text, 15, 400);
    
    draw_set_font(global.FontW97White);
    draw_text_ext(320, 300, Text, 15, 400);
    
    if (!audio_is_playing(TonightsCall))
    {
        if (!instance_exists(oJumpscare))
            global.CallMuted = true;
        
        audio_play_sound(sfxPhonePickup, 10, false);
        PhoneActive = 0;
        
        if (NightMusicGain != -1)
            audio_sound_gain(global.Music, NightMusicGain, 1000);
    }
}

draw_set_font(global.FontW97Black);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
surface_reset_target();
