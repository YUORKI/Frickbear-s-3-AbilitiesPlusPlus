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
Hand = -1;
Eyes = -1;
Side = -1;
Active = false;
Prying = false;
ID = UnknownEnum.Value_75;
SPRITE_Eyes = skin_sprite(sBigTop_Eyes, ID, "sprite_01.png");
SPRITE_Hand = skin_sprite(sBigTop_Hand, ID, get_sprite_filenames(2, 3));
SOUND_Creak = skin_sound(sfxEndoCreak, ID, "sq_creak");
SOUND_Slam = skin_sound(sfxMetalSlam, ID, "sq_slam");
SOUND_MusicBox = skin_sound(sfxBigTopMusicBox, ID, "sq_music");
SOUND_TicketsPlease = skin_sound_generate_array(get_misc_voicelines(UnknownEnum.Value_75, "Greet"), ID, "voc_appear");
Randomizer = random_range(0.8, 1.2);
KillFrames = 0;

enum UnknownEnum
{
    Value_75 = 75
}
