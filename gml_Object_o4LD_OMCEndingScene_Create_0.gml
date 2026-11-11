ShopkeepX = 880;
ShopkeepY = 232;
YSpeed = 0;
TargetX = ShopkeepX;
Pose = 1;
FadeAlpha = 1;
global.Music = play_music(mus_AngelsSanctum);
application_surface_draw_enable(true);

function switch_pose(arg0)
{
    Pose = arg0;
    YSpeed = 8;
}

FadingOut = false;
ShowMoney = false;
DrainMoney = false;
MoneyOffset = -48;
SavedEarnings = global.RunEarnings;
DisplayedEarnings = SavedEarnings;
EarningsRank = 0;

if (DisplayedEarnings >= 999)
    EarningsRank = "Cheated";
else if (DisplayedEarnings >= 100)
    EarningsRank = "Rich";
else if (DisplayedEarnings >= 20)
    EarningsRank = "Moderate";
else if (DisplayedEarnings > 0)
    EarningsRank = "Poor";
else
    EarningsRank = "Debt";

alarm[0] = 240;
Frame = 0;
