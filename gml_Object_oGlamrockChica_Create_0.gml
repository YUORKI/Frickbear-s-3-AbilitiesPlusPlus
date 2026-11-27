ID = UnknownEnum.Value_69;
Frame = 0;
AngleSpeed = 0;
AngleOffset = 45;
YOffset = 100;
YOffsetSpeed = 0;
AngleShift = 0;
Satisfied = false;
Body = -1;
Head = -1;
WaitTime = 3;
Active = false;
KillTimer = 999;
ToppingCount = 2;
ToppingBins = 4;
RequestedToppings = [];
Hungry = false;
Randomizer = 1;
SPRITE_Body = skin_sprite(sGlamrockChica_Body, ID, get_sprite_filenames(3, 4));
SPRITE_Head = skin_sprite(sGlamrockChica_Head, ID, get_sprite_filenames(1, 2));
SPRITE_PizzaBase = skin_sprite(sGlamrockChica_Pizza, ID, get_sprite_filenames(5, 12));
SPRITE_SpeechBubble = skin_sprite(sGlamrockChica_SpeechBubble, ID, ["sprite_13.png"]);
SPRITE_ToppingBinHolder = skin_sprite(sGlamrockChica_ToppingBinHolder, ID, ["sprite_28.png"]);
SPRITE_ToppingBins = skin_sprite(sGlamrockChica_ToppingBins, ID, get_sprite_filenames(21, 27));
SPRITE_Toppings = skin_sprite(sGlamrockChica_Toppings, ID, get_sprite_filenames(14, 20));
SOUND_Ambience = skin_sound(sfxRoxyAmbience, ID, "sq_ambience");
SOUND_Creak = skin_sound(sfxEndoCreak, ID, "sq_creak");
SOUND_Look = skin_sound(sfxWhipCrack, ID, "sq_whip");
SOUND_Complete = skin_sound(sfxRoxyComplete, ID, "sq_complete");
SOUND_PizzaPluck = skin_sound(sfxPluck, ID, "sq_pluck");
SOUND_PizzaSplat = skin_sound(sfxPizzaSplat, ID, "sq_splat");
SOUND_Appear = skin_sound_generate_array(get_misc_voicelines(ID, "Appear"), ID, "sq_appear");
SOUND_Fed = skin_sound_generate_array(get_misc_voicelines(ID, "Fed"), ID, "sq_complete");

function reset_timer(arg0)
{
    Randomizer = random_range(0.8, 1.2);
    WaitTime = 0;
}

function eat_pizza(arg0)
{
    for (var i = 0; i < array_length(RequestedToppings); i++)
    {
        if (!array_contains(arg0, RequestedToppings[i]))
        {
            jumpscare(UnknownEnum.Value_69);
            exit;
        }
    }
    
    for (var i = 0; i < array_length(arg0); i++)
    {
        if (!array_contains(RequestedToppings, arg0[i]))
        {
            jumpscare(UnknownEnum.Value_69);
            exit;
        }
    }
    
    audio_stop_sound(SOUND_Ambience);
    audio_play_sound(SOUND_Complete, 10, false);
    block_tokens();
    Satisfied = true;
    AngleSpeed = 2;
    YOffsetSpeed = 10;
    Frame = 0;
    Head.sprite_index = sNOTHING;
    Hungry = false;
    instance_destroy(oGlamrockChica_AssemblyMenu);
    reverb_sound(choose_from_array(SOUND_Fed), 0, 400);
    exit;
}

reset_timer(global.AILevels[ID]);
SpeechBubbleSurf = -1;
SpeechBubbleOffset = 0;
SpeechBubbleOffsetSpeed = 0;

enum UnknownEnum
{
    Value_69 = 69
}
