application_surface_draw_enable(false);
set_guard_parameters((!global.FourLayersDownMode && global.Guard >= 21) ? UnknownEnum.Value_1 : global.Guard);
BossMode = UnknownEnum.Value_0;

if (global.Night == 6 || global.Night == "Custom")
{
    switch (global.Route)
    {
        default:
            BossMode = UnknownEnum.Value_0;
            break;
        
        case UnknownEnum.Value_2:
            BossMode = UnknownEnum.Value_1;
            break;
        
        case UnknownEnum.Value_3:
            BossMode = UnknownEnum.Value_2;
            break;
        
        case UnknownEnum.Value_4:
            BossMode = UnknownEnum.Value_3;
            instance_destroy(oPauser);
            break;
    }
}

var FredbearMode = (eleanor_challenge_active(UnknownEnum.Value_7) || array_contains(global.AllTimeSalvages, UnknownEnum.Value_127)) && global.Night == "Endless";

if (global.Cheats[UnknownEnum.Value_7])
    FredbearMode = true;

gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);
gpu_set_texrepeat(true);
CameraRotation = 0;
CameraX = x;
CameraY = y;
CameraZ = 256;
CameraXTo = x;
CameraYTo = y - 32;
CameraZTo = 512;
MonitorUp = 0;
ShakeX = 0;
ShakeY = 0;
HoneInOnCenter = false;
FOV = 70.25;

if (numbered_night() && BossMode != UnknownEnum.Value_3)
    global.NightSpeedup = 1;

if (FredbearMode)
    global.NightSpeedup = 3;

global.Doors = [0, 0];
global.Flashlight = false;
global.Timer = 360 - (360 / global.NightSpeedup);
global.Lights = 1;
global.CamUp = 0;
global.Cam = 1;
global.TVCam = [2, 1];
global.SavedCam = 1;
global.MaskDown = 0;
global.Fan = 0;
global.MonitorSystem = "Cameras";
global.Heater = false;
global.Jumpscare = 0;
global.JumpscareType = 0;
global.PanelUp = false;
global.EndOfNightBlocks = [];
global.WindowOccupant = -1;
global.DoorOccupant = [-1, -1];
global.Progress = 0;
global.ProgressToMake = 360;
global.JumpscareImmunity = false;
DrainRate = lerp(global.NightSpeedup, 1, 0.25);

if (BossMode == UnknownEnum.Value_3)
    DrainRate = 2;

global.TimeOfDeath = 0;
CamAnimation = 0;
MaskAnimation = 0;
CamAlpha = 1;

if (BossMode != UnknownEnum.Value_3)
{
    audio_resume_all();
    audio_stop_all();
}

var MusicList = [musNight1, musNight2, musNight3, musNight4, musNight5, musNight6];
var CustomMusicList = [musNightCustom1, musNightCustom2, musNightCustom3, musNightCustom4, musNightCustom5];
var MusicGain = 1;
SongID = -1;

if (global.Night == "Custom" && !boss_fight_night())
{
    global.Upgrades = [];
    
    for (var i = 0; i < array_length(global.CustomNightUpgrades); i++)
        array_push(global.Upgrades, global.CustomNightUpgrades[i]);
    
    global.AllTimeSalvages = [];
    var TwentyAmount = floor(get_total_ai_levels() / 20);
    
    if (TwentyAmount < 5)
        SongID = musNightCustom1;
    else if (TwentyAmount < 10)
        SongID = musNightCustom2;
    else if (TwentyAmount < 20)
        SongID = musNightCustom3;
    else if (TwentyAmount < 30)
        SongID = musNightCustom4;
    else if (TwentyAmount < 40)
        SongID = musNightCustom5;
    else
        SongID = musNightCustom6;
    
    if (global.ChallengeTitle == "Embodiment of Scarlet Rainbow")
        SongID = mus_CMRChallenge;
    
    if (global.CustomNightMusic != undefined)
    {
        SongID = global.CustomNightMusic;
        
        if (SongID == mus_BossFredbear || SongID == mus_BossNightmare_Main)
            MusicGain = 0.3;
    }
    
    if (global.Cheats[UnknownEnum.Value_6])
        array_push(global.Upgrades, UnknownEnum.Value_12);
}
else if (is_numeric(global.Night) && BossMode == UnknownEnum.Value_0)
{
    SongID = MusicList[global.Night - 1];
}
else if (global.Night == "Endless")
{
    var PossibleSongs = [musNight1, musNightCustom1, musNightCustom2, musNight2, musNightCustom3, musNight3, musNightCustom4, musNight4, musNightCustom5, musNight5];
    
    if (global.EndlessRound > 10)
        PossibleSongs = [musNight6, musNightCustom3, musNightCustom4, musNightCustom5, musNightCustom6];
    
    SongID = PossibleSongs[(global.EndlessRound - 1) % array_length(PossibleSongs)];
    
    if (any_challenge_active() && !guard_ability(UnknownEnum.Value_14))
        SongID = musNightEleanor;
}
else
{
    SongID = sfxNOTHING;
}

if (SongID != sfxNOTHING)
    global.Music = play_music(SongID, MusicGain);

global.DoorGen = 0;
global.Power = global.GuardParameters.starting_power;
global.Tokens = global.GuardParameters.starting_tokens;
global.Temperature = 0;
global.CupcakeMeter = 0;
MinTokens = 0;
MinTemperature = 0;
TemperatureRate = global.GuardParameters.temperature_rate * 0.5;
FanSpeed = 1;
FlashlightPower = 1;
AggroMultiplier = global.GuardParameters.aggro_multiplier;
InfinitePowerCutoffTime = 0;

if (global.Cheats[UnknownEnum.Value_2])
    InfinitePowerCutoffTime = infinity;

Freeze = false;
global.Tools = 
{
    Camera: 0,
    Doors: [0, 0],
    Fan: 0,
    Mask: 0,
    Flashlight: 0,
    AudioLure: [0, 0]
};

if (global.Night == "Custom")
{
    if (global.DisabledTools.Camera)
        global.Tools.Camera = infinity;
    
    if (global.DisabledTools.Doors)
        global.Tools.Doors = [infinity, infinity];
    
    if (global.DisabledTools.Fan)
        global.Tools.Fan = infinity;
    
    if (global.DisabledTools.Mask)
        global.Tools.Mask = infinity;
    
    if (global.DisabledTools.Flashlight)
        global.Tools.Flashlight = infinity;
    
    if (global.DisabledTools.AudioLure)
        global.Tools.AudioLure = [infinity, infinity];
}

Usage = 0;
Freezeframe = undefined;
JawLevel = 0;
ShowMalhare = false;
StareFrames = -180;
ZapAlpha = 0;
Itemless = 2;
OnetimersScheduled = false;
ScreenshotsTaken = 0;
EntranceAlpha = 1;
TokenBoxSpeed = 0;
TokenBoxOffset = 0;
TokenBoxValue = global.Tokens;
HandheldUp = false;
HandheldOffset = 740;
global.BaseBrightness = has_upgrade(UnknownEnum.Value_44) ? 0.25 : 0.5;
global.Brightness = global.BaseBrightness;

function start_salvage_fight(arg0 = 0)
{
    instance_create_depth(0, 0, 0, oSalvage);
    SongID = mus_BossSalvage;
    global.Music = play_music(SongID);
}

if (BossMode == UnknownEnum.Value_1)
{
    global.Brightness = 0.8;
    instance_create_depth(0, 0, depth - 1, oHappiestDayDrawer);
    instance_deactivate_object(oHappiestDayDrawer);
    
    if (global.BossPhase > 1 || global.Night == "Custom")
    {
        global.BossPhase = max(global.BossPhase, 1);
        
        if (global.BossPhase > 1)
            global.Brightness = 0.5;
        
        instance_activate_object(oHappiestDayDrawer);
        
        with (oHappiestDayDrawer)
        {
            Level = global.BossPhase;
            Screen = "LevelOpen";
            Timer = 180;
        }
        
        if (global.Difficulty > 3)
            oHappiestDayDrawer.PeacefulMode = true;
        
        with (oNightmareFoxy)
            AI = 10;
    }
}

if (BossMode == UnknownEnum.Value_2)
    instance_create_depth(0, 0, 0, oSalvageOpener_Manager);

function ai_set(arg0, arg1)
{
    if (array_contains(global.AllTimeSalvages, arg0) || global.Night == "Custom" || global.Night == "Endless")
    {
        var DiffFactor = 1 + ((global.Difficulty - 1) * 0.5);
        global.AILevels[arg0] = max(global.AILevels[arg0], clamp(round(arg1 * DiffFactor), global.AILevels[arg0], 20));
    }
}

NewAnimatronics = [];

if (numbered_night())
{
    global.AILevels = array_create(UnknownEnum.Value_201, 0);
    var NightlyChars = global.Difficulty + 1;
    
    if (global.Night >= 2 && global.Night < 6)
        NightlyChars += global.SalvagedScraps[global.Night - 2];
    
    if (global.Night == 1)
        NightlyChars = 2;
    
    var i = array_length(global.AllTimeSalvages) - 1;
    
    while (i >= max(array_length(global.AllTimeSalvages) - NightlyChars, 0))
    {
        array_push(NewAnimatronics, global.AllTimeSalvages[i]);
        i--;
    }
}

if (global.Night == "Endless")
{
    global.AILevels = array_create(UnknownEnum.Value_201, 0);
    global.Guard = global.Lives[array_length(global.Lives) - 1];
    ActivationsAtStart = [];
    ActivationsBeforeStart = [];
    var Salvages = global.AllTimeSalvages;
    
    for (var i = 0; i < array_length(Salvages); i++)
    {
        var Data = get_animatronic_data(Salvages[i]).ScheduleType;
        
        if (Data == UnknownEnum.Value_2)
            array_push(ActivationsBeforeStart, Salvages[i]);
        else
            array_push(ActivationsAtStart, Salvages[i]);
    }
    
    if (eleanor_challenge_active(UnknownEnum.Value_16))
    {
        Salvages = global.EndlessInventory.WhackedChars;
        
        for (var i = 0; i < array_length(Salvages); i++)
        {
            var Data = get_animatronic_data(Salvages[i]).ScheduleType;
            
            if (Data == UnknownEnum.Value_2)
                array_push(ActivationsBeforeStart, Salvages[i]);
            else
                array_push(ActivationsAtStart, Salvages[i]);
        }
    }
}

TimeOffset = (has_upgrade(UnknownEnum.Value_15) * speedup_seconds(-15)) + (has_upgrade(UnknownEnum.Value_16) * speedup_seconds(-30));

if (has_upgrade(UnknownEnum.Value_17))
    global.Timer += speedup_seconds(30);

StartTime = 360 - (360 / global.NightSpeedup);

if (eleanor_challenge_active(UnknownEnum.Value_9))
{
    StartTime -= speedup_seconds(60);
    global.Timer -= speedup_seconds(60);
}

if (eleanor_challenge_active(UnknownEnum.Value_11))
    instance_create_layer(-99, -99, "Room", oRandomAnimatronicSummoner);

WetMode = eleanor_challenge_active(UnknownEnum.Value_13);

function get_time()
{
    return floor(global.Timer + TimeOffset) / 60;
}

if (global.Night == "Endless")
    spawn_consumables();

function spawn_starter_items()
{
    if (guard_ability(UnknownEnum.Value_11))
        instance_create_depth(0, 0, 0, oShopItem_Beartrap);
    
    if (has_upgrade(UnknownEnum.Value_40))
    {
        with (instance_create_depth(0, 0, 0, oShopItem_DeathCoin))
            Value = speedup_tokens(30);
    }
    
    if (has_upgrade(UnknownEnum.Value_51))
    {
        with (instance_create_depth(0, 0, 0, oShopItem_Beartrap))
            Value = speedup_tokens(25);
    }
    
    if (has_upgrade(UnknownEnum.Value_23))
    {
        with (instance_create_depth(0, 0, 0, oShopItem_GoldenCupcake))
            Value = speedup_tokens(15);
    }
    else if (has_upgrade(UnknownEnum.Value_22))
    {
        global.Tokens += speedup_tokens(30);
    }
    else if (has_upgrade(UnknownEnum.Value_21))
    {
        global.Tokens += speedup_tokens(15);
    }
    else if (has_upgrade(UnknownEnum.Value_20))
    {
        global.Tokens += speedup_tokens(5);
    }
    
    alarm[0] = 30;
}

if ((guard_ability(UnknownEnum.Value_19) || guard_ability(UnknownEnum.Value_8) || guard_ability(UnknownEnum.Value_30)) && !FredbearMode)
{ 
    if (global.Night == "Endless")
        global.ProgressToMake = round(((global.GuardParameters.point_goal_base + (global.GuardParameters.point_goal_nightly * (global.EndlessRound - 1))) * 3) / global.NightSpeedup);
    else
        global.ProgressToMake = (global.GuardParameters.point_goal_base * 6) / global.NightSpeedup;
}

if (has_upgrade(UnknownEnum.Value_1))
    global.Power += 25;
else if (has_upgrade(UnknownEnum.Value_0))
    global.Power += 10;

if (has_upgrade(UnknownEnum.Value_33))
    MinTemperature = -40;
else if (has_upgrade(UnknownEnum.Value_32))
    MinTemperature = -20;

if (has_upgrade(UnknownEnum.Value_14))
    FanSpeed = 5;
else if (has_upgrade(UnknownEnum.Value_13))
    FanSpeed = 2;

if (has_upgrade(UnknownEnum.Value_26))
    MinTokens = -infinity;
else if (has_upgrade(UnknownEnum.Value_25))
    MinTokens = speedup_tokens(-30);
else if (has_upgrade(UnknownEnum.Value_24))
    MinTokens = speedup_tokens(-15);

if (has_upgrade(UnknownEnum.Value_39))
    FlashlightPower = 2;
else if (has_upgrade(UnknownEnum.Value_38))
    FlashlightPower = 1.5;

if (has_upgrade(UnknownEnum.Value_2))
    InfinitePowerCutoffTime = speedup_seconds(60);

Lockdown = has_upgrade(UnknownEnum.Value_57) || has_upgrade(UnknownEnum.Value_58) || has_upgrade(UnknownEnum.Value_59);
LockdownTime = speedup_seconds(has_upgrade(UnknownEnum.Value_59) ? 60 : (has_upgrade(UnknownEnum.Value_58) ? 30 : 15), false, true);

if (eleanor_challenge_active(UnknownEnum.Value_2))
    global.Power -= 25;

if (eleanor_challenge_active(UnknownEnum.Value_1))
    global.Tokens -= 15;

if (eleanor_challenge_active(UnknownEnum.Value_4))
{
    global.BaseBrightness = 1;
    global.Brightness = 1;
}

MaxPower = global.Power;

if (BossMode == UnknownEnum.Value_0 || BossMode == UnknownEnum.Value_3)
    spawn_starter_items();

Muffler = audio_effect_create(AudioEffectType.LPF2);
Muffler.cutoff = 600;

if (eleanor_challenge_active(UnknownEnum.Value_8))
{
    var Bitcrusher = audio_effect_create(AudioEffectType.Bitcrusher);
    Bitcrusher.factor = 8;
    audio_bus_main.effects[1] = Bitcrusher;
}

if (WetMode)
{
    var WetMuffler = audio_effect_create(AudioEffectType.LPF2);
    WetMuffler.cutoff = 600;
    var Reverb = audio_effect_create(AudioEffectType.Reverb1);
    Reverb.size = 0.2;
    Reverb.mix = 0.25;
    Reverb.damp = 0.8;
    var Gain = audio_effect_create(AudioEffectType.Gain);
    Gain.gain = 2;
    audio_bus_main.effects[1] = Reverb;
    audio_bus_main.effects[2] = WetMuffler;
    audio_bus_main.effects[3] = Gain;
}

MaskImage = has_upgrade(UnknownEnum.Value_37);

if (has_upgrade(UnknownEnum.Value_36) || MaskImage)
    Muffler.cutoff = 9999;

function get_guard_mask_sprite(arg0)
{
    switch (arg0)
    {
        case UnknownEnum.Value_0:
            return sMask_Jeremy;
        
        case UnknownEnum.Value_1:
            return sMask_Mike;
        
        case UnknownEnum.Value_2:
            return sMask_Vanessa;
        
        case UnknownEnum.Value_3:
            return sMask_Fritz;
        
        case UnknownEnum.Value_4:
            return sMask_Michael;
        
        case UnknownEnum.Value_5:
            return sMask_Vannabelle;
        
        case UnknownEnum.Value_6:
            return sMask_Clark;
        
        case UnknownEnum.Value_7:
            return sMask_Frank;
        
        case UnknownEnum.Value_8:
            return sMask_TheBoss;
        
        case UnknownEnum.Value_10:
            return sMask_Henry;
        
        case UnknownEnum.Value_11:
            return sMask_William;
        
        case UnknownEnum.Value_12:
            return sMask_Edwin;
        
        case UnknownEnum.Value_13:
            return sMask_Fiona;
        
        case UnknownEnum.Value_19:
            return sMask_Sally;
        
        case UnknownEnum.Value_17:
            return sMask_Mary;
        
        case UnknownEnum.Value_15:
            return sMask_Cassie;
        
        case UnknownEnum.Value_18:
            return sMask_Strings;
        
        case UnknownEnum.Value_16:
            return sMask_Hudson;
        
        case UnknownEnum.Value_9:
            return sMask_Billy;
        
        case UnknownEnum.Value_14:
            return sMask_Elizabeth;
        
        case UnknownEnum.Value_20:
            return sMask_OMC;
        
        default:
            return sMask_Mike;
    }
}

function get_guard_reflection_sprite(arg0)
{
    switch (arg0)
    {
        case UnknownEnum.Value_0:
            return sGuardReflection_Jeremy;
        
        case UnknownEnum.Value_1:
            return sGuardReflection_Mike;
        
        case UnknownEnum.Value_2:
            return sGuardReflection_Vanessa;
        
        case UnknownEnum.Value_3:
            return sGuardReflection_Fritz;
        
        case UnknownEnum.Value_4:
            return sGuardReflection_Michael;
        
        case UnknownEnum.Value_5:
            return sGuardReflection_Vannabelle;
        
        case UnknownEnum.Value_6:
            return sGuardReflection_Clark;
        
        case UnknownEnum.Value_7:
            return sGuardReflection_Frank;
        
        case UnknownEnum.Value_8:
            return sGuardReflection_TheBoss;
        
        case UnknownEnum.Value_10:
            return sGuardReflection_Henry;
        
        case UnknownEnum.Value_11:
            return sGuardReflection_William;
        
        case UnknownEnum.Value_12:
            return sGuardReflection_Edwin;
        
        case UnknownEnum.Value_13:
            return sGuardReflection_Fiona;
        
        case UnknownEnum.Value_19:
            return sGuardReflection_Sally;
        
        case UnknownEnum.Value_17:
            return sGuardReflection_Mary;
        
        case UnknownEnum.Value_15:
            return sGuardReflection_Cassie;
        
        case UnknownEnum.Value_18:
            return sGuardReflection_Strings;
        
        case UnknownEnum.Value_16:
            return sGuardReflection_Hudson;
        
        case UnknownEnum.Value_9:
            return sGuardReflection_Billy;
        
        case UnknownEnum.Value_14:
            return sGuardReflection_Elizabeth;
        
        case UnknownEnum.Value_20:
            return sGuardReflection_OMC;
        
        default:
            return sGuardReflection_Mike;
    }
}

FaceSprites = import_sprites_solo(global.Guard, "reflection.png", get_guard_reflection_sprite(global.Guard), 2);
MaskSprite = import_sprites_solo(global.Guard, "mask.png", get_guard_mask_sprite(global.Guard), 2, 320, 240);
TintColor = 16777215;
Block6AMTransition = false;
BossTimer = global.SavedBossTime;
audio_sound_gain(sfxClockTicking, 1, 0);
Scared = (global.Night == "Endless" && lives_left() == 1) && (!global.NuzlockeMode || global.DeathsThisRound > 0);
MinigameCompletionPoints = 0;
BlockedAnimatronicsAmount = 0;
global.TurnedAround = false;

if (SongID != mus_BossSalvage)
{
    if (WetMode)
        audio_play_sound(sfxReagentBubbling, 10, true, 0.8, 0, 0.6);
    else
        audio_play_sound(sfxAmbience, 10, true, 0.3);
}

if (FredbearMode)
{
    audio_stop_sound(global.Music);
    global.Music = sfxNOTHING;
    instance_create_depth(0, 0, 0, oFredbear);
    StartTime -= 5;
    TimeOffset -= 5;
    global.Timer -= 5;
}

function mouseclear_sequence()
{
    var ObjOrd = [oSecurity, oBonnet, oGlamrockChica_AssemblyMenu, oSpringBonnie, oBonZapper, oMinigameParent];
    
    for (var i = 0; i < array_length(ObjOrd); i++)
    {
        with (ObjOrd[i])
            event_perform(ev_other, ev_user0);
    }
}

FredsweepersBeaten = 0;
global.ItemPayout = 0;
TVSurf = -1;
ScreenAngle = 0;
ScreenAngleSpeed = 0;
WaveTimer = shader_get_uniform(shWavy, "time");
UpsideDown = eleanor_challenge_active(UnknownEnum.Value_15) * 180;

if (UpsideDown)
{
    with (oSuperGameManager)
        UpsideDownTest = true;
    
    audio_play_sound(sfxUpsideDown, 10, false, 0.75);
    ScreenAngleSpeed = -30;
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12,
    Value_13,
    Value_14,
    Value_15,
    Value_16,
    Value_17,
    Value_18,
    Value_19,
    Value_20,
    Value_21,
    Value_22,
    Value_23,
    Value_24,
    Value_25,
    Value_26,
    Value_30 = 30,
    Value_32 = 32,
    Value_33,
    Value_36 = 36,
    Value_37,
    Value_38,
    Value_39,
    Value_40,
    Value_44 = 44,
    Value_51 = 51,
    Value_57 = 57,
    Value_58,
    Value_59,
    Value_127 = 127,
    Value_201 = 201
}

enum AudioEffectType
{
    Bitcrusher,
    Delay,
    Gain,
    HPF2,
    LPF2,
    Reverb1,
    Tremolo,
    PeakEQ,
    HiShelf,
    LoShelf,
    EQ,
    Compressor
}
