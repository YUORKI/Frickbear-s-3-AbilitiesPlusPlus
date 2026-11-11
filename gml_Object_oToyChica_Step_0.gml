var ID = UnknownEnum.Value_8;
var AI = global.AILevels[ID];

if (global.CamUp && CupcakePosition == 0)
{
    set_position(irandom_range(1, 5));
    
    if (character_active(UnknownEnum.Value_24))
    {
        while ((oNightmarionne.Side == -1 && CupX < 512) && CupcakePosition != 3)
            set_position(irandom_range(1, 5));
        
        while ((oNightmarionne.Side == 1 && CupX > 1024) && CupcakePosition != 3)
            set_position(irandom_range(1, 5));
    }
    
    if (character_active(UnknownEnum.Value_32))
    {
        while ((oMrHippo.Mode == "Office" && CupX > 768) && CupcakePosition != 3)
            set_position(irandom_range(1, 5));
    }
    
    if (character_active(UnknownEnum.Value_82))
    {
        while (CupX < 256 && CupcakePosition != 3)
            set_position(irandom_range(1, 5));
    }
    
    if (AI <= 5)
        CupcakePosition = 3;
    else if (AI <= 10)
        CupcakePosition = clamp(CupcakePosition, 2, 4);
}

if (!global.CamUp && CupcakePosition != 0)
{
    if (!instance_exists(oCupcake) && irandom_range(1, 20) <= AI && Cooldown == 0)
    {
        with (instance_create_layer((CupX + 1088) - 512, CupY + 448, "InFrontOf_Wall", oCupcake))
        {
            sprite_index = other.SPRITE_Cupcake;
            simple_sound(other.SOUND_Appear, 0, 0, false, 0.75);
            SOUND_Blink = other.SOUND_Blink;
            SOUND_Clicked = other.SOUND_Clicked;
        }
        
        Cooldown = 15;
    }
    
    CupcakePosition = 0;
}

Cooldown = max(Cooldown - 0.016666666666666666, 0);

enum UnknownEnum
{
    Value_8 = 8,
    Value_24 = 24,
    Value_32 = 32,
    Value_82 = 82
}
