SubtitleList = [];
SubtitleTimingList = [];
SubtitleEntry = 0;
VoiceLine = sfxNOTHING;
VoiceLineStarted = false;

function set_voiceline(arg0, arg1)
{
    VoiceLine = arg0;
    var Subtitles = subtitle(arg1);
    SubtitleList = Subtitles[0];
    SubtitleTimingList = Subtitles[1];
    SubtitleEntry = 0;
    VoiceLineStarted = true;
}
