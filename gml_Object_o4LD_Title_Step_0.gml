if (Frame >= 0 && Frame <= 8 && !audio_is_playing(mus_4LDTitle))
    audio_play_sound(mus_4LDTitle, 50, false);

if (Frame >= 1.5)
    MoonLighting += ((1 - MoonLighting) / 5);

if (Frame >= 2.66)
    TowerLighting += ((1 - TowerLighting) / 10);

if (Frame >= TitleAppearFrame)
    TitleAlpha += ((1 - TitleAlpha) / 20);

if (Frame >= (TitleAppearFrame + 1.4) && !instance_exists(oTitleMenu))
    instance_create_depth(0, 0, 0, oTitleMenu);

if (Frame > 20 && !audio_is_playing(mus_4LDTitle) && !audio_is_playing(mus_4LDOpening))
    MusicStopTimer += 0.016666666666666666;

if (MusicStopTimer > 2 && !audio_is_playing(mus_4LDOpening))
{
    play_music(mus_4LDOpening);
    MusicStopTimer = 0;
}

Frame += 0.016666666666666666;
