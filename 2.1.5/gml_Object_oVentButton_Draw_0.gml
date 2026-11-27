if (global.AudioLureX == ButtonID[0] && global.AudioLureY == ButtonID[1])
    image_index = SecondLureAvailable ? 2 : 1;
else if (global.AudioLureAltX == ButtonID[0] && global.AudioLureAltY == ButtonID[1])
    image_index = 3;
else
    image_index = 0;

draw_self();
draw_salvage_wires();

if (global.AILevels[UnknownEnum.Value_14] > 0 && instance_exists(oBB))
    PositionTest(UnknownEnum.Value_14, 0);

if (global.AILevels[UnknownEnum.Value_15] > 0 && instance_exists(oJJ))
    PositionTest(UnknownEnum.Value_15, 1);

if (global.AILevels[UnknownEnum.Value_7] > 0 && instance_exists(oToyBonnie))
    PositionTest(UnknownEnum.Value_7, 2);

if (global.AILevels[UnknownEnum.Value_12] > 0 && instance_exists(oWitheredChica))
    PositionTest(UnknownEnum.Value_12, 3);

if (global.AILevels[UnknownEnum.Value_33] > 0 && instance_exists(oLefty))
    PositionTest(UnknownEnum.Value_33, 4);

if (global.AILevels[UnknownEnum.Value_32] > 0 && instance_exists(oMrHippo))
    PositionTest(UnknownEnum.Value_32, 5);

if (global.AILevels[UnknownEnum.Value_61] > 0 && instance_exists(oNeddBear))
    PositionTest(UnknownEnum.Value_61, 6);

if (global.AILevels[UnknownEnum.Value_60] > 0 && instance_exists(oPigpatch))
    PositionTest(UnknownEnum.Value_60, 7);

enum UnknownEnum
{
    Value_7 = 7,
    Value_12 = 12,
    Value_14 = 14,
    Value_15,
    Value_32 = 32,
    Value_33,
    Value_60 = 60,
    Value_61
}
