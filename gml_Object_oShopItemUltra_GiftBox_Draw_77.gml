set_target_to_ui();
image_index = UnknownEnum.Value_7;
var MaxTimer = 30;

if (Hovered && !Active)
{
    draw_outline(16777215);
    
    if (mouse_check_button_pressed(mb_left))
    {
        global.JumpscareImmunity = true;
        Active = true;
        audio_play_sound(sfxClick, 10, false);
        Timer = MaxTimer;
        deplete_uses();
    }
}

draw_sprite(sprite_index, image_index, x, y);

if (Active)
{
    shader_set(shFlash);
    draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_black, 0.5);
    draw_sprite_part_ext(sprite_index, image_index, 0, 0, 32, 32 - (32 * (Timer / MaxTimer)), x, y, 1, 1, c_black, 1);
    shader_reset();
    global.Temperature = max(global.Temperature - 1, oCamera.MinTemperature);
    Timer -= TickdownRate;
    
    if (Timer <= 0)
    {
        Active = false;
        global.JumpscareImmunity = false;
    }
}

draw_lives();
surface_reset_target();

enum UnknownEnum
{
    Value_7 = 7
}
