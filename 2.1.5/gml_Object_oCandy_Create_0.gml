ID = UnknownEnum.Value_44;
SPRITE_Head = skin_sprite(sCandy_Head, ID, "sprite_01.png");
SPRITE_Body = skin_sprite(sCandy_Body, ID, "sprite_02.png");
SPRITE_Arm = skin_sprite(sCandy_Arm, ID, ["sprite_03.png", "sprite_04.png"]);
SPRITE_TV = skin_sprite(sTVCandy, ID, ["sprite_05.png", "sprite_06.png"]);
SOUND_Appear = skin_sound(sfxWindowScare, ID, "sq_scare");
SOUND_Countdown = skin_sound(sfxClockTickdown, ID, "sq_countdown");
WaitTime = 999;
Head = instance_create_layer(x, y, "Behind_Wall", oOfficeSprite);
Head.sprite_index = SPRITE_Head;
Body = instance_create_layer(x, y, "Behind_Wall", oOfficeSprite);
Body.sprite_index = SPRITE_Body;
ArmL = instance_create_layer(x, y, "Behind_Wall", oOfficeSprite);
ArmL.sprite_index = SPRITE_Arm;
ArmR = instance_create_layer(x, y, "Behind_Wall", oOfficeSprite);
ArmR.sprite_index = SPRITE_Arm;
Position = 0;
Mode = 2;
Speed = 0;

enum UnknownEnum
{
    Value_44 = 44
}
