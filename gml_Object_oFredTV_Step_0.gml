var RelativeX = o3DMouse.x - 1344;
var RelativeY = o3DMouse.y - 448;
var Side = binary_to_sign(x < 320);
depth = 320 + (dsin(BobFrame) * 10);
image_angle = BaseAngle + HeightOffset + (dsin(BobFrame * 2) * 10);

if ((mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right)) && !global.CamUp)
{
    if (Side == -1 && -300 < RelativeX && -130 > RelativeX && 115 < RelativeY && 215 > RelativeY)
    {
        if (mouse_check_button_pressed(mb_left))
        {
            OffsetSpeed = 4;
            audio_play_sound(sfxTV_SwitchOff, 5, false);
            global.TVCam[0]--;
            
            if (global.TVCam[0] < 1)
                global.TVCam[0] = 8;
        }
        else
        {
            OffsetSpeed = -4;
            audio_play_sound(sfxTV_SwitchOn, 5, false);
            global.TVCam[0]++;
            
            if (global.TVCam[0] > 8)
                global.TVCam[0] = 1;
        }
    }
    
    if (Side == 1 && 300 > RelativeX && 130 < RelativeX && 115 < RelativeY && 215 > RelativeY)
    {
        if (mouse_check_button_pressed(mb_left))
        {
            OffsetSpeed = 4;
            audio_play_sound(sfxTV_SwitchOff, 5, false);
            global.TVCam[1]--;
            
            if (global.TVCam[1] < 1)
                global.TVCam[1] = 8;
        }
        else
        {
            OffsetSpeed = -4;
            audio_play_sound(sfxTV_SwitchOn, 5, false);
            global.TVCam[1]++;
            
            if (global.TVCam[1] > 8)
                global.TVCam[1] = 1;
        }
    }
}

with (instance_nearest(x, y, oTitle_HangingDecor_Office_Salvage))
    ValleyHeight = 96 - (dsin(other.BobFrame) * 10);

show_debug_message($"XDIF: {RelativeX} | YDIF: {RelativeY}");
OffsetSpeed = lerp(OffsetSpeed, (0 - HeightOffset) * 0.3, 0.2);
HeightOffset += OffsetSpeed;
