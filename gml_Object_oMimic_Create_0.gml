ID = UnknownEnum.Value_73;
SPRITE_Jumpscare = skin_sprite(sMimicFaces, ID, get_sprite_filenames(12, 19));
SPRITE_CamRadar = skin_sprite(sCamRadarIcon_Mimic, ID, ["camradar_1.png", "camradar_2.png", "camradar_3.png", "camradar_4.png", "camradar_5.png", "camradar_6.png", "camradar_7.png", "camradar_8.png"]);
SPRITE_DataDiver = skin_sprite(sDataDiver, ID, "sprite_01.png");
SPRITE_Faces = skin_sprite(sDataDiver_Faces, ID, get_sprite_filenames(3, 11));
SPRITE_Border = skin_sprite(sDataDiver_Border, ID, "sprite_02.png");
SOUND_Move = skin_sound(sfxMimicMove, ID, "sq_move");
SOUND_Static = skin_sound(sfxMimicGarble, ID, "sq_static");
SOUND_Open = skin_sound(sfxControlPanel_Open, ID, "sq_open");
SOUND_Close = skin_sound(sfxControlPanel_Close, ID, "sq_close");
SOUND_Select = skin_sound(sfxControlPanel_Select, ID, "sq_select");
SOUND_Flag = skin_sound(sfxBitPlace, ID, "sq_flag");
SOUND_TaskDone = skin_sound(sfxControlPanel_TaskDone, ID, "sq_hover");
SOUND_Impact = skin_sound(sfxMetalImpact, ID, "sq_destroy");
TotalSuits = 4;
Lives = max(round(3 / global.NightSpeedup), 1);
Active = true;
CurrentPosition = 0;
KillTimer = 120;

function change_possessed_suit()
{
    instance_destroy(oMimicSuit);
    PossessedSuit = irandom(TotalSuits - 1);
    
    for (var i = 0; i < TotalSuits; i++)
    {
        with (instance_create_depth(0, 0, depth, oMimicSuit))
        {
            Identity = i;
            Camera = 0;
            Possessed = other.PossessedSuit == i;
        }
    }
    
    MovementPatterns = [[1, 2, 3, 4], [1, 2, 4, 3], [1, 3, 2, 4], [1, 3, 4, 2], [1, 4, 2, 3], [1, 4, 3, 2], [2, 1, 3, 4], [2, 1, 4, 3], [2, 3, 1, 4], [2, 3, 4, 1], [2, 4, 1, 3], [2, 4, 3, 1], [3, 1, 2, 4], [3, 1, 4, 2], [3, 2, 1, 4], [3, 2, 4, 1], [3, 4, 1, 2], [3, 4, 2, 1], [4, 1, 2, 3], [4, 1, 3, 2], [4, 2, 1, 3], [4, 2, 3, 1], [4, 3, 1, 2], [4, 3, 2, 1]];
    CurrentPosition = 0;
    KillTimer = min(120, 360 - global.Timer);
    var CompletelyIsolated = false;
    var MinimumSuits = round(lerp(0, 2.4, global.AILevels[UnknownEnum.Value_73] / 20));
    
    for (var Loops = 0; !CompletelyIsolated; Loops++)
    {
        if (Loops >= 100)
        {
            MinimumSuits--;
            Loops = 0;
        }
        
        var FriendsPerStep = [0, 0, 0, 0];
        MovementPatterns = array_shuffle(MovementPatterns, 0, lerp(12, 24, (TotalSuits - 4) / 4));
        ValidSteps = 0;
        
        for (var step = 0; step < 4; step++)
        {
            var MimicsPosition = MovementPatterns[PossessedSuit][step];
            
            for (var suitCheck = 0; suitCheck < TotalSuits; suitCheck++)
            {
                if (suitCheck == PossessedSuit)
                    continue;
                
                if (MovementPatterns[suitCheck][step] == MimicsPosition)
                    FriendsPerStep[step]++;
            }
        }
        
        var LoopAgain = false;
        
        for (var i = 0; i < 4; i++)
        {
            if (FriendsPerStep[i] < MinimumSuits)
                LoopAgain = true;
        }
        
        if (!LoopAgain)
        {
            CompletelyIsolated = true;
            break;
        }
    }
    
    move_suits();
}

function move_suits()
{
    var PossibleCams = array_shuffle([1, 2, 3, 4, 5, 6, 7, 8]);
    
    for (var i = 0; i < instance_number(oMimicSuit); i++)
    {
        var Suit = instance_find(oMimicSuit, i);
        Suit.Camera = PossibleCams[MovementPatterns[i][CurrentPosition] - 1];
    }
    
    CurrentPosition = (CurrentPosition + 1) % 4;
}

function jumpscare_at_6AM()
{
    if (instance_exists(oJumpscare))
        return false;
    
    if (Lives > 0 && global.AILevels[UnknownEnum.Value_73] > 0)
    {
        jumpscare(UnknownEnum.Value_73, 0, 8);
        return true;
    }
    
    return false;
}

MovementTimer = 30;
HeadOffset = 1;
HeadOffsetSpeed = 0;
audio_play_sound(SOUND_Static, 50, true);
audio_sound_gain(SOUND_Static, 0, 0);
Activated = false;

enum UnknownEnum
{
    Value_73 = 73
}
