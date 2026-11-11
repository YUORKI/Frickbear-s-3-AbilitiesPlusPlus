initialize_ui_surface();
draw_set_halign(fa_center);
draw_set_font(global.FontW97Black);
var TargettingShop = abs(CamRotationH) > 45 && !AngelMode;
var TargettedShop = PickedShops[sign_to_binary(sign(CamRotationH))];

if (ThirdShopAvailable && !TargettingShop && abs(CamRotationH) < 45)
{
    TargettingShop = true;
    TargettedShop = PickedShops[2];
}

var Text = AngelMode ? "THE ANGEL'S SANCTUM\nEscape." : get_shop_desc(TargettedShop);

if (!DoorwayFreeze)
{
    if (!TargettingShop)
    {
        global.Shop = -1;
    }
    else if (TargettedShop != global.Shop)
    {
        global.Shop = TargettedShop;
        audio_play_sound(sfxControlPanel_TaskDone, 10, false);
    }
}

TextOffset += (((TargettingShop ? 0 : 50) - TextOffset) / 5);

for (var FontDirection = 0; FontDirection < 360; FontDirection += 15)
{
    for (var FontBold = 1; FontBold <= 3; FontBold++)
        draw_text_ext(320 + round(lengthdir_x(FontBold, FontDirection)), 314 + TextOffset + round(lengthdir_y(FontBold, FontDirection)), Text, 15, 400);
}

draw_set_font(global.FontW97White);
draw_text_ext(320, 314 + TextOffset, Text, 15, 400);
draw_set_halign(fa_left);
draw_set_font(global.FontW97Black);

if (input_check_pressed(UnknownEnum.Value_0) && global.Shop != -1 && !TransitioningOut && !DoorwayFreeze)
{
    TransitionSideLock = sign(CamRotationH);
    
    if (!(abs(CamRotationH) > 45) && ThirdShopAvailable)
        TransitionSideLock = 0;
    
    TransitioningOut = true;
    FlashTimer = 30;
    instance_destroy(oShopItem);
    instance_destroy(oEleanorChallengeIndicator);
    audio_play_sound(sfxDoor, 10, false);
}

if (FlashTimer <= 30 || TransitioningOut)
{
    draw_set_alpha(random_range(0.5, 2.5) * lerp(1, 0, FlashTimer / 30));
    draw_rectangle_color(0, 0, 640, 360, c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1);
    
    if (TransitioningOut)
        FlashTimer--;
    else
        FlashTimer++;
    
    if (FlashTimer <= -60)
        room_goto(AngelMode ? EndlessShopOMC : EndlessShop);
}

var BoxWidth = 120;
var BoxOffset = lerp(-24, 0, RoundBoxTransition);
draw_set_halign(fa_left);
draw_sprite_stretched(sWindowBase, 0, 2, 2 + BoxOffset, BoxWidth, 22);
draw_text_color(8, 3 + BoxOffset, AngelMode ? "???" : ("Entering Round " + string(global.EndlessRound)), c_white, c_white, c_white, c_white, 1);
draw_sprite(sEndlessStickers, global.Difficulty, (2 + BoxWidth) - 11, 3 + BoxOffset + 10);
draw_sprite_stretched(sWindowBase, 0, 640 - (BoxWidth + 1), 2 + BoxOffset, BoxWidth, 22);
draw_text_color((640 - (BoxWidth + 1)) + 6, 3 + BoxOffset, "Earnings: ", c_white, c_white, c_white, c_white, 1);
draw_set_halign(fa_right);
draw_text(632, 3 + BoxOffset, "$" + string_format(global.RunEarnings, 1, 2));
draw_set_halign(fa_left);
RoundBoxTransition += ((!TransitioningOut - RoundBoxTransition) / 5);
surface_reset_target();

enum UnknownEnum
{
    Value_0
}
