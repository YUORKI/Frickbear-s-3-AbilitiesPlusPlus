CupcakePosition = 0;
Cooldown = 0;
SPRITE_Cupcake = skin_sprite(sCupcake, UnknownEnum.Value_8, ["sprite_01.png", "sprite_02.png", "sprite_03.png"]);
SOUND_Appear = skin_sound(sfxCartoonPop, UnknownEnum.Value_8, "sq_appear");
SOUND_Blink = skin_sound(sfxCupcakeBlink, UnknownEnum.Value_8, "sq_blink");
SOUND_Clicked = skin_sound(sfxMarioKick, UnknownEnum.Value_8, "sq_clicked");
PositionCoordinates = oWall.Data.ToyChica_CupcakePositions;
CupX = 0;
CupY = 0;

function set_position(arg0)
{
    CupcakePosition = arg0;
    CupX = PositionCoordinates[CupcakePosition - 1][0] + sprite_get_xoffset(sCupcake);
    CupY = PositionCoordinates[CupcakePosition - 1][1] + sprite_get_yoffset(sCupcake);
}

enum UnknownEnum
{
    Value_8 = 8
}
