ID = UnknownEnum.Value_55;

function initialize()
{
    AngleSpeed = 0;
    Grabbed = false;
    Thrown = false;
    XSpeed = 0;
    YSpeed = 0;
    BodyAngle = 0;
    JumpAngle = 0;
    JumpOffset = 480;
    JumpSpeed = 0;
    AngleSpeed = 0;
    Randomizer = random_range(0.8, 1.2);
    GrabDelay = 30;
    image_angle = JumpAngle;
}

initialize();
AttackTimer = 0;
Active = false;
GrabDelay = 0;
SPRITE_Head = skin_sprite(sBonnet_Head, ID, get_sprite_filenames(1, 3));
SPRITE_Ear = skin_sprite(sBonnet_Ear, ID, get_sprite_filenames(4, 5));
SPRITE_Body = skin_sprite(sBonnet_Body, ID, "sprite_06.png");
SOUND_Appear = skin_sound_generate_array(get_misc_voicelines(ID, "Appear"), ID, "voc_appear");
SOUND_AppearRare = skin_sound_generate_array(get_misc_voicelines(ID, "AppearRare"), ID, "voc_appear2");
SOUND_Yell = skin_sound_generate_array(get_misc_voicelines(ID, "Thrown"), ID, "voc_thrown");
SOUND_Pluck = skin_sound(sfxPluck, ID, "sq_grab");
SOUND_Drop = skin_sound(sfxSalvage_WireDrop, ID, "sq_drop");
SOUND_Popup = skin_sound(sfxCartoonPop, ID, "sq_popup");
SOUND_Thrown = skin_sound(sfxSalvage_WireShoot, ID, "sq_throw");
SOUND_Crash = skin_sound(sfxWoodBreak, ID, "sq_impact");

enum UnknownEnum
{
    Value_55 = 55
}
