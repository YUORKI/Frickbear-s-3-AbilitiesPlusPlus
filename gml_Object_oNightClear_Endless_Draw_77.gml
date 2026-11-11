initialize_ui_surface();
draw_sprite(global.Freezeframe, 0, 0, 0);
draw_rectangle_color(0, VerticalOffset, 640, 360 + VerticalOffset, c_black, c_black, c_black, c_black, false);
draw_sprite(s6AM, 1, 0, VerticalOffset);

if (Frame == round(61.800000000000004) || Frame == round(93.89999999999999) || Frame == round(126))
    squish();

if (Frame == round(126) && instance_exists(oEleanorChallengeIndicator))
{
    var NotifText = "";
    var Val = global.EleanorChallenge.Value;
    
    switch (global.EleanorChallenge.Reward)
    {
        case UnknownEnum.Value_3:
            earn_money(Val);
            NotifText = "+$" + string_format(Val, 1, 2);
            break;
        
        case UnknownEnum.Value_0:
            acquire_upgrade(Val);
            NotifText = get_upgrades(Val).Name + "\nget!";
            break;
        
        case UnknownEnum.Value_1:
            acquire_cartridge(Val);
            NotifText = get_shop_minigames(Val).Name + "\nget!";
            break;
        
        case UnknownEnum.Value_2:
            acquire_consumable(Val);
            NotifText = get_consumables(Val).Name + "\nget!";
            break;
    }
    
    with (instance_create_depth(oEleanorChallengeIndicator.x + 16, oEleanorChallengeIndicator.y, -1, oScorePopup))
    {
        TargetOffset = 32;
        CustomText = NotifText;
    }
    
    instance_destroy(oEleanorChallengeIndicator);
    audio_play_sound(sfxBitCollect, 10, false);
    
    if (global.EleanorChallenge.IsPlus)
        unlock_guard(UnknownEnum.Value_14);
    
    global.EleanorChallenge = undefined;
}

var NumPositions = [164, 239, 293];

for (var i = 0; i < array_length(Squish); i++)
{
    Squish[i] += SquishSpeed[i];
    SquishSpeed[i] = lerp(SquishSpeed[i], (1 - Squish[i]) * 0.25, 0.3);
    draw_sprite_ext(sRoundCompleteNumbers, Numbers[i], NumPositions[i] + 24, 200 + VerticalOffset, 1 / Squish[i], Squish[i], 0, c_white, 1);
}

if (Frame >= 210)
    Alpha += 0.016666666666666666;

if (Frame > 300)
{
    global.EndlessRound++;
    room_goto(DestinationRoom);
}

draw_set_alpha(Alpha);
draw_rectangle_color(0, VerticalOffset, 640, 360 + VerticalOffset, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
VerticalOffset *= 0.9;
Frame++;
surface_reset_target();

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_14 = 14
}
