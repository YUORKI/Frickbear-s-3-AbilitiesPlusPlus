var ID = UnknownEnum.Value_59;
var AI = global.AILevels[ID];
var WindowX = 120;
var WindowY = (360 + TabletOffset) - 308;
var TotalKillTimer = lerp(30, 13, AI / 20);

if (AI == 21)
    TotalKillTimer = 10;

if (!surface_exists(FrogSurf))
    FrogSurf = surface_create(400, 300);

surface_set_target(FrogSurf);
draw_clear_alpha(c_white, 0);
draw_sprite_tiled(SPRITE_Tiles, 0, Frame, Frame);
draw_set_font(global.FontHanddrawn);
draw_sprite(SPRITE_Background, 0, 0, 0);
var FrogImage = floor(Frame / 30) % 2;

if (Problem == "CORRECT!")
    FrogImage += 5;
else if (KillTimer <= (TotalKillTimer * 0.5) && Pose < 1)
    change_pose(1);
else if (KillTimer <= (TotalKillTimer * 0.25) && Pose < 2)
    change_pose(2);
else if (KillTimer <= (TotalKillTimer * 0.1) && Pose < 3)
    change_pose(3);

if (Pose > 0)
    FrogImage = Pose + 1;

var FrogOffset = (Pose == 3) * round(random_range(-1, 1));
draw_sprite_ext(SPRITE_HappyFrog, FrogImage, 99 + FrogOffset, 300, 1 / FrogSquish, FrogSquish, 0, c_white, 1);
draw_set_halign(fa_center);
draw_text_color(99, 18, Problem, c_black, c_black, c_black, c_black, 1);
draw_set_halign(fa_right);
draw_text_color(379, 256, AnswerString, c_black, c_black, c_black, c_black, 1);

for (var i = 0; i < array_length(ButtonValues); i++)
{
    var ButtX = 214 + (56 * (i % 3));
    var ButtY = 12 + (56 * floor(i / 3)) + ButtonOffset[i];
    draw_sprite(SPRITE_Buttons, i, ButtX, ButtY);
    
    if (clicked(ButtX + 6 + WindowX, ButtY + 6 + WindowY, (i == 10) ? 100 : 50, 50) && Problem != "CORRECT!" && TabletUp)
    {
        ButtonOffset[i] = 8;
        
        if (i == 10)
        {
            if (AnswerString == string(Solution))
            {
                bitcrush_sound(choose_from_array(SOUND_Solved));
                audio_play_sound(SOUND_Correct, 20, false);
                Problem = "CORRECT!";
                TabletOffsetSpeed = 32;
                oHappyFrogTablet.Active = false;
                
                if (AI != 21)
                    audio_stop_sound(SOUND_Music);
                
                block_tokens();
                KillTimer = 999;
                reset_timer(AI);
            }
            else
            {
                audio_play_sound(SOUND_Error, 20, false);
                TabletOffsetSpeed = 8;
                KillTimer -= 2;
                
                if (Pose < 3)
                    change_pose(Pose + 1);
            }
            
            AnswerString = "";
        }
        else
        {
            audio_play_sound(SOUND_Select, 20, false);
            AnswerString += ButtonValues[i];
        }
    }
    
    ButtonOffset[i] *= 0.8;
}

surface_reset_target();
set_target_to_ui();

if (TabletUp && mouse_check_button_pressed(mb_left) && !clicked(WindowX, WindowY, 400, 300) && TabletOffset < 64)
{
    TabletUp = false;
    global.PanelUp = false;
    mouse_clear(mb_left);
}

draw_surface(FrogSurf, WindowX, WindowY);
draw_sprite(SPRITE_Border, 0, 320, 360 + TabletOffset);
draw_sprite_ext(SPRITE_Border, 0, 320, 360 + TabletOffset, 1, -1, 0, c_white, 1);
surface_reset_target();
TabletOffsetSpeed = lerp(TabletOffsetSpeed, ((TabletUp ? 4 : 360) - TabletOffset) * 0.25, TabletUp ? 0.35 : 1);
TabletOffset += TabletOffsetSpeed;
Frame++;

if (TimeToActivate > 0 && AI > 0)
{
    TimeToActivate -= 0.016666666666666666;
    
    if (TimeToActivate <= 0)
    {
        initialize_problem();
        audio_play_sound(SOUND_Music, 30, true, 0.75);
        
        with (oHappyFrogTablet)
            Active = true;
        
        KillTimer = TotalKillTimer;
    }
}

if (AI > 0)
    oHappyFrogTablet.sprite_index = SPRITE_Tablet;

if (!global.PanelUp && TabletUp)
    TabletUp = false;

if (KillTimer <= 0)
    jumpscare(UnknownEnum.Value_59);

FrogSquish += FrogSquishSpeed;
FrogSquishSpeed = lerp(FrogSquishSpeed, (1 - FrogSquish) * 0.5, 0.5);

enum UnknownEnum
{
    Value_59 = 59
}
