var ID = UnknownEnum.Value_51;
var AI = global.AILevels[ID];
var TimeToWait = lerp(58, 28, AI / 20) * Randomizer;
var TargetReelSpeed = lerp(1, 2.5, AI / 20);

if (AI == 21)
{
    TimeToWait = 0;
    var AggroLevel = (global.ProgressToMake - global.Progress) / (global.ProgressToMake - oCamera.StartTime);
    TargetReelSpeed = lerp(2, 1, AggroLevel);
}

if (WaitTime > TimeToWait && !Active && global.Tokens >= 5 && global.MonitorSystem != "Shop")
    attack(AI);

if (Active)
{
    if (AttackFrame < 0)
    {
        FishingLineY += FishingLineSpeed;
        
        if (FishingLineY > 350 && !Splashed)
        {
            Splashed = true;
            reverb_sound(sfxDeedee_Splash, 0, -400);
            audio_stop_sound(sfxDeedee_Reel);
        }
        
        FishingLineSpeed = lerp(FishingLineSpeed, (350 - FishingLineY) * 0.1, 0.2);
    }
    else
    {
        if (AttackFrame == 0)
            audio_play_sound(sfxDeedee_Reel, 10, true, 0.25, 0, 0.5);
        
        FishingLineY -= ReelSpeed;
        
        if (FishingLineY < 318)
        {
            FishingLineY += 64;
            
            if (StealFlipFlop)
                instance_create_layer(1344, 744, "Behind_Wall", oToken);
            
            StealFlipFlop = !StealFlipFlop;
        }
        
        ReelSpeed += ((TargetReelSpeed - ReelSpeed) / 20);
        
        with (oToken)
        {
            DrawDepth = -11;
            y -= other.ReelSpeed;
            
            if (y < 560)
            {
                other.TokensDrained++;
                audio_play_sound(sfxBitPunish, 8, false, 1, 0, 0.8);
                instance_destroy();
                
                with (other)
                {
                    if ((global.Tokens - 1) < oCamera.MinTokens)
                        jumpscare(ID);
                    
                    exit;
                }
                
                global.Tokens--;
            }
        }
    }
}

ArmAngle += ArmSpeed;
ArmSpeed = lerp(ArmSpeed, (30 - ArmAngle) * 0.1, 0.35);
ArmOffset *= 0.8;
AttackFrame++;

if (!is_undefined(OBJ_FishingLine))
{
    OBJ_FishingLine.x = 1344;
    OBJ_FishingLine.y = 448 + FishingLineY;
    OBJ_FishingLine.sprite_index = other.SPRITE_FishingLine;
    OBJ_FishingLine.DrawDepth = -12;
}

if (!is_undefined(OBJ_Sign))
{
    OBJ_Sign.x = 1528 + (dsin(AttackFrame) * 2) + ArmOffset;
    OBJ_Sign.y = 664 + (dcos(AttackFrame) * 2) + ArmOffset;
    OBJ_Sign.image_angle = (ArmAngle + (dsin(AttackFrame - 45) * -5)) * -1;
    OBJ_Sign.sprite_index = other.SPRITE_Sign;
    OBJ_Sign.DrawDepth = 5;
}

DeedeeYOffset += DeedeeYSpeed;
DeedeeAngle -= (DeedeeAngle / 5);
Shake -= (Shake / 10);

if (DeedeeClicked)
{
    if (DeedeeYSpeed < 0)
        DeedeeYSpeed += 0.25;
    else
        DeedeeYSpeed += (0.1 + (DeedeeYSpeed / 4));
    
    BGYOffset += BGYSpeed;
    BGYSpeed += 0.4;
    BGXOffset += BGXSpeed;
    BGAngle += (BGXSpeed / 4);
    
    if (BGYOffset >= 400)
        DeedeeClicked = false;
}

if (global.MonitorSystem == "Shop" && Active)
{
    if (clicked(301, 28, surface_get_width(DeedeeSurf), surface_get_height(DeedeeSurf)))
    {
        if (AI == 21)
        {
            error();
        }
        else
        {
            audio_play_sound(choose(sfxPunch1, sfxPunch2, sfxPunch3), 15, false);
            audio_play_sound(choose_from_array(SOUND_Hurt), 10, false);
            Shake = 10;
            HP--;
            DeedeeHitSprite = (irandom(20) == 7) ? 3 : ((DeedeeHitSprite + irandom_range(1, 2)) % 3);
            
            if (HP == 0)
            {
                WaitTime = 0;
                DeedeeClicked = true;
                DeedeeYSpeed = -4.5;
                DeedeeAngle = 360;
                BGXSpeed = random_sign();
                BGYSpeed = -5;
                Shake = 10;
                Active = false;
                block_tokens();
                audio_stop_sound(sfxDeedee_Reel);
                audio_play_sound(sfxCartoonHitSlip, 15, false);
                audio_play_sound(sfxMarioKick, 15, false);
                instance_destroy(oToken);
                instance_destroy(OBJ_FishingLine);
                OBJ_FishingLine = undefined;
                instance_destroy(OBJ_Sign);
                OBJ_Sign = undefined;
            }
        }
    }
}

if (AI > 0)
    WaitTime += 0.016666666666666666;

enum UnknownEnum
{
    Value_51 = 51
}
