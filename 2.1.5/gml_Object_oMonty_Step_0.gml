var ID = UnknownEnum.Value_68;
var AI = global.AILevels[ID];

if (Active)
{
    if (!Flashed)
    {
        if (PoseTimer >= 60)
        {
            YOffsetSpeed = 0;
            ChangePose = true;
            PoseTimer = 0;
            OffsetTarget = 16;
            YOffsetSpeed = 2;
            
            if (VulnerablePosesMissed <= 0)
                OffsetTarget = 180;
        }
        
        if (ChangePose && YOffsetSpeed < 0)
        {
            if (VulnerablePosesMissed <= 0)
            {
                instance_destroy(Poser);
                Poser = -1;
                jumpscare(UnknownEnum.Value_68);
            }
            
            ChangePose = false;
            OffsetTarget = 0;
            YOffsetSpeed = -4;
            audio_play_sound(sfxWhipCrack, 5, false, 0.5, 0, random_range(0.8, 1.2));
            
            if (PosesUntilVulnerable == 0)
            {
                set_vulnerable_ticks(AI);
                VulnerablePosesMissed--;
            }
            else if (!global.Flashlight)
            {
                PosesUntilVulnerable--;
            }
            
            Pose = (Pose + 1) % 4;
            var Grunts = [voc_Monty_Grunt2, voc_Monty_Grunt3, voc_Monty_Grunt4, voc_Monty_Grunt5];
            
            if (PosesUntilVulnerable == 0)
                reverb_sound(choose(voc_Monty_GruntExposed1, voc_Monty_GruntExposed2, voc_Monty_GruntExposed3), 0, 200, false, 1.2, 1, 0.05);
            else
                reverb_sound(Grunts[Pose], 0, 200, false, 1.2, 1, 0.05);
            
            VulnerablePosesMissed -= 0.2;
        }
        
        if (global.Flashlight && PosesUntilVulnerable > 0)
            PosesUntilVulnerable = max(PosesUntilVulnerable, 3);
        
        PoseTimer += lerp(1, 2, AI / 20);
    }
    else
    {
        if (FlashFrames >= 60)
        {
            OffsetTarget = 180;
            
            if (YOffset > OffsetTarget)
            {
                YOffsetSpeed = 0;
                YOffset = OffsetTarget;
                Active = false;
                Flashed = false;
                instance_destroy(Poser);
                Poser = -1;
                VulnerablePosesMissed = 0;
                PosesUntilVulnerable = 1;
                reset_timer(AI);
            }
        }
        
        FlashFrames++;
        ShakeDegree *= 0.95;
    }
    
    if ((global.Flashlight && !global.CamUp && !global.TurnedAround) && !Flashed && PosesUntilVulnerable == 0)
    {
        Flashed = true;
        YOffsetSpeed = -16;
        OffsetTarget = 0;
        ShakeDegree = 5;
        AngleSpeed = -8;
        block_tokens();
        audio_play_sound(sfxMontyStun, 20, false);
        reverb_sound(voc_Monty_Pain, 0, 200);
        clear_window(ID);
    }
}

image_index = Pose;

if (PosesUntilVulnerable == 0)
    image_index = 4;

if (Flashed)
    image_index = 5;

x = 256 + (ShakeDegree * random_sign());
y = 320 + YOffset;
YOffset += YOffsetSpeed;

if (FlashFrames >= 60)
    YOffsetSpeed = lerp(YOffsetSpeed, (OffsetTarget - YOffset) * 0.4, 0.05);
else
    YOffsetSpeed = lerp(YOffsetSpeed, (OffsetTarget - YOffset) * 0.5, 0.4);

image_angle += AngleSpeed;
AngleSpeed = lerp(AngleSpeed, (((FlashFrames < 60) ? 0 : -45) - image_angle) * 0.2, 0.1);

if (!Active && WaitTime > 0 && AI > 0)
    WaitTime -= 0.016666666666666666;

if (Poser != -1)
{
    Poser.x = x + 1088;
    Poser.y = y + 448;
    Poser.image_angle = image_angle;
    Poser.image_index = image_index;
}

if (WaitTime <= 0 && !Active && window_available())
{
    image_angle = 0;
    Pose = 0;
    YOffset = 180;
    AngleSpeed = 0;
    FlashFrames = 0;
    ShakeDegree = 0;
    PoseTimer = 0;
    set_vulnerable_ticks(AI);
    VulnerablePosesMissed = round(lerp(6, 4, AI / 20));
    ChangePose = false;
    OffsetSpeed = -2;
    OffsetTarget = 0;
    Active = true;
    Flashed = false;
    Poser = instance_create_layer(-999, -999, "Behind_Wall", oOfficeSprite);
    Poser.sprite_index = sMonty;
    audio_play_sound(sfxMontyWoosh, 20, false);
    audio_play_sound(sfxMontyWhistle, 20, false);
    reverb_sound(voc_Monty_GruntExposed3, 0, 200, false, 1.2, 1, 0.05);
    global.WindowOccupant = ID;
}

enum UnknownEnum
{
    Value_68 = 68
}
