depth = 10;
application_surface_draw_enable(true);
Frame = -0.5;
TowerPosition = 1;
MoonLighting = 0;
TowerLighting = 0;
TitleAlpha = 0;
TitleBrightness = 0;
SpacePressed = false;
TitleFlySpeed = 0;
TitleFlyY = 0;
global.FourLayersDownMode = true;
BackingX = 640;
DanceOffset = 0;
SizeDiff = 0;
CanSkip = true;

if (!check_flag("4LD_Opening_Seen"))
{
    CanSkip = false;
    add_flag("4LD_Opening_Seen");
}

completion_checks();
global.Route = UnknownEnum.Value_0;
MusicStopTimer = 0;
TitleAppearFrame = 6.6;

enum UnknownEnum
{
    Value_0
}
