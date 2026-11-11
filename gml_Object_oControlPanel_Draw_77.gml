if (!global.PanelUp && TabletUp)
{
    TabletUp = false;
    audio_play_sound(sfxControlPanel_Close, 3, false, 0.5);
}

var WindowX = 120;
var WindowY = (360 + TabletOffset) - 330;

if (!surface_exists(ControlPanelSurf))
    ControlPanelSurf = surface_create(400, 300);

surface_set_target(ControlPanelSurf);
draw_clear_alpha(c_white, 1);
draw_sprite_tiled(sControlPanel_GridTiles, 0, Frame, Frame);
draw_sprite(sControlPanel_Header, 0, 0, 0);
draw_set_halign(fa_left);

if (instance_exists(oScraptrap))
{
    var ButtX = 8;
    var ButtY = 32;
    draw_set_font(global.FontW97White);
    var Tasks = oScraptrap.Tasks;
    
    for (var i = 0; i < array_length(Tasks); i++)
    {
        ButtY = Tasks[i].Offset + 32;
        draw_set_alpha(0.8);
        
        if (mouse_in_zone(ButtX + WindowX, ButtY + WindowY, 176, 23))
            draw_set_alpha(1);
        
        if (TaskRunning != -1 && i != TaskRunning)
        {
            draw_set_alpha(0.25);
        }
        else if (i == TaskRunning)
        {
            draw_set_alpha(1);
            draw_pie(ButtX + 165, ButtY + 11, TaskProgress, 100, 16777215, 8, 1);
            var TaskDuration = 0;
            TaskProgress += (100 / (60 * Tasks[i].Duration));
            
            if (TaskProgress >= 100)
            {
                TaskRunning = -1;
                array_delete(oScraptrap.Tasks, i, 1);
                audio_play_sound(sfxControlPanel_TaskDone, 40, false);
                block_tokens();
                TaskProgress = 0;
                continue;
            }
        }
        
        if (i != TaskRunning)
        {
            for (var s = 0; s < Tasks[i].Rank; s++)
                draw_sprite(sControlPanel_TaskButtonStar, 0, (ButtX + 173) - (s * 6), ButtY + 20);
        }
        
        draw_sprite(sControlPanel_TaskButton, 0, ButtX, ButtY);
        draw_text(ButtX + 6, ButtY + 2, Tasks[i].Title);
        
        if (clicked(ButtX + WindowX, ButtY + WindowY, 176, 23) && TaskRunning == -1 && TabletUp)
        {
            TaskRunning = i;
            audio_play_sound(sfxControlPanel_Select, 2, false);
            oScraptrap.TimeToKill -= Tasks[i].Duration;
        }
        
        Tasks[i].Offset += ((i * 27) - Tasks[i].Offset) / 5;
    }
    
    draw_set_alpha(1);
}

surface_reset_target();
set_target_to_ui();
draw_surface(ControlPanelSurf, WindowX, WindowY);
draw_sprite(sControlPanel_Border, 0, 320, 360 + TabletOffset);
surface_reset_target();
TabletOffsetSpeed = lerp(TabletOffsetSpeed, ((TabletUp ? 0 : 360) - TabletOffset) * 0.25, TabletUp ? 0.35 : 1);
TabletOffset += TabletOffsetSpeed;
Frame++;

if (TabletUp && mouse_check_button_pressed(mb_left) && !clicked(WindowX, WindowY, 400, 300) && TabletOffset < 64)
{
    TabletUp = false;
    global.PanelUp = false;
    mouse_clear(mb_left);
    audio_play_sound(sfxControlPanel_Close, 3, false, 0.5);
}
