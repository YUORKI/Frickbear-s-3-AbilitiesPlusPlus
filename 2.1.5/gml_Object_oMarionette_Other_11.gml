if (character_active(ID))
{
    draw_on_cam(UnknownEnum.Value_6, function()
    {
        depth = 10;
        draw_sprite(SPRITE_Cameras, MusicTimer <= 10, 0, 0);
    });
}

enum UnknownEnum
{
    Value_6 = 6
}
