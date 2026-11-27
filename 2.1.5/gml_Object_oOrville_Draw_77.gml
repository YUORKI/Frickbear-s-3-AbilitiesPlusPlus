var ID = UnknownEnum.Value_62;
var AI = global.AILevels[ID];
depth = -100;
set_target_to_ui();

if (!PickACard)
{
    var CardX = 584 + CardOffset;
    var CardY = 262;
    draw_sprite(sOrville_Cards, (CardSuit * 10) + CardRank, CardX, CardY);
    draw_sprite(sOrville_Remember, 0, CardX, CardY - (84 + ((floor(Frame * 4) % 2) * 2)));
    CardOffset += CardOffsetSpeed;
    CardOffsetSpeed = lerp(CardOffsetSpeed, (OffsetTarget - CardOffset) * 0.25, 0.3);
    
    if (Frame == 0)
    {
        OffsetTarget = 0;
        CardOffsetSpeed = -16;
        audio_play_sound(sfxSwoosh, 4, false);
    }
    
    if (Frame >= lerp(3, 2, AI / 20) && OffsetTarget == 0)
    {
        OffsetTarget = 128;
        CardOffsetSpeed = -8;
        audio_play_sound(sfxSwoosh, 4, false, 1, 0, 1.5);
    }
    
    if (global.Timer >= 350 && AI > 0)
    {
        PickACard = true;
        Frame = 0;
        instance_create_depth(0, 0, 0, oOrville_Animations);
        
        repeat (6 - round(lerp(2, 6, AI / 20)))
            array_delete(Cards, array_length(Cards) - 1, 1);
        
        Voiceline = reverb_sound(choose(voc_Orville_PickACard, voc_Orville_AddressTheElephant, voc_Orville_IsThisYourCard1, voc_Orville_IsThisYourCard2, voc_Orville_ForMyNextTrick, voc_Orville_NeverForgets), 0, 400, false, 1.2, 1, 0.1);
        Cards = array_shuffle(Cards);
    }
}
else
{
    var AnchorX = 320;
    var AnchorY = 262;
    var CardAmount = array_length(Cards);
    
    for (var i = 0; i < CardAmount; i++)
    {
        var CardXOffset = i - ((CardAmount - 1) / 2);
        var CardX = AnchorX + (CardXOffset * 100);
        var CardY = AnchorY + CardOffsets[i] + (dsin((Frame * 60) + (i * 20)) * 16);
        var CardSpin = dcos(CardFlip);
        var CardImg = (CardSpin < 0) ? 40 : ((Cards[i].Suit * 10) + Cards[i].Rank);
        
        if (mouse_in_zone(CardX - 48, CardY - 64, 96, 128))
        {
            shader_set(shFlash);
            
            for (var o = -45; o < 360; o += 45)
                draw_sprite_ext(sOrville_Cards, CardImg, CardX + round(lengthdir_x(2, o)), CardY + round(lengthdir_y(2, o)), CardSpin, 1, 0, c_white, 1);
            
            shader_reset();
        }
        
        draw_sprite_ext(sOrville_Cards, CardImg, CardX, CardY, CardSpin, 1, 0, c_white, 1);
        CardOffsets[i] += CardOffsetSpeeds[i];
        CardOffsetSpeeds[i] = lerp(CardOffsetSpeeds[i], ((CardDisappear ? 180 : 0) - CardOffsets[i]) * 0.25, 0.3);
    }
    
    CardFlip += ((1440 - CardFlip) / 10);
}

surface_reset_target();

if (AI > 0)
    Frame += 0.016666666666666666;

enum UnknownEnum
{
    Value_62 = 62
}
