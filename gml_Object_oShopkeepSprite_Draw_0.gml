if (global.Shop == UnknownEnum.Value_3)
    draw_sprite(sShopkeepBG_RockstarFoxy, 0, 0, 0);

draw_sprite_tiled(BGSprite, global.Shop, DanceFrame, array_contains([UnknownEnum.Value_0, UnknownEnum.Value_1, UnknownEnum.Value_12], global.Shop) ? DanceFrame : 0);
draw_sprite(sShopkeepBG, global.Shop, 0, DanceOffset * -4);

if (global.Shop == UnknownEnum.Value_6)
    draw_sprite_ext(sBobbiedotsWheel, 0, 520, 156 + (DanceOffset * -4), 1, 1, DanceFrame, c_white, 1);

draw_sprite(sprite_index, Pose, ShopkeepX, ShopkeepY + (DanceOffset * 4));
draw_rectangle_color(0, 240, 640, 360, c_black, c_black, c_black, c_black, false);
var TargetX = instance_exists(oShopMenu) ? 512 : 320;
ShopkeepX += ((TargetX - ShopkeepX) / 5);
ShopkeepY += YSpeed;
YSpeed = lerp(YSpeed, (232 - ShopkeepY) * 0.25, 0.4);
var DanceTarget = floor((DanceFrame * (1/30) * (BPM / 120)) % 2);
DanceOffset += ((DanceTarget - DanceOffset) / 4);
DanceFrame++;

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_3 = 3,
    Value_6 = 6,
    Value_12 = 12
}
