var VoiceLineID = sfxNOTHING;
VoiceLine = reverb_sound(VoiceLineID, 0, 0, false, 1.5, 1, 0.25);
audio_sound_gain(MusicPlaying, 0.5, 500);
VoiceLineStarted = true;
var Subtitles = subtitle(VoiceLineID);
SubtitleList = Subtitles[0];
SubtitleTimingList = Subtitles[1];
SubtitleEntry = 0;
