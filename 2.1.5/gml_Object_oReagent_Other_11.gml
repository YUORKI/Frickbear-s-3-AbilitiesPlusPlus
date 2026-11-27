if (!character_active(ID) || VanishTimer > 0)
    exit;

if (!InHallway)
{
    draw_on_cam(UnknownEnum.Value_2, function()
    {
        draw_sprite(SPRITE_Cameras, 1 + Side, 0, 0);
    });
}
else
{
    draw_on_cam(UnknownEnum.Value_4 + sign_to_binary(Side), function()
    {
        draw_sprite(SPRITE_Cameras, 3 + sign_to_binary(Side), 0, 0);
    });
}

enum UnknownEnum
{
    Value_2 = 2,
    Value_4 = 4
}
