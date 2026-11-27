depth = -5;
var Head = oDJMusicMan_Head;
var BeforeCue = time_to_beat(TrackPos) < 3.5;
var BeforeEnd = time_to_beat(TrackPos) < 7.5;
TrackPos = audio_sound_get_track_position(BackingTrack);
BeatPos = (8 * TrackPos) / TrackLength;

if (BeforeCue && time_to_beat(TrackPos) >= 3.5)
{
    audio_play_sound(oDJMusicMan.SOUND_Cue, 10, false);
    Head.TurnDir = 0;
    var Sound = choose_from_array(oDJMusicMan.SOUND_YourTurn);
    reverb_sound(Sound, 0, 500, false, 2, 0.5, 0.25);
}

if (BeforeEnd && time_to_beat(TrackPos) >= 7.5)
{
    Score = 100;
    Score -= (abs(array_length(HitNotes) - array_length(Inputs)) * 25);
    var TotalNotes = min(array_length(HitNotes), array_length(Inputs));
    
    for (var i = 0; i < TotalNotes; i++)
    {
        Score -= ((abs(HitNotePositions[i] - NotePositions[i]) * 50) / lerp(1, TotalNotes, 0.5));
        
        if (Inputs[i] != HitNotes[i])
            Score -= (50 / lerp(1, TotalNotes, 0.5));
    }
    
    Score = max(Score, 0);
    
    if (Score >= 50)
    {
        audio_play_sound(oDJMusicMan.SOUND_Pass, 10, false);
        block_tokens(1);
        Head.Success = 1;
    }
    else
    {
        FailurePoints++;
        
        if (Score == 0)
            FailurePoints++;
        
        audio_play_sound(oDJMusicMan.SOUND_Fail, 10, false);
        Head.Success = -1;
    }
    
    TracksCompleted++;
    
    if (TracksCompleted >= TracksToComplete)
    {
        audio_sound_loop(BackingTrack, false);
        Completed = true;
    }
}

if (!audio_is_playing(BackingTrack) && Completed && ShowBar)
{
    audio_play_sound(oDJMusicMan.SOUND_BeatEnd, 10, false, 0.5);
    ShowBar = false;
    
    with (oDJMusicMan)
    {
        Prying = false;
        HandAnimStage = "Remove";
        YStretchSpeed = 1.25;
        YSpeed = 10;
        reverb_sound(choose_from_array(SOUND_Win), 0, 500, false, 2, 0.5, 0.25);
    }
    
    with (Head)
        alarm[0] = 2;
}

if (Completed && round(BarOffset) == -64 && !audio_is_playing(oDJMusicMan.SOUND_BeatEnd))
{
    with (oDJMusicMan)
        audio_sound_gain(global.Music, SavedMusicLevel, 2000);
    
    instance_destroy(oDJMusicMan_Head);
    instance_destroy();
    exit;
}

var InputPressed = 0;

if (input_check_pressed(UnknownEnum.Value_8) && ShowBar)
{
    InputPressed = -1;
    input_clear(UnknownEnum.Value_8);
}

if (input_check_pressed(UnknownEnum.Value_9) && ShowBar)
{
    InputPressed = 1;
    input_clear(UnknownEnum.Value_9);
}

if (BeatPos > 3.5 && InputPressed != 0)
{
    audio_play_sound(oDJMusicMan.SOUND_NotePlay, 10, false, 1, 0, InputPressed ? 1.2 : 0.8);
    array_push(HitNotes, sign_to_binary(InputPressed));
    array_push(HitNotePositions, BeatPos - 4);
}

if (CurTypePosition < array_length(NotePositions) && BeatPos >= NotePositions[CurTypePosition])
{
    audio_play_sound(oDJMusicMan.SOUND_NotePlace, 10, false, 1, 0, Inputs[CurTypePosition] ? 1.2 : 0.8);
    var Sound = choose_from_array(Inputs[CurTypePosition] ? oDJMusicMan.SOUND_Right : oDJMusicMan.SOUND_Left);
    reverb_sound(Sound, 0, 500, false, 2, 0.5, 0.25);
    Head.Turn = 0;
    Head.TurnDir = binary_to_sign(Inputs[CurTypePosition]);
    CurTypePosition++;
}

if ((floor(BeatPos * 2) / 2) > HeadBeat && audio_is_playing(BackingTrack))
{
    HeadBeat = floor(BeatPos * 2) / 2;
    
    with (Head)
    {
        HeadPos = 1.02;
        AngleOffsetDirection = (AngleOffsetDirection == 0) ? -1 : (AngleOffsetDirection * -1);
    }
}

if (BeatPos < NotePositions[min(CurTypePosition, array_length(NotePositions) - 1)] && CurTypePosition == array_length(NotePositions))
{
    if (Head.Success == -1 && FailurePoints > (TracksToComplete / 2))
    {
        jumpscare(UnknownEnum.Value_87);
        exit;
    }
    
    Head.Success = 0;
    
    if (!Completed)
        set_pattern();
}

enum UnknownEnum
{
    Value_8 = 8,
    Value_9,
    Value_87 = 87
}
