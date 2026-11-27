if (floor((Timer % 1) * 8) < 1 && global.MonitorSystem == "Vents")
{
    draw_rectangle_color(x + 2, y + 2, x + 45, y + 45, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
    draw_sprite(global.IconTiles[UnknownEnum.Value_89], 1, x, y);
}

enum UnknownEnum
{
    Value_89 = 89
}
