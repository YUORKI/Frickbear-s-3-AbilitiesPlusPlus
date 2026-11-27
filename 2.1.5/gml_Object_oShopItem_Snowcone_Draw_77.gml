set_target_to_ui();
image_index = 1;

if (Hovered && !Active)
{
    draw_outline(16777215);
    
    if (mouse_check_button_pressed(mb_left))
    {
        Active = true;
        Value = 0;
        check_for_trophy();
        audio_play_sound(sfxClick, 10, false);
    }
}
else if (Active)
{
    draw_outline(16777215);
}

draw_sprite(sprite_index, 1, x, y);

if (Active)
{
    shader_set(shFlash);
    draw_sprite_ext(sprite_index, 1, x, y, 1, 1, 0, c_black, 0.5);
    draw_sprite_part_ext(sprite_index, image_index, 0, 0, 32, 32 - (32 * (Timer / 60)), x, y, 1, 1, c_black, 1);
    shader_reset();
    global.Temperature = max(global.Temperature - 1, oCamera.MinTemperature);
    Timer -= TickdownRate;
    
    if (Timer <= 0)
        instance_destroy();
}

surface_reset_target();
