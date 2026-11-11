if (global.AILevels[UnknownEnum.Value_72] <= 0)
    exit;

depth = -5;
set_target_to_ui();
draw_sprite_ext(sVIP, image_index, x, y, 1, 1, image_angle, c_white, 1);
surface_reset_target();
var BoxWidth = 100;

if (!surface_exists(PigSurf))
    PigSurf = surface_create(BoxWidth, 22);

surface_set_target(PigSurf);
draw_clear_alpha(c_white, 0);
draw_sprite_tiled(sVIP_ScrollingBG, 0, floor(LoopFrame), floor(LoopFrame));
LoopFrame += 0.25;
draw_rectangle_color(1, 1, BoxWidth - 2, 20, c_white, c_white, c_white, c_white, true);
surface_reset_target();
set_target_to_ui();
draw_set_font(global.FontW97White);
draw_set_halign(fa_left);
draw_surface(PigSurf, 638 - BoxWidth, 2 + oCamera.TokenBoxOffset);
draw_text_color(644 - BoxWidth, 3 + oCamera.TokenBoxOffset, "Tokens: ", c_white, c_white, c_white, c_white, 1);
draw_set_halign(fa_right);
draw_text_color(632, 3 + oCamera.TokenBoxOffset, string(floor(global.Tokens)) + " / " + string(floor(VisualTokenQuota)), c_white, c_white, c_white, c_white, 1);
surface_reset_target();

enum UnknownEnum
{
    Value_72 = 72
}
