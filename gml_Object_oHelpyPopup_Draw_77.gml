set_target_to_ui();
draw_sprite(SPRITE_Window, 0, x, y);
draw_sprite(SPRITE_Popups, Ad, x + 6, y + 26);
var HelpyImage = 0;

switch (HelpyAnimation)
{
    case 0:
    case 1:
        HelpyImage = (floor(HelpyFrame / 30) % 2) + (HelpyAnimation * 2);
        HelpyFrame %= 60;
        break;
}

draw_sprite(SPRITE_Helpy, HelpyImage, x - 16, (y + sprite_get_height(SPRITE_Window)) - 32);
surface_reset_target();
HelpyFrame++;
