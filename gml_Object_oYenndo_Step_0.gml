var ID = UnknownEnum.Value_54;
var AI = global.AILevels[ID];
var CameraFacing = abs(angle_difference(oCamera.CameraRotation, 90)) > 90;

if (global.CamUp)
    CameraWasUp = true;

if (!Active && (RecordedDirection != CameraFacing || (CameraWasUp && !global.CamUp)))
{
    var Likelihood = 1;
    var CanEnter = true;
    RecordedDirection = CameraFacing;
    
    if (CameraWasUp)
    {
        CameraWasUp = false;
        Likelihood = 1;
    }
    else if (CameraFacing == 1)
    {
        Likelihood = 1;
    }
    else
    {
        Likelihood = 0.8;
    }
    
    if (instance_exists(oShadowFreddy))
    {
        if (oShadowFreddy.InOffice)
            CanEnter = false;
    }
    
    if (instance_exists(oWitheredBonnie))
    {
        if (oWitheredBonnie.Mode == "Attack")
            CanEnter = false;
    }
    
    if (random(1) <= (Likelihood * lerp(0.5, 1, AI / 20)) && Cooldown <= 0 && AI > 0)
    {
        FredSuit = instance_create_layer(1088, 448 + (512 * RecordedDirection), "InFrontOf_Wall", oOfficeSprite);
        
        with (FredSuit)
            DrawDepth = 50;
        
        Timer = lerp(2, 1.5, AI / 20);
        Active = true;
        ScaryMode = irandom(50) == 0;
        
        if (irandom(100) == 77)
            ScaryMode = 2;
        
        if (irandom(1000) == 77)
            ScaryMode = 3;
    }
}
else if (Active)
{
    if (instance_exists(oJumpscarePhantoms))
        Timer += 0.016666666666666666;
    
    if (instance_exists(oTwistedWolf))
    {
        if (oTwistedWolf.WaitToAttack || oTwistedWolf.InOffice)
            Timer += 0.016666666666666666;
    }
    
    if (Timer <= 0)
    {
        instance_destroy(FredSuit);
        jumpscare(ID, 0);
    }
    
    if (wearing_mask())
        Mode = "Fadeout";
    
    if (RecordedDirection != CameraFacing)
    {
        instance_destroy(FredSuit);
        Active = false;
        Cooldown = lerp(15, 5, AI / 20);
    }
    
    Timer -= 0.016666666666666666;
}

if (FredSuit != undefined)
{
    if (ScaryMode == 1)
    {
        with (FredSuit)
        {
            sprite_index = other.SPRITE_Office;
            image_index = 1 + (floor(other.Timer * 30) % 2);
            image_xscale = 1;
            image_yscale = 1;
        }
    }
    else if (ScaryMode == 3)
    {
        with (FredSuit)
        {
            sprite_index = sYenndoStyle;
            image_index = 10 - (other.Timer * 15);
            image_xscale = 0.71;
            image_yscale = 0.71;
        }
    }
    else
    {
        with (FredSuit)
        {
            sprite_index = other.SPRITE_Office;
            image_index = (other.ScaryMode == 2) ? 3 : 0;
            image_xscale = 1;
            image_yscale = 1;
        }
    }
}

if (Cooldown > 0)
    Cooldown -= 0.016666666666666666;

enum UnknownEnum
{
    Value_54 = 54
}
