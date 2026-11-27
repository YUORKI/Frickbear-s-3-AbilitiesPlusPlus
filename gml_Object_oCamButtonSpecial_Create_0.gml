Text = "Huh?";
BaseX = x;
BaseY = y;
global.SavedCam = 1;
Held = false;
HeaterSpeed = has_upgrade(UnknownEnum.Value_55) ? 0 : (has_upgrade(UnknownEnum.Value_54) ? 0.5 : 1);
FakeText = "";
FakeTextTimer = 0;

enum UnknownEnum
{
    Value_54 = 54,
    Value_55
}
