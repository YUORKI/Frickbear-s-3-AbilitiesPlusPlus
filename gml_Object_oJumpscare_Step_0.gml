image_index = 0;
JumpX += ((320 - JumpX) / 5);
JumpY += ((180 - JumpY) / 5);
SizeBody += (((1.25 - SizeBody) / 10) + 0.005);
SizeHead += (((1.5 - SizeHead) / 16) + 0.01);

if (Active == false)
{
    switch (global.Jumpscare)
    {
        case -1:
            audio_play_sound(sfxBitExplosion, 99, false);
            break;
        
        default:
            jump_origin();
            break;
    }
    
    Active = true;
}

Frame += 1;
