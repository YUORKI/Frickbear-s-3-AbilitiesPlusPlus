PhoneActive = 0;
PhoneButtonX = 320;
PhoneButtonY = 360;
ButtonWidth = 80;
ButtonHeight = 24;
CurrentSubtitleLine = 0;
PhoneCalls = [vocPhoneGuy1, vocPhoneGuy2, vocPhoneGuy3, vocPhoneGuy4, vocPhoneGuy5, vocPhoneGuy6];
MuteDisabled = false;
NightMusicGain = -1;

if (global.ShuffleMode)
    PhoneCalls = global.ShuffleData.PhoneCalls;

if (is_numeric(global.Night) && !global.CallMuted)
{
    TonightsCall = PhoneCalls[global.Night - 1];
    
    if (!array_contains(global.ShuffleCallsHeard, get_call_id(voc_PhoneCallTutorial)) && TonightsCall == voc_PhoneCallTutorial)
        MuteDisabled = true;
}
else if (global.Night == "Endless" && global.EndlessInventory.BossCall && global.EndlessRound != 10)
{
    TonightsCall = voc_PhonyCall;
    
    if (!global.UnlockedAnimatronics[UnknownEnum.Value_127])
        MuteDisabled = true;
    
    global.EndlessInventory.BossCall = false;
}
else
{
    TonightsCall = undefined;
}

TonightsCallPlaying = TonightsCall;

if (TonightsCall != undefined)
{
    var Subtitles = subtitle(TonightsCall);
    SubtitleList = Subtitles[0];
    SubtitleTimingList = Subtitles[1];
    SubtitleEntry = 0;
    VoiceLineStarted = true;
}

Timer = 0;
depth = 100;

enum UnknownEnum
{
    Value_127 = 127
}
