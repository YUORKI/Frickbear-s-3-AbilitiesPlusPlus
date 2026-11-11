if (Side == 0)
{
    Side = find_available_doorway();
    
    if (ForcedSide != 0)
    {
        if (!doorway_available(ForcedSide))
            Side = 0;
        else
            Side = ForcedSide;
    }
}

if (doorway_available(Side))
{
    if (ForcedSide != 0)
    {
        var Sound = choose_from_array(get_misc_voicelines(UnknownEnum.Value_127, "Door"));
        reverb_sound(Sound, 400 * Side, 0, false, 1.5, 1, 0.25);
    }
    
    occupy_doorway(UnknownEnum.Value_126, Side);
}

if (Side == 0 || global.DoorOccupant[sign_to_binary(Side)] != UnknownEnum.Value_126)
    exit;

if (DoorSound == -1)
    DoorSound = simple_sound(sfxFredbearDoor, Side * 400, 0, false);

YOffset = max(YOffset, 0);
x = 1344 + round(random_range(-0.6, 0.6)) + (512 * Side);
y = 576 + YOffset + round(random_range(-0.6, 0.6));

with (Face)
{
    sprite_index = other.PhonyMode ? sPhonyBoss_DoorHead : sFredbearDoorHead;
    x = other.x;
    y = 650 + (dsin(other.Frame * 90) * 4) + (other.YOffset / 4);
    image_xscale = 0.75;
    image_yscale = 0.75;
    image_index = clamp(round((other.Frame - 1.5) * 11), 0, 11);
    DrawDepth = 10;
}

YOffset += (YSpeed - 1);
YSpeed *= 0.75;
sprite_index = PhonyMode ? sPhonyBoss_DoorArm : sFredbearDoorClaw;

if ((input_check_pressed(UnknownEnum.Value_8) && Side == -1) || ((input_check_pressed(UnknownEnum.Value_9) && Side == 1) && global.Power > 0))
    YSpeed += (MashPower * lerp(6.5, 5, Difficulty));

if (YOffset > 200)
{
    audio_stop_sound(DoorSound);
    YSpeed = 5;
    layer = layer_get_id("Behind_Wall");
    Active = false;
    global.Doors[sign_to_binary(Side)] = true;
    global.Tools.Doors[sign_to_binary(Side)] = 1/30;
    
    if (KillFrames == 0)
    {
        if (PhonyMode && ForcedSide == 0)
        {
            with (instance_create_depth(0, 0, 0, oFredbearAttack_Claw))
            {
                ForcedSide = other.Side * -1;
                Side = other.Side * -1;
            }
        }
        else if (PhonyMode)
        {
            var Sound = choose_from_array(get_misc_voicelines(UnknownEnum.Value_127, "Hit"));
            reverb_sound(Sound, 400 * Side, 0, false, 1.5, 1, 0.25);
        }
    }
    
    KillFrames++;
    
    if (KillFrames > 30)
        instance_destroy();
}
else
{
    layer = layer_get_id("OnWall");
    
    if (YOffset == 0)
        TimeUntilKill -= (1/30);
    else
        TimeUntilKill -= 0.016666666666666666;
    
    if (TimeUntilKill <= 0)
        jumpscare(PhonyMode ? UnknownEnum.Value_127 : UnknownEnum.Value_126);
}

Frame += (1/30);
image_index = clamp(round(Frame * 11), 0, 11);

enum UnknownEnum
{
    Value_8 = 8,
    Value_9,
    Value_126 = 126,
    Value_127
}
