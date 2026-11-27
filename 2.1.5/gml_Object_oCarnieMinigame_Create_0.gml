audio_sound_gain(global.Music, 0, 1000);
global.MinigameWindowScale = 2;
global.CupcakeMeter = 0;
Minigame = global.Jumpscare.ID;
HardMode = global.Jumpscare.HardMode;
initialize_minigame_scores();
TargetScore = 45;
TimeLimit = 45;
input_clear(UnknownEnum.Value_0);
instance_create_depth(0, 0, depth - 1, get_minigame_data(Minigame).Object);
TargetHit = false;
Timer = -180;
MinigameFailed = false;

function minigame_failed()
{
    with (oShopkeepSprite)
        switch_pose(2);
    
    audio_play_sound(sfxCarnie_Whistle, 10, false);
    audio_stop_sound(mus_Carnie);
    MinigameFailed = true;
}

function minigame_fail_aftermath()
{
    with (oShopkeepSprite)
    {
        get_shop_music();
        DanceFrame = 0;
    }
    
    audio_sound_gain(global.Music, 1, 1000);
    audio_play_sound(sfxCarnie_Shoot, 10, false);
    instance_destroy(oMinigameParent);
    var TextboxDepth = oTextBox.depth;
    instance_destroy(oCarnieMinigame);
    instance_destroy(oTextBox);
    
    with (instance_create_depth(0, 0, TextboxDepth, oTextBox))
    {
        game_text(other.MinigameFailed ? "Carnie_Fail" : "Carnie_Win");
        CurrentTextboxY = 232;
    }
    
    instance_destroy();
}

var Data = get_carnie_scores(Minigame);
TargetScore = Data.NormalScore[HardMode];
TimeLimit = Data.NormalTimer[HardMode];
ShowScore = true;
ShowTimer = true;

if (TargetScore == infinity)
{
    TargetScore = TimeLimit;
    ShowScore = false;
}

if (TimeLimit == infinity)
    ShowTimer = false;

WindowOffset = 480;

enum UnknownEnum
{
    Value_0
}
