if (AI <= 0)
    exit;

if (Mode == "Hallway" || Mode == "Attacking")
{
    draw_on_cam(UnknownEnum.Value_4 + sign_to_binary(Side), function()
    {
        var Image = 1 + Side;
        
        if (Side != ActualSide)
            Image++;
        
        draw_sprite(SPRITE_Cameras, Image, 0, 0);
    });
}

enum UnknownEnum
{
    Value_4 = 4
}
