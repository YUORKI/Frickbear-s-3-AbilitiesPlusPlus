draw_rectangle_color(0, 0, 640, 360, c_black, c_black, c_black, c_black, false);
BGFrame += (1/30);
FadeAlpha += (binary_to_sign(FadingOut) / 180);
FadeAlpha = max(0, FadeAlpha);
var Frame = BGFrame % 4;

if (!surface_exists(Surf))
    Surf = surface_create(160, 96);

surface_set_target(Surf);
draw_clear_alpha(c_black, 1);
var OffsetFrame = 0;
draw_sprite(s4LDEnding_BG, floor(Frame), 0 - OffsetFrame, 0);
draw_sprite(s4LDEnding_BG, floor(Frame), 160 - OffsetFrame, 0);

if (global.Guard != UnknownEnum.Value_20)
    draw_sprite(GuardSprite, global.Guard * 4, 64, 70);

draw_sprite(s4LDEnding_Boat, floor(Frame), 40, 56);
draw_sprite(s4LDEnding_Water, 0, 160 - (Frame * 8), 80);
draw_sprite(s4LDEnding_Water, 0, 0 - (Frame * 8), 80);
draw_sprite(s4LDEnding_Water, 1, 160 - (Frame * 8), 80);
draw_sprite(s4LDEnding_Water, 1, 0 - (Frame * 8), 80);
surface_reset_target();
draw_self();
draw_surface_ext(Surf, x, y, 2, 2, 0, c_white, 1);
draw_set_alpha(FadeAlpha);
draw_rectangle_color(0, 0, 640, 360, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

enum UnknownEnum
{
    Value_20 = 20
}
