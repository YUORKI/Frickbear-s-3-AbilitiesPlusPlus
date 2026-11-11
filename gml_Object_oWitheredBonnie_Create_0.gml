OfficeSprite = undefined;
Mode = "Reset";
Timer = 0;
Exposure = 0;
Head = undefined;
Torso = undefined;
Arm = undefined;
Legs = undefined;
Wires = undefined;
SPRITE_Head = skin_sprite(sWitheredBonnieHead, UnknownEnum.Value_11, ["sprite_01.png"]);
SPRITE_Torso = skin_sprite(sWitheredBonnieTorso, UnknownEnum.Value_11, ["sprite_02.png"]);
SPRITE_Legs = skin_sprite(sWitheredBonnieLegs, UnknownEnum.Value_11, ["sprite_03.png"]);
SPRITE_Arm = skin_sprite(sWitheredBonnieArm, UnknownEnum.Value_11, ["sprite_04.png"]);
SPRITE_Wires = skin_sprite(sWitheredBonnieWires, UnknownEnum.Value_11, ["sprite_05.png"]);
SOUND_Stare = skin_sound(sfxStareStatic, UnknownEnum.Value_11, "sq_static");

enum UnknownEnum
{
    Value_11 = 11
}
