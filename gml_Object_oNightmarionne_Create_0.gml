ArmSquish = 20;
SwingTimer = 0;
BounceFrame = 900;
HeadState = 1;
Timer = 0;
Mode = "Idle";
ReturnDegree = 1;
Aggro = 0;
Height = -600;
Angle = 0;
LookedAt = 0;
Side = random_sign();
RandomValue = random_range(0.8, 1.2);
Head = undefined;
SPRITE_Head = skin_sprite(sNightmarionneHead, UnknownEnum.Value_24, ["sprite_01.png", "sprite_02.png", "sprite_03.png"]);
SPRITE_Body = skin_sprite(sNightmarionneTorso, UnknownEnum.Value_24, ["sprite_04.png"]);
SPRITE_Arm = skin_sprite(sNightmarionneArm, UnknownEnum.Value_24, ["sprite_05.png", "sprite_06.png", "sprite_07.png", "sprite_08.png"]);
SOUND_Appear = skin_sound(sfxNightmarionneAppear, UnknownEnum.Value_24, "sq_appear");
SOUND_Scare = skin_sound(sfxWindowScare, UnknownEnum.Value_24, "sq_scare");
SOUND_Garble = skin_sound(sfxNightmarionneGarble, UnknownEnum.Value_24, "sq_garble");
audio_sound_gain(sfxNightmarionneGarble, 0, 0);

enum UnknownEnum
{
    Value_24 = 24
}
