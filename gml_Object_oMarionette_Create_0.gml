MusicMax = 60;
ShowWarning = false;
MusicTimer = MusicMax;
ID = UnknownEnum.Value_16;
SPRITE_Cameras = skin_sprite(sCameras_Marionette, ID, ["sprite_01.png", "sprite_02.png"]);
SPRITE_Warning = skin_sprite(sMarionetteWarning, ID, ["sprite_03.png", "sprite_04.png"]);
ButtonText = skin_get_attribute(ID, "ButtonText", "Reset Music");
instance_create_depth(0, 0, -60, oMarionette_WarningDrawer);

enum UnknownEnum
{
    Value_16 = 16
}
