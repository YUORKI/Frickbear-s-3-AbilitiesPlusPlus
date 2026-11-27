x = 1344;
y = 948 + YOffset;
Body.sprite_index = sOrville_Body;
Body.image_index = TornadoMode ? (1 + (floor(Frame / 5) % 2)) : 0;
Body.x = x;
Body.y = y + (dsin(Frame) * 4 * Squish);
Body.image_xscale = 1 / Squish;
Body.image_yscale = Squish;

if (Body.image_index > 0 && fully_turned_around())
    Body.sprite_index = sNOTHING;

Head.sprite_index = TornadoMode ? sNOTHING : sOrville_Head;
Head.x = x;
Head.y = y + (((dsin(Frame - 30) * 8) - 220) * Squish);
Head.image_xscale = 1 / Squish;
Head.image_yscale = Squish;
LHand.sprite_index = TornadoMode ? sNOTHING : sOrville_Hands;
LHand.x = x - (120 + lengthdir_x(16, Frame));
LHand.y = y + ((lengthdir_y(16, Frame) - 220) * Squish);
LHand.image_xscale = 1 / Squish;
LHand.image_yscale = Squish;
LHand.image_angle = 15 + (dsin(Frame) * 5);
RHand.sprite_index = TornadoMode ? sNOTHING : sOrville_Hands;
RHand.x = x + (120 + lengthdir_x(16, Frame));
RHand.y = y + ((lengthdir_y(16, Frame) - 220) * Squish);
RHand.image_xscale = -1 / Squish;
RHand.image_yscale = Squish;
RHand.image_angle = -15 + (dsin(Frame) * -5);

if (TornadoMode)
{
    Squish += ((1.4 - Squish) / 8);
    
    if (Frame >= 60 && !Exiting)
    {
        TornadoMode = false;
        SquishSpeed = -0.2;
        audio_play_sound(sfxWhipCrack, 30, false);
    }
    
    if (!Exiting)
    {
        YOffset *= 0.8;
    }
    else
    {
        YOffset += YOffsetSpeed;
        YOffsetSpeed += 0.7;
        
        if (YOffset >= 512)
            instance_destroy();
    }
}
else
{
    Squish += SquishSpeed;
    SquishSpeed = lerp(SquishSpeed, (1 - Squish) * 0.3, 0.3);
}

Frame += 2;
