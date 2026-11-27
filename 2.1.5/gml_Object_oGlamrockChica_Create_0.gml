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
    
    audio_stop_sound(sfxRoxyCharge);
    audio_stop_sound(sfxRoxyAmbience);
    audio_play_sound(sfxRoxyComplete, 10, false);
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
SOUND_Appear = get_misc_voicelines(ID, "Appear");
SOUND_Fed = get_misc_voicelines(ID, "Fed");

enum UnknownEnum
{
    Value_69 = 69
}
