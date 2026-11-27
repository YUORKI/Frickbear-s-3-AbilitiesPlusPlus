ID = UnknownEnum.Value_83;
Timer = 0;
Randomizer = random_range(0.75, 1.25);
Active = false;
Sound = -1;

function turn_off_tv()
{
    SavedEpisodePosition = audio_sound_get_track_position(Sound);
    Active = false;
    Timer = 0;
    audio_stop_sound(Sound);
    Randomizer = random_range(0.75, 1.25);
    SubtitlePosition = 0;
}

SPRITE_Animations = skin_sprite_unlimited(sVladClaraTV, ID, "sprite_screen");
SOUND_Episodes = skin_sound_generate_array(get_misc_voicelines(ID, "Episodes"), ID, "voc_episode");
SOUND_Ads = skin_sound_generate_array(get_misc_voicelines(ID, "Ads"), ID, "voc_ad");
SOUND_Activate = skin_sound(sfxTV_SwitchOn, ID, "sq_switchon");
IsAd = !(irandom(3) == 0);
SavedEpisodePosition = random_range(0, 90);

function play_sound()
{
    Sound = reverb_sound(TonightsEpisode, 0, 0, false, 2.5, 0.5, 0.25, 5);
}

function select_episode(arg0 = false)
{
    if (Sound != -1)
        audio_stop_sound(Sound);
    
    IsAd = !IsAd;
    
    if (IsAd)
    {
        SubtitlePosition = 0;
        SavedEpisodePosition = 0;
    }
    
    TonightsEpisode = choose_from_array(IsAd ? SOUND_Ads : SOUND_Episodes);
    var Subtitles = subtitle(TonightsEpisode);
    SubtitleList = Subtitles[0];
    SubtitleTimingList = Subtitles[1];
    SubtitleVisualList = Subtitles[2];
    SubtitleEntry = 0;
    oOffice_TV.CurrentAnimation = SubtitleVisualList[SubtitleEntry];
    
    if (arg0)
        play_sound();
}

select_episode();

enum UnknownEnum
{
    Value_83 = 83
}
