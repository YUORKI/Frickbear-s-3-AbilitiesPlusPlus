ID = UnknownEnum.Value_46;
Frame = 0;
BlinkFrames = 0;
Position = 0;
PositionSpeed = 0;
PositionTarget = 0;
BounceOffset = 0;
BounceSpeed = 0;
BounceOffset = 128;
TimeToNextQuip = 999;
Randomizer = random_range(0.75, 1.25);
CurrentLine = undefined;
SPRITE_Head = skin_sprite(sRodney_Head, ID, get_sprite_filenames(1, 3));
SPRITE_Neck = skin_sprite(sRodney_Neck, ID, "sprite_04.png");
SPRITE_Body = skin_sprite(sRodney_Body, ID, "sprite_05.png");
QuoteLibrary = array_shuffle(skin_sound_generate_array(get_misc_voicelines(ID, "Quip"), ID, "voc_quip"));
QuoteLibrary_MinigameFail = array_shuffle(skin_sound_generate_array(get_misc_voicelines(ID, "MinigameFail"), ID, "voc_minigamefail"));
QuoteLibrary_Item = array_shuffle(skin_sound_generate_array(get_misc_voicelines(ID, "Item"), ID, "voc_itempurchased"));
QuoteLibrary_Tokens = array_shuffle(skin_sound_generate_array(get_misc_voicelines(ID, "Tokens"), ID, "voc_tokensearned"));
QuoteNum = 0;
QuoteNum_MinigameFail = 0;
QuoteNum_Item = 0;
QuoteNum_Tokens = 0;
CallMuted = false;
YOffset = 0;
SubtitleList = [];
SubtitleTimingList = [];

function set_soundclip(arg0)
{
    var Subtitles = subtitle(arg0);
    var RodneyGain = 3;
    CurrentSound = arg0;
    SubtitleList = Subtitles[0];
    SubtitleTimingList = Subtitles[1];
    CurrentLine = reverb_sound(arg0, 0, 0, false, RodneyGain, 1, 0.05);
    SubtitleEntry = 0;
    PositionTarget = 1;
    BounceSpeed = 2;
    BlinkFrames = 5;
}

enum UnknownEnum
{
    Value_46 = 46
}
