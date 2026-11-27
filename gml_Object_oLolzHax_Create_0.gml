ID = UnknownEnum.Value_39;
SOUND_Appear = skin_sound_generate_array(get_misc_voicelines(ID, "Appear"), ID, "voc_appear");
SOUND_Chosen = skin_sound_generate_array(get_misc_voicelines(ID, "Chosen"), ID, "voc_chosen");
SOUND_Static = skin_sound(sfxSalvageStatic, ID, "sq_static");
SOUND_ThemeSong = skin_sound(mus_LolzHax, ID, "sq_music");
SPRITE_Head = skin_sprite(sLolzHax_Head, ID, ["sprite_01.png", "sprite_02.png", "sprite_03.png"]);
SPRITE_Body = skin_sprite(sLolzHax_Body, ID, ["sprite_04.png"]);
SPRITE_Arm = skin_sprite(sLolzHax_Arm, ID, ["sprite_05.png", "sprite_06.png"]);
SPRITE_Antenna = skin_sprite(sLolzHax_Antenna, ID, ["sprite_07.png", "sprite_08.png"]);
SPRITE_Window = skin_sprite(sLolzHaxMenu, ID, "sprite_09.png");
WaitToStart = true;
Delay = 0.5;
Timer = 10;

function generate_summon_list()
{
    var Summonables = [];
    var AmountToSummon = array_length(global.AILevels);
    var FullRoster = global.FourLayersDownMode || (global.ShuffleMode && numbered_night());
    
    for (var i = 0; i <= (FullRoster ? 90 : UnknownEnum.Value_46); i++)
    {
        if (!character_active(i) && instance_exists(get_animatronic_object(i)))
            array_push(Summonables, i);
    }
    
    repeat (min(3, array_length(Summonables)))
    {
        var IDToAdd = irandom(array_length(Summonables) - 1);
        array_push(SummonList, Summonables[IDToAdd]);
        array_delete(Summonables, IDToAdd, 1);
    }
}

Head = undefined;
LTenna = undefined;
RTenna = undefined;
Body = undefined;
LArm = undefined;
RArm = undefined;
Frame = 0;
YOffset = -300;
YOffsetSpeed = 4;
HeadOffset = -360;
HeadOffsetSpeed = 0;
HeadRotation = 180;
HeadRotationSpeed = -90;
WoahMyHeadsSpinning = true;
SelectionMade = false;
y = 720;
CurrentVoiceClip = sfxNOTHING;
ChallengeTimer = 0;
ChallengeArray = [];

for (var i = 0; i <= (global.FourLayersDownMode ? 90 : UnknownEnum.Value_46); i++)
{
    if (global.AILevels[i] == 0)
        array_push(ChallengeArray, i);
}

ChallengeArray = array_shuffle(ChallengeArray);
AmountToSummon = 3;

enum UnknownEnum
{
    Value_39 = 39,
    Value_46 = 46
}
