if (PickACard && global.Timer >= 350.5)
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
        
        if (mouse_in_zone(CardX - 48, CardY - 64, 96, 128) && mouse_check_button_pressed(mb_left))
        {
            mouse_clear(mb_left);
            
            if (Cards[i].Correct)
            {
                with (oOrville_Animations)
                {
                    vanish();
                    block_tokens();
                }
                
                CardDisappear = true;
                CardFlip = 0;
                CardOffsetSpeeds = array_create(6, -16);
                audio_play_sound(sfxSparkleImpact, 25, false);
                
                if (audio_is_playing(Voiceline))
                    audio_stop_sound(Voiceline);
                
                Voiceline = reverb_sound(choose(voc_Orville_Correct, voc_Orville_FantasticWork, voc_Orville_Fiddlesticks, voc_Orville_GoodJob, voc_Orville_HowDoYouDoIt), 0, 400, false, 1.2, 1, 0.1);
            }
            else
            {
                jumpscare(UnknownEnum.Value_62);
            }
        }
    }
}

enum UnknownEnum
{
    Value_62 = 62
}
