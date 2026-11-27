event_inherited();
var FredbearMode = eleanor_challenge_active(UnknownEnum.Value_7) || array_contains(global.AllTimeSalvages, UnknownEnum.Value_127);

if (FredbearMode)
{
    ClearTheme = audio_play_sound(mus_BossPhony, 99, false, 0.5);
    audio_sound_set_track_position(ClearTheme, 121);
}
else
{
    audio_play_sound(sfxRoundComplete, 100, false);
}

Squish = array_create(3, 1);
SquishSpeed = array_create(3, 0);
Numbers = [0, 0, 1];
CurNumber = 0;
VerticalOffset = 360;

function squish()
{
    var NewValues = [2, 3, 3];
    SquishSpeed[CurNumber] = -0.1;
    Numbers[CurNumber] = NewValues[CurNumber];
    CurNumber++;
}

if (global.EndlessRound > 10)
{
    for (var i = 0; i < array_length(global.AllTimeSalvages); i++)
        global.EndlessStickers[global.AllTimeSalvages[i]] = max(global.Difficulty, global.EndlessStickers[global.AllTimeSalvages[i]]);
    
    if (count_up_stickers(global.EndlessStickers) >= 40)
        unlock_guard(UnknownEnum.Value_5);
    
    if (count_up_stickers(global.EndlessStickers) >= 91)
        unlock_guard(UnknownEnum.Value_10);
    
    global.DeathsThisRound = 0;
}

if (any_challenge_active())
{
    global.EleanorChallenge.RoundsLeft--;
    
    if (global.EleanorChallenge.RoundsLeft <= 0)
        instance_create_depth(global.ChallengeIconPosition[0], global.ChallengeIconPosition[1], depth - 1, oEleanorChallengeIndicator);
}

DestinationRoom = (global.EndlessRound == 10) ? ((global.EndlessGuardStickers[min(global.Guard, 22)] == -1) ? EndlessShopSelection_FinalNight : EndlessResults) : EndlessShopSelection;
global.EndlessRound++;
global.EndlessRoundsBeaten++;
save_endless_data(DestinationRoom);
global.EndlessRound--;

if (global.EndlessRound == 10 && global.RunTime < 900)
    get_trophy(UnknownEnum.Value_50);

if (FredbearMode)
{
    unlock_guard(UnknownEnum.Value_9);
    global.UnlockedAnimatronics[UnknownEnum.Value_127] = true;
}

enum UnknownEnum
{
    Value_5 = 5,
    Value_7 = 7,
    Value_9 = 9,
    Value_10,
    Value_50 = 50,
    Value_127 = 127
}
