set_target_to_ui();

if (room == EndlessShop)
{
    with (oShopkeepSprite)
    {
        Pose = 2;
        BPM = 0;
    }
    
    instance_destroy(oRockstarFoxy_Chests);
}

if (Delay == 0)
    Scream = bitcrush_sound(sfxJumpscare_Funny_Wega, 0, 0, false, 2, 4);

if (Delay <= 0)
{
    JumpFrames++;
    
    if (JumpFrames >= Duration)
    {
        audio_stop_sound(Scream);
        instance_destroy();
    }
}

if (JumpFrames > 0)
    draw_sprite(sBear5Jumpscare, 0, 0, 0);

Delay--;
surface_reset_target();
