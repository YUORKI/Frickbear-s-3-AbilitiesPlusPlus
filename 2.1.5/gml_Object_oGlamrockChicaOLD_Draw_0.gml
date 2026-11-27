var ID = UnknownEnum.Value_69;
var AI = global.AILevels[ID];
HeatMax = lerp(0.95, 0.65, AI / 20);
HeatMin = lerp(0.25, 0.35, AI / 20);
var InZone = PizzaMeter > HeatMin && PizzaMeter < HeatMax;

if (AI > 0 && global.Cam == UnknownEnum.Value_2)
{
    depth = 25;
    draw_sprite(sGlamrockChica, 0, 880, 32);
    draw_sprite(sGlamrockChica, 1, 880, 32);
}

if (Heating)
    PizzaMeter = min(PizzaMeter + 0.0020833333333333333, 1);
else if (AI > 0)
    PizzaMeter = max(PizzaMeter - (1 / (60 * lerp(120, 90, AI / 20))), 0);

if (PizzaMeter == 0)
    jumpscare(ID);

enum UnknownEnum
{
    Value_2 = 2,
    Value_69 = 69
}
