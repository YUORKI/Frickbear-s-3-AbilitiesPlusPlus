var PanStart = 60;
var PanEnd = 180;
var GuardPos = clamp((Frame - PanStart) / (PanEnd - PanStart), 0, 1);
GuardPos = sign_to_binary(dcos(GuardPos * 180) * -1);
var GuardOffset = lerp(0, 120, GuardPos);
var AngelOffset = lerp(-32, 0, GuardPos);
var Color = 16777215;

switch (floor(Frame / 45))
{
    default:
        Color = 255;
        break;
    
    case 1:
        Color = 65535;
        break;
    
    case 2:
        Color = 65280;
        break;
    
    case 3:
        Color = 16776960;
        break;
    
    case 4:
        Color = 16711680;
        break;
    
    case 5:
        Color = 16711935;
        break;
}

draw_rectangle_color(-1, -1, 640, 360, Color, Color, Color, Color, false);
draw_sprite(s4LDAngel, AngelFrame, 0, AngelOffset);
draw_sprite(Silhouette, global.Guard, 272, 112 + GuardOffset);
draw_sprite(s4LDAngel_Staircase, 0, 320, 360 + GuardOffset);
draw_rectangle_color(-1, -1, lerp(-1, 320, OpeningTransition), 360, c_black, c_black, c_black, c_black, false);
draw_rectangle_color(641, -1, lerp(641, 320, OpeningTransition), 360, c_black, c_black, c_black, c_black, false);

if (InDarkness)
    draw_rectangle_color(-1, -1, 640, 360, c_black, c_black, c_black, c_black, false);

if (AngelFrame >= 48)
{
    ExitFrames++;
    
    if (ExitFrames >= 60)
    {
        audio_stop_all();
        show_debug_message($"T: {Frame / 60}");
        
        if (!InDarkness)
        {
            if (global.Guard == UnknownEnum.Value_20)
            {
                instance_create_depth(0, 0, depth, o4LD_AngelCutsceneFollowup);
                instance_destroy();
            }
            else
            {
                alarm[0] = 120;
            }
        }
        
        InDarkness = true;
    }
}
else if (Frame > (PanEnd + 60))
{
    AngelFrame += 0.2;
    
    if (AngelFrame > 41)
        AngelFrame += 0.2;
    
    if (AngelFrame > 39)
        AngelFrame -= 0.16666666666666666;
}

AngelFrame = clamp(AngelFrame, 0, 48);

if (Frame == 0)
    audio_play_sound(sfxAngelReveal, 10, false);

if (Frame == -360)
    audio_play_sound(sfxAngelFootsteps, 10, false);

Frame++;

if (Frame >= 0)
    OpeningTransition -= (OpeningTransition / 15);

check_reset();

enum UnknownEnum
{
    Value_20 = 20
}
