global.PrevMouseX = global.MouseX;
global.PrevMouseY = global.MouseY;
global.MouseX = device_mouse_x_to_gui(0);
global.MouseY = device_mouse_y_to_gui(0);

if (UpsideDownTest && room == Office && instance_exists(oCamera))
{
    global.MouseX = rot_x(global.MouseX - 320, global.MouseY - 180, oCamera.ScreenAngle) + 320;
    global.MouseY = rot_y(global.MouseX - 320, global.MouseY - 180, oCamera.ScreenAngle) + 180;
}

global.Playtime += 0.016666666666666666;
global.RunTime += 0.016666666666666666;
Timer++;
GlobalTimer += 0.016666666666666666;
instance_activate_object(oDiscordTracker);
draw_set_font(global.FontW97Black);
draw_set_halign(fa_left);
draw_set_halign(fa_left);
