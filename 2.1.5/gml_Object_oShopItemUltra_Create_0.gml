event_inherited();
Uses = 1;
InitialUses = 1;

function deplete_uses()
{
    Uses--;
    global.EndlessInventory.Consumables[InvPosition].Uses--;
}

function draw_lives()
{
    if (Uses > 4)
    {
        var Tens = floor(Uses / 10);
        var Ones = Uses % 10;
        
        if (Tens > 0)
            draw_sprite(sConsumableLife_Numbered, Tens, x + 26, y + 32);
        
        draw_sprite(sConsumableLife_Numbered, Ones, x + 32, y + 32);
        draw_sprite(sConsumableLife_Numbered, 10, (x + 32) - ((Tens > 0) ? 12 : 6), y + 32);
    }
    else
    {
        for (var l = 0; l < (Uses - 1); l++)
            draw_sprite(sConsumableLife, 0, (x + 32) - (l * 6), y + 32);
    }
}

Timer = 60;
