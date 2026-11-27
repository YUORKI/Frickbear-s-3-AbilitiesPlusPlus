FadeAlpha += (binary_to_sign(FadingOut) / 180);
FadeAlpha = max(0, FadeAlpha);
draw_sprite(sOMCBG, floor(Frame) % 3, 0, 0);
draw_sprite(sShopkeep_OldManConsequences, Pose, ShopkeepX, ShopkeepY);
ShopkeepX += ((TargetX - ShopkeepX) / 10);
ShopkeepY += YSpeed;
YSpeed = lerp(YSpeed, (232 - ShopkeepY) * 0.25, 0.4);
draw_sprite_ext(sTextBox, 1, 512, MoneyOffset, 2, 0.75, 0, c_white, 1);
draw_set_font(global.FontHanddrawn);
draw_set_halign(fa_left);
draw_text_color(524, 12 + MoneyOffset, "$" + string_format(DisplayedEarnings, 3, 2), #E0F8D0, #E0F8D0, #E0F8D0, #E0F8D0, 1);

if (abs(SavedEarnings - DisplayedEarnings) < 0.33)
{
    DisplayedEarnings = SavedEarnings;
}
else
{
    DisplayedEarnings += (sign(SavedEarnings - DisplayedEarnings) * 0.33);
    audio_play_sound(sfxTally, 1, false, 0.5);
}

if (DrainMoney == true && DisplayedEarnings == SavedEarnings)
{
    DrainMoney = false;
    alarm[2] = 60;
    audio_play_sound(sfxRegister, 10, false);
}

MoneyOffset += (((ShowMoney ? 0 : -48) - MoneyOffset) / 10);
draw_set_alpha(FadeAlpha);
draw_rectangle_color(0, 0, 640, 360, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
draw_rectangle_color(0, 234, 640, 360, c_black, c_black, c_black, c_black, false);
check_reset();
Frame += 0.016666666666666666;
