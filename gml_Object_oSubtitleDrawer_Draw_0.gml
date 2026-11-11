if (VoiceLineStarted && !audio_is_playing(VoiceLine))
{
    VoiceLineStarted = false;
    instance_destroy();
}

if (VoiceLineStarted && VoiceLine != -1)
{
    if (VoiceLine != undefined)
    {
        if (!audio_is_playing(VoiceLine))
        {
            VoiceLineStarted = false;
            instance_destroy();
        }
        else if (subtitles_enabled())
        {
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_set_font(global.FontW97Black);
            var SubtitleText = SubtitleList[SubtitleEntry];
            
            for (var FontDirection = 0; FontDirection < 360; FontDirection += 15)
            {
                for (var FontBold = 1; FontBold <= 3; FontBold++)
                    draw_text_ext(320 + round(lengthdir_x(FontBold, FontDirection)), 332 + round(lengthdir_y(FontBold, FontDirection)), SubtitleText, 15, 400);
            }
            
            draw_set_font(global.FontW97White);
            draw_text_ext(320, 332, SubtitleText, 15, 400);
            var SubtitleEndpoint = 999;
            
            if (SubtitleEntry < (array_length(SubtitleTimingList) - 1))
                SubtitleEndpoint = SubtitleTimingList[SubtitleEntry + 1];
            
            if (audio_sound_get_track_position(VoiceLine) > SubtitleEndpoint)
                SubtitleEntry++;
            
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
            draw_set_font(global.FontW97Black);
        }
    }
}
