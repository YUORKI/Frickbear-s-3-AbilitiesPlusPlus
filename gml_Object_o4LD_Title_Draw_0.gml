var StartFrame = 3.5;
var EndFrame = 5.5;
var TimeToBottom = 180 / (EndFrame - StartFrame);
TowerPosition += ((((Frame >= EndFrame) ? 0 : ((Frame >= StartFrame) ? sign_to_binary(dcos((Frame - StartFrame) * TimeToBottom)) : 1)) - TowerPosition) / lerp(15, 30, TowerPosition));
TowerPosition = clamp(TowerPosition, 0, 1);

if (input_check_pressed(UnknownEnum.Value_0) && Frame >= -0.4 && Frame < TitleAppearFrame && CanSkip)
{
    Frame = TitleAppearFrame + 1.4;
    input_clear(UnknownEnum.Value_0);
}

var BGLighting = 1 - TowerPosition;
draw_tower(TowerPosition, Frame * 60, 320, true, make_color_rgb(255 * MoonLighting, 255 * MoonLighting, 255 * MoonLighting), make_color_rgb(255 * TowerLighting, 255 * TowerLighting, 255 * TowerLighting), make_color_rgb(255 * BGLighting, 255 * BGLighting, 255 * BGLighting));
draw_sprite(s4LD_GuardSilhouettes, 0, 320, lerp(360, 2000, TowerPosition) + (DanceOffset * 8));
draw_sprite(s4LD_GuardSilhouettes, 1, 320, lerp(360, 1900, TowerPosition) + ((1 - DanceOffset) * 8));
draw_set_alpha(TitleAlpha * 0.75);
draw_rectangle_color(0, 0, 640, 360, c_black, c_black, c_black, c_black, false);
var TitleSize = 1 + (SizeDiff / 25);
draw_sprite_ext(s4LD_Logo, 1, 190, 180 - TitleFlyY, TitleSize, TitleSize, 0, c_white, TitleAlpha);
draw_set_alpha(1);

if (instance_exists(oTitleMenu))
    BackingX += ((384 - BackingX) / 5);

draw_sprite(s4LD_MenuBacking, 0, BackingX, -64 + ((Frame * 60) % 64));
draw_sprite(s4LD_MenuBacking, 0, BackingX, -64 + ((Frame * 60) % 64) + 320);
check_reset();
TitleBrightness = max(TitleBrightness - 0.016666666666666666, 0);
initialize_ui_surface();
surface_reset_target();
var DanceFrame = (Frame * 60) + 8;
var DanceTarget = floor((DanceFrame * (1/30) * 0.75) % 2);
DanceOffset += ((DanceTarget - DanceOffset) / 4);
SizeDiff = abs(DanceTarget - DanceOffset);
show_debug_message($"DanceOffset: {DanceOffset}");

enum UnknownEnum
{
    Value_0
}
