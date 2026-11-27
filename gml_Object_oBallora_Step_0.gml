var AI = global.AILevels[ID];
var MaxTime = lerp(90, 45, AI / 20);

if (global.Timer > ActivationTime && !Active && AI > 0)
{
    Timer = 0;
    TargetCam = irandom_range(1, 8);
    
    repeat (4)
    {
        while (SliceLocations[TargetCam] == 1)
            TargetCam = irandom_range(1, 8);
        
        SliceLocations[TargetCam] = 1;
    }
    
    audio_play_sound(SOUND_MusicBox, 15, false, 0.75);
    fuzz_up();
    Active = true;
}

if (SliceLocations[global.Cam] == 1 && mouse_check_button_pressed(mb_left) && place_meeting(x, y, oMouseHitbox))
{
    audio_play_sound(SOUND_Clicked[SlicesFound % array_length(SOUND_Clicked)], 15, false, 0.5);
    audio_play_sound(sfxCamSwitch, 1, false);
    fuzz_up();
    SliceLocations[global.Cam] = 0;
    block_tokens();
    SlicesFound++;
    
    if (!array_contains(SliceLocations, 1))
    {
        audio_stop_sound(SOUND_Warning);
        audio_stop_sound(SOUND_MusicBox);
        Defeated = 1;
    }
}

x = 880;
y = 32;
image_index = global.Cam - 1;

if (Active && !Defeated)
    Timer += 0.016666666666666666;

if ((MaxTime - Timer) == 10)
    audio_play_sound(SOUND_Warning, 15, false, 0.5);

if (Timer > MaxTime)
    jumpscare(ID, 0);
