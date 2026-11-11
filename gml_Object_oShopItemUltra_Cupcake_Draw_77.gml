set_target_to_ui();
draw_set_font(global.FontW97Black);
image_index = UnknownEnum.Value_3;
var Mousey = false;

if (Hovered)
{
    Mousey = true;
    draw_outline(16777215);
    
    if (mouse_check_button_pressed(mb_left))
    {
        Active = true;
        audio_play_sound(sfxClick, 10, false);
        audio_play_sound(sfxBitCollect, 10, false);
        global.Tokens += floor(Uses);
        Uses = -999;
    }
}

draw_sprite(sprite_index, image_index, x, y);

if (Mousey)
{
    draw_set_halign(fa_left);
    draw_sprite(sCamButtonWide, 0, global.MouseX, global.MouseY);
    draw_text(global.MouseX + 5, global.MouseY + 1, "VALUE: " + string(floor(Uses)) + " Tokens");
}

Uses += 0.0016666666666666668;
surface_reset_target();

enum UnknownEnum
{
    Value_3 = 3
}
