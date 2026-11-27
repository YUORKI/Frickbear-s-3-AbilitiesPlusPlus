ID = UnknownEnum.Value_70;
MoonHead = instance_create_layer(1440, 1070, "Behind_Wall", oOfficeSprite);
MoonHead.sprite_index = sMoonInWindow;
MoonYSpeed = 0;
AnimMode = -1;
WaitForLower = false;
KillTimer = 0;
SOUND_Sun = get_misc_voicelines(ID, "Sun");
SOUND_Moon = get_misc_voicelines(ID, "Moon");

enum UnknownEnum
{
    Value_70 = 70
}
