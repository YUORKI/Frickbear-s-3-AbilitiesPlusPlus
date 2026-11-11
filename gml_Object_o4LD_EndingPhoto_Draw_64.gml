Alpha -= (binary_to_sign(FadingOut) / 240);

if (input_check_pressed(UnknownEnum.Value_0))
{
    Alpha = min(Alpha, 1);
    FadingOut = true;
    audio_sound_gain(global.Music, 0, 4000);
}

if (FadingOut && Alpha < -0.25)
    room_goto(EndlessResults);

draw_sprite_ext(s4LDEndingPhoto, 0, 0, 0, 1/3, 1/3, 0, c_white, Alpha);

if (Alpha >= 1 && !VoiceLinePlayed)
{
    audio_play_sound(voc_TheBoss_ThankYouSoMuch, 10, false);
    VoiceLinePlayed = true;
}

enum UnknownEnum
{
    Value_0
}
