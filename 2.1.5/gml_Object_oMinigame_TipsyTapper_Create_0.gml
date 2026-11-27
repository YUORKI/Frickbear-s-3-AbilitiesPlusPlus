event_inherited();
Initialize = true;
get_folders();
GuardSprite = import_sprites("minigame.png", sHD_Guard, 4, 8, 8);
CustomerIdentities = [];
show_debug_message(string("GUARDS: {0} {1}", global.GuardAmount, CustomerIdentities));

for (var i = 0; i < global.GuardAmount; i++)
{
    if (i > 21 || global.UnlockedGuards[i])
        array_push(CustomerIdentities, i);
}

show_debug_message(string("GUARDS: {0}", CustomerIdentities));

function die(arg0, arg1)
{
    audio_play_sound(sfxBitFail, 10, false);
    DeathFrames = 120;
    CrackX = arg0;
    CrackY = arg1;
    moon_death_gain();
}

function find_lowest_alley()
{
    var alley = irandom(3);
    var smallestvalue = 999;
    var returnalley = alley;
    
    repeat (3)
    {
        if (CustomersPerAlley[alley] < smallestvalue)
        {
            smallestvalue = CustomersPerAlley[alley];
            returnalley = alley;
        }
        
        alley = (alley + 1) % 4;
    }
    
    return returnalley;
}

function earn_points()
{
    add_tokens(1);
    Score++;
    global.TokensPerMinigame[UnknownEnum.Value_11]++;
    
    if (global.HiScores[UnknownEnum.Value_11] < Score)
        global.HiScores[UnknownEnum.Value_11] = Score;
    
    if (global.HiScoresOverall[UnknownEnum.Value_11] < Score)
        global.HiScoresOverall[UnknownEnum.Value_11] = Score;
    
    if (Score >= 120)
        get_trophy(UnknownEnum.Value_55);
}

enum UnknownEnum
{
    Value_11 = 11,
    Value_55 = 55
}
