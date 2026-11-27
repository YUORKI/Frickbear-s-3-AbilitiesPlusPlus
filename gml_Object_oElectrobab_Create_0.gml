ID = UnknownEnum.Value_56;
SPRITE_PoseChill = skin_sprite(sElectrobab_Chill, ID, get_sprite_filenames(1, 2));
SPRITE_PoseChew = skin_sprite(sElectrobab_Chew, ID, get_sprite_filenames(3, 4));
SPRITE_PoseCape = skin_sprite(sElectrobab_Cape, ID, get_sprite_filenames(5, 10));
SPRITE_Window = skin_sprite(sElectrobab_Window, ID, "sprite_11.png");
SPRITE_WireBase = skin_sprite(sElectrobab_WireBase, ID, get_sprite_filenames(12, 16));
SPRITE_Wire = skin_sprite(sElectrobab_Wire, ID, get_sprite_filenames(17, 21));
SPRITE_WireButton = skin_sprite(sElectrobab_WireButton, ID, get_sprite_filenames(22, 23));
SPRITE_Warning = skin_sprite(sElectrobabWarning, ID, get_sprite_filenames(24, 25));
SOUND_Appear = skin_sound(sfxBaby, ID, "sq_warning");
SOUND_PowerOn = skin_sound(sfxPowerOn, ID, "sq_poweron");
SOUND_Powerout = skin_sound(sfxPowerDown, ID, "sq_powerdown");
SOUND_Solved = skin_sound(sfxSparkleImpact, ID, "sq_solved");
SOUND_Select = skin_sound(sfxControlPanel_Select, ID, "sq_select");
SOUND_Open = skin_sound(sfxControlPanel_Open, ID, "sq_open");
SOUND_Close = skin_sound(sfxControlPanel_Close, ID, "sq_close");
PanelOpen = false;
PanelOffset = -300;
TargetCam = 0;
WiresToSolve = 0;
PoweroutTimer = 61;
ElectroSurf = -1;
WarningTimer = 0;
ShowWarning = false;
Animation = 0;

function initialize()
{
    WireCount = floor(lerp(2, 5, global.AILevels[ID] / 20));
    LeftWireOrder = array_shuffle(countup_array(WireCount - 1));
    RightWireOrder = array_shuffle(countup_array(WireCount - 1));
    DraggedWire = -1;
    WireOffset = array_create(WireCount, 0);
    WireBounceSpeed = array_create(WireCount, 0);
    DepositedWires = array_create(WireCount, -1);
    ButtonXs = array_create(WireCount, 0);
    ButtonYs = array_create(WireCount, 0);
    PanelOffset = -300;
    PanelSpeed = 0;
    WiresToSolve = WireCount;
    
    do
        TargetCam = irandom_range(1, 8);
    until (TargetCam != UnknownEnum.Value_6 && (!character_active(UnknownEnum.Value_9) || oMangle.CurrentCam != TargetCam));
    
    PoweroutTimer = 0;
    bitcrush_sound(SOUND_Appear);
    audio_play_sound(SOUND_Powerout, 15, false, 0.5, 0, 1.1);
    Active = true;
    WarningTimer = 15;
    Animation = irandom(2);
}

function set_time_to_attack()
{
    TimeToAttack = lerp(70, 32, global.AILevels[ID] / 20) * random_range(0.9, 1.1);
}

Active = false;
set_time_to_attack();
TimeToAttack *= random_range(0.5, 1);

enum UnknownEnum
{
    Value_6 = 6,
    Value_9 = 9,
    Value_56 = 56
}
