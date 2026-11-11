if (BidybabsLeft > 0)
{
    draw_on_cam(UnknownEnum.Value_7, function()
    {
        var TenDigit = floor(BidybabsLeft / 10);
        var OneDigit = floor(BidybabsLeft) % 10;
        draw_sprite(SPRITE_Counter, 0, 378, 66);
        
        if (BidybabsLeft >= 10)
            draw_sprite(SPRITE_Counter, TenDigit, 378, 66);
        
        draw_sprite(SPRITE_Counter, OneDigit + 3, 378, 66);
        draw_sprite(SPRITE_Baby, 0, 0, 0);
    });
    
    with (oBidybab)
        event_user(1);
}

enum UnknownEnum
{
    Value_7 = 7
}
