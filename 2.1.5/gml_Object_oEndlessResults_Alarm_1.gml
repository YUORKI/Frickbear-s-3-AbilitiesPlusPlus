VoiceLineID = get_guard_line(global.Guard, Victory ? "Victory" : "GameOver");
VoiceLine = reverb_sound(VoiceLineID, 0, 0, false, 1.25, 1, 0.1);
audio_sound_gain(MusicPlaying, 0.5, 500);
VoiceLineStarted = true;
var Subtitles = subtitle(VoiceLineID);
SubtitleList = Subtitles[0];
SubtitleTimingList = Subtitles[1];
SubtitleEntry = 0;
