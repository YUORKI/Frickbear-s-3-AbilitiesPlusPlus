ID = UnknownEnum.Value_56;
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
    bitcrush_sound(sfxBaby);
    audio_play_sound(sfxPowerDown, 15, false, 0.5, 0, 1.1);
    Active = true;
    WarningTimer = 15;
    Animation = irandom(2);
}

function set_time_to_attack()
{
    TimeToAttack = lerp(70, 32, global.AILevels[UnknownEnum.Value_56] / 20) * random_range(0.9, 1.1);
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
