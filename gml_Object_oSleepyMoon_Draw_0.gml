x = oCameraUI.x + 328;
y = oCameraUI.y + 12;
depth = -1;

if (CurMinigame > -1 && global.MonitorSystem == "Games" && global.AILevels[UnknownEnum.Value_78] > 0)
{
    MoonMeter[CurMinigame] = clamp(MoonMeter[CurMinigame], 0, 100);
    shader_set(TransparencyShader);
    draw_sprite(SPRITE_Meter, 0, x, y);
    var MeterX = x + 4 + round(lerp(-1, 199, VisualMoonPosition / 100));
    draw_rectangle_color(x + 4, y + 4, MeterX, y + 4 + 5, c_black, c_black, c_black, c_black, false);
    draw_sprite(SPRITE_Icon, 0, MeterX, y + 7);
    shader_reset();
    VisualMoonPosition += ((MoonMeter[CurMinigame] - VisualMoonPosition) / 5);
    
    if (MoonMeter[CurMinigame] >= 100)
    {
        instance_destroy(oMinigameParent);
        
        if (!DisabledMinigames[CurMinigame])
        {
            audio_play_sound(SOUND_Fail, 30, false);
            audio_play_sound(SOUND_Glitch, 30, false, 1, 0, 2);
            
            with (oCameraUI)
                DisabledMinigames[other.CurMinigame] = true;
            
            DisabledMinigames[CurMinigame] = true;
            KersplodeFrame = 30;
        }
        
        if (KersplodeFrame > 0)
        {
            if (!surface_exists(SleepySurf))
                SleepySurf = surface_create(160, 144);
            
            surface_set_target(SleepySurf);
            draw_clear_alpha(c_black, 1);
            
            for (var yPos = 0; yPos < 144; yPos += SegmentHeight)
            {
                var SegmentHeight = irandom_range(8, 32);
                draw_sprite_part(SPRITE_Glitch, 0, 0, yPos, 160, yPos + SegmentHeight, irandom_range(-64, 64), yPos);
            }
            
            surface_reset_target();
            draw_surface_ext(SleepySurf, oCameraUI.x + 314, oCameraUI.y + 38, 2, 2, 0, c_white, 1);
            KersplodeFrame--;
            
            if (KersplodeFrame == 0)
            {
                audio_stop_sound(SOUND_Glitch);
                audio_play_sound(SOUND_Laugh, 30, false, 1, 0, 0.8);
            }
        }
        else
        {
            draw_sprite_ext(SPRITE_Glitch, floor(AnimFrame), oCameraUI.x + 314, oCameraUI.y + 38, 2, 2, 0, c_white, 1);
        }
    }
}

AnimFrame = (AnimFrame + (1/15)) % 120;

enum UnknownEnum
{
    Value_78 = 78
}
