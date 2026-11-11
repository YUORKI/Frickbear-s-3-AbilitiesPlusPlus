set_target_to_ui();
draw_set_font(global.FontW97Black);
image_index = 10;
var Mousey = !Active && Hovered;

if (Mousey)
{
    draw_outline(16777215);
    
    if (mouse_check_button_pressed(mb_left))
    {
        audio_play_sound(sfxClick, 10, false);
        audio_play_sound(sfxBitCollect, 10, false);
        global.Tokens += floor(Value);
        
        if (Value >= (OriginalValue + 40))
            get_trophy(UnknownEnum.Value_18);
        
        instance_destroy();
    }
}

draw_sprite(sprite_index, image_index, x, y);

if (Mousey)
{
    draw_set_halign(fa_left);
    draw_sprite(sCamButtonWide, 0, global.MouseX, global.MouseY);
    draw_text(global.MouseX + 5, global.MouseY + 1, "VALUE: " + string(floor(Value)) + " Tokens");
}

Value += (lerp(1, global.NightSpeedup, 0.5) / 10 / 60);
surface_reset_target();

enum UnknownEnum
{
    Value_18 = 18
}
