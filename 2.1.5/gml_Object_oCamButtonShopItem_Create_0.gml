Text = " ";
DisplayTest = " ";
Description = " ";
Price = 0;
Stock = 1;
Sprite = sShopItemIcons;
ErrorTimer = 0;
ErrorMessage = "Not enough tokens!";

function error_msg(arg0)
{
    ErrorTimer = 1;
    ErrorMessage = arg0;
    audio_play_sound(sfxError, 10, false);
}

MimicText = "NOTHING";
BaseY = y;
Discount = 1;

if (has_upgrade(UnknownEnum.Value_7))
    Discount = 0.75;
else if (has_upgrade(UnknownEnum.Value_6))
    Discount = 0.9;

enum UnknownEnum
{
    Value_6 = 6,
    Value_7
}
