YOffset = 32;
YSpeed = 0;
Size = 0.5;
Frame = 0;
HandAnimStage = "Lower";
YStretch = 1;
YStretchSpeed = 0;
EyePosition = 0;
EyeSpeed = 0;
EyeYOffset = 0;
HandL = -1;
HandR = -1;
Head = -1;
Side = -1;
Active = false;
Prying = false;
ID = UnknownEnum.Value_87;
Randomizer = random_range(0.8, 1.2);
KillFrames = 0;
SPRITE_Head = skin_sprite(sDJMusicMan_Head, ID, get_sprite_filenames(1, 5));
SPRITE_Hand = skin_sprite(sDJMusicMan_Hand, ID, get_sprite_filenames(6, 7));
SPRITE_Bar = skin_sprite(sDJMM_NoteBar, ID, "sprite_08.png");
SPRITE_Notes = skin_sprite(sDJMM_Notes, ID, get_sprite_filenames(9, 13));
SOUND_Appear = skin_sound_generate_array(get_misc_voicelines(ID, "Appear"), ID, "voc_appear");
SOUND_Left = skin_sound_generate_array(get_misc_voicelines(ID, "Left"), ID, "voc_left");
SOUND_Right = skin_sound_generate_array(get_misc_voicelines(ID, "Right"), ID, "voc_right");
SOUND_YourTurn = skin_sound_generate_array(get_misc_voicelines(ID, "YourTurn"), ID, "voc_yourturn");
SOUND_Win = skin_sound_generate_array(get_misc_voicelines(ID, "Win"), ID, "voc_win");
SOUND_Cue = skin_sound(sfxBitCollect, ID, "sq_cue");
SOUND_Pass = skin_sound(sfxBitCollect, ID, "sq_pass");
SOUND_Fail = skin_sound(sfxBitPunish, ID, "sq_fail");
SOUND_Creak = skin_sound(sfxEndoCreak, ID, "sq_creak");
SOUND_Slam = skin_sound(sfxMetalSlam, ID, "sq_slam");
SOUND_Beat = skin_sound(sfxDJMMBeat, ID, "sq_beat");
SOUND_BeatEnd = skin_sound(sfxDJMMBeatEnd, ID, "sq_beatend");
SOUND_NotePlace = skin_sound(sfxDoofas_Pop, ID, "sq_noteplaced");
SOUND_NotePlay = skin_sound(sfxTaunt, ID, "sq_input");
SavedMusicLevel = 0;
Occupied = [false, false, false];
ActivationTime = 999;

enum UnknownEnum
{
    Value_87 = 87
}
