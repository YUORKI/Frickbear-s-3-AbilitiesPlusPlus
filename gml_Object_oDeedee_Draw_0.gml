if (!Active && !DeedeeClicked)
    exit;

if (!surface_exists(DeedeeSurf))
    DeedeeSurf = surface_create(330, 295);

surface_set_target(DeedeeSurf);
draw_clear_alpha(c_black, 0);
draw_sprite_ext(SPRITE_Background, floor(WaitTime * 2) % 2, 165 + BGXOffset, 147 + BGYOffset, 1, 1, BGAngle, c_white, 1);
var OffsetAngle = random(360);
var ShakeX = lengthdir_x(Shake, OffsetAngle);
var ShakeY = lengthdir_y(Shake, OffsetAngle);
var DeedeeImage = floor(WaitTime * 4) % 4;

if (HP == 0)
    DeedeeImage = 8;
else if (DeedeeClicked || Shake > 1)
    DeedeeImage = 4 + DeedeeHitSprite;

draw_sprite_ext(SPRITE_Deedee, DeedeeImage, 230 + ShakeX, 134 + DeedeeYOffset + ShakeY, 1, 1, DeedeeAngle, c_white, 1);
surface_reset_target();

if (global.MonitorSystem == "Shop")
{
    if (instance_exists(oMendo))
        depth = oMendo.depth - 1;
    
    shader_set(TransparencyShader);
    draw_surface(DeedeeSurf, oCameraUI.x + 301, oCameraUI.y + 28);
    shader_reset();
}
