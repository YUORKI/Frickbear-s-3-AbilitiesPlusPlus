AI = global.AILevels[UnknownEnum.Value_74];

if (!Active)
{
    if (Frame >= (lerp(62, 31, AI / 20) * Randomizer) && AI > 0)
    {
        initialize();
        KillTimer = lerp(12, 6, AI / 20);
        Active = true;
        simple_sound(sfxSalvage_WireDrop, 0, -400, false, 1.5);
        simple_sound(sfxMetalSlam, 0, -400, false, 1);
        reverb_sound(choose_from_array(SOUND_Appear), 0, -400);
        Frame = 0.25;
        Body = instance_create_layer(-999, -999, "InFrontOf_Wall", oOfficeSprite);
        Head = instance_create_layer(-999, -999, "InFrontOf_Wall", oOfficeSprite);
        ArmL = instance_create_layer(-999, -999, "InFrontOf_Wall", oOfficeSprite);
        HandL = instance_create_layer(-999, -999, "InFrontOf_Wall", oOfficeSprite);
        PigtailL = instance_create_layer(-999, -999, "InFrontOf_Wall", oOfficeSprite);
        ArmR = instance_create_layer(-999, -999, "InFrontOf_Wall", oOfficeSprite);
        HandR = instance_create_layer(-999, -999, "InFrontOf_Wall", oOfficeSprite);
        PigtailR = instance_create_layer(-999, -999, "InFrontOf_Wall", oOfficeSprite);
        var HandSprite = fully_turned_around() ? sNOTHING : sJackie_Hand;
        Body.sprite_index = sJackie_Body;
        Body.DrawDepth = 53;
        Head.sprite_index = sJackie_Head;
        Head.DrawDepth = 55;
        HandL.sprite_index = HandSprite;
        HandL.DrawDepth = 52;
        HandR.sprite_index = HandSprite;
        HandR.DrawDepth = 52;
        ArmR.sprite_index = sJackie_Arm;
        ArmR.DrawDepth = 51;
        ArmL.sprite_index = sJackie_Arm;
        ArmL.DrawDepth = 51;
        PigtailL.sprite_index = sJackie_Hair;
        PigtailL.DrawDepth = 54;
        PigtailR.sprite_index = sJackie_Hair;
        PigtailR.DrawDepth = 54;
    }
}
else
{
    var HeadX = 1344;
    var BounceY = HeadPosition + (dsin(Frame * 240) * 10);
    var BodyY = BounceY - 123;
    var ArmTopY = BodyY + 132;
    var HeadY = BounceY + ((BounceY - 256) * 0.2);
    HandPosition += HandSpeed;
    HandSpeed = lerp(HandSpeed, ((Defeated ? -196 : 480) - HandPosition) * 0.4, 0.2);
    
    if (Frame == 1)
        reverb_sound(sfxJackie_Popup, 0, -400);
    
    if (Frame > 1)
    {
        HeadPosition += HeadSpeed;
        HeadSpeed = lerp(HeadSpeed, (HeadTargetY - HeadPosition) * 0.35, 0.2);
        
        if (CrankingIt)
        {
            KillTimer -= 0.004166666666666667;
        }
        else
        {
            KillTimer -= 0.016666666666666666;
            
            if (KillTimer <= 0)
            {
                jumpscare(ID);
                exit;
            }
        }
    }
    
    HeadStretch += HeadStretchSpeed;
    HeadStretchSpeed = lerp(HeadStretchSpeed, (1 - HeadStretch) * 0.35, 0.25);
    var CrankOffset = CrankingIt * ((DefaultHeadTarget - HeadTargetY) / (DefaultHeadTarget - DefeatPosition)) * 2;
    CrankOffset = power(CrankOffset, 2);
    CrankOffset = random_range(CrankOffset * -1, CrankOffset * 1);
    
    if (Head != -1)
    {
        ArmL.x = (CrankOffset + HeadX) - 58;
        ArmL.y = ArmTopY + 448;
        ArmL.image_xscale = -1;
        ArmL.image_yscale = (HandPosition - ArmTopY) / sprite_get_height(sJackie_Arm);
        ArmR.x = CrankOffset + HeadX + 58;
        ArmR.y = ArmTopY + 448;
        ArmR.image_xscale = 1;
        ArmR.image_yscale = (HandPosition - ArmTopY) / sprite_get_height(sJackie_Arm);
        HandL.x = (CrankOffset + HeadX) - 58;
        HandL.y = HandPosition + 448;
        HandL.image_xscale = 1;
        HandR.x = CrankOffset + HeadX + 58;
        HandR.y = HandPosition + 448;
        HandR.image_xscale = -1;
        Body.x = HeadX;
        Body.y = (BounceY - 123) + 448;
        PigtailL.x = HeadX - 36;
        PigtailL.y = HeadY + 51 + 448;
        PigtailL.image_xscale = -1;
        PigtailL.image_angle = dsin((Frame * 240) - 15) * 5;
        PigtailR.x = HeadX + 36;
        PigtailR.y = HeadY + 51 + 448;
        PigtailR.image_xscale = 1;
        PigtailR.image_angle = dsin((Frame * 240) - 15) * -5;
        Head.image_index = Expression;
        Head.x = HeadX;
        Head.y = HeadY + 448;
        Head.image_xscale = 1 * HeadStretch;
        Head.image_yscale = 1 / HeadStretch;
    }
    
    if (HeadTargetY < DefaultHeadTarget && !Expression)
    {
        Expression = 1;
        HeadStretchSpeed = 0.1;
    }
    else if (HeadTargetY >= DefaultHeadTarget && Expression)
    {
        Expression = 0;
        HeadStretchSpeed = -0.1;
    }
    
    if (HeadTargetY <= DefeatPosition && !Defeated)
    {
        Defeated = true;
        CrankingIt = false;
        CrankSpeed = 4;
        HeadTargetY = -196;
        HandSpeed = -16;
        HeadSpeed = -8;
        simple_sound(sfxMetalImpact, 0, -400, false, 0.8);
        reverb_sound(sfxJackie_Released, 0, -400);
        reverb_sound(voc_Jackie_Launch, 0, -400);
        block_tokens();
    }
    
    if (Defeated && HandPosition < -128)
    {
        Active = false;
        Frame = 0;
        instance_destroy(Body);
        Body = -1;
        instance_destroy(Head);
        Head = -1;
        instance_destroy(ArmL);
        ArmL = -1;
        instance_destroy(HandL);
        HandL = -1;
        instance_destroy(PigtailL);
        PigtailL = -1;
        instance_destroy(ArmR);
        ArmR = -1;
        instance_destroy(HandR);
        HandR = -1;
        instance_destroy(PigtailR);
        PigtailR = -1;
    }
}

if (CrankingIt)
    oCamera.HoneInOnCenter = true;

Frame += 0.016666666666666666;

enum UnknownEnum
{
    Value_74 = 74
}
