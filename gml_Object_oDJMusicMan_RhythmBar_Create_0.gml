BackingTrack = -1;
TrackPos = 0;
TrackLength = 1;
BeatPos = 0;
AILvl = global.AILevels[UnknownEnum.Value_87];
Score = 0;
TracksToComplete = round(6 / lerp(global.NightSpeedup, 3, 0.5));
TracksCompleted = 0;
InitialDiff = AILvl - 4;
EndingDiff = AILvl + 4;
alarm[0] = 60;
ShowBar = true;
BarOffset = -64;

function set_pattern()
{
    AI = lerp(InitialDiff, EndingDiff, TracksCompleted / max(TracksToComplete - 1, 1));
    HeadBeat = -0.01;
    NotePositions = [];
    var PlacementPos = round_step(random_range(-0.2, 1.2), 0.5);
    var StepsAllowed = 0.5;
    
    if (TracksCompleted == 0)
        PlacementPos = max(PlacementPos, 0.5);
    
    var PossibleTimings = [];
    
    if (AI < 5)
        array_push(PossibleTimings, 2);
    
    if (AI < 5)
        array_push(PossibleTimings, 1);
    
    if (AI < 20)
        array_push(PossibleTimings, 1);
    
    if (AI >= 5)
    {
        array_push(PossibleTimings, 0.25, 0.5);
        StepsAllowed *= 2;
    }
    
    if (AI >= 10)
    {
        StepsAllowed *= 2;
        array_push(PossibleTimings, 0.5);
    }
    
    if (AI >= 15)
    {
        StepsAllowed *= 2;
        array_push(PossibleTimings, 0.25, 0.75);
    }
    
    while (true)
    {
        var Timing = choose_from_array(PossibleTimings);
        PlacementPos = ceil(PlacementPos * StepsAllowed) / StepsAllowed;
        
        if (PlacementPos >= 3.5)
            break;
        
        array_push(NotePositions, PlacementPos);
        PlacementPos += Timing;
    }
    
    Inputs = [];
    
    for (var i = 0; i < array_length(NotePositions); i++)
        array_push(Inputs, irandom(1));
    
    HitNotes = [];
    HitNotePositions = [];
    CurTypePosition = 0;
}

function time_to_beat(arg0)
{
    return (8 * arg0) / TrackLength;
}

set_pattern();
Completed = false;
FailurePoints = 0;
SPRITE_Bar = oDJMusicMan.SPRITE_Bar;
SPRITE_Notes = oDJMusicMan.SPRITE_Notes;

enum UnknownEnum
{
    Value_87 = 87
}
