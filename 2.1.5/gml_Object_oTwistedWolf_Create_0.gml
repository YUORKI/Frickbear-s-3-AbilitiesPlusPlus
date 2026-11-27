ID = UnknownEnum.Value_36;
SPRITE_Plushie = skin_sprite_unlimited(sTwistedWolf_Plushie, ID, "sprite_vanished");
SPRITE_Head = skin_sprite(sTwistedWolf_Head, ID, ["sprite_01.png", "sprite_02.png"]);
SPRITE_Torso = skin_sprite(sTwistedWolf_Torso, ID, ["sprite_03.png", "sprite_04.png"]);
SPRITE_Legs = skin_sprite(sTwistedWolf_Legs, ID, ["sprite_05.png", "sprite_06.png"]);
SPRITE_FrontArm = skin_sprite(sTwistedWolf_FrontArm, ID, ["sprite_07.png", "sprite_08.png"]);
SPRITE_Hand = skin_sprite(sTwistedWolf_Hand, ID, ["sprite_09.png", "sprite_10.png"]);
SPRITE_BackArm = skin_sprite(sTwistedWolf_BackArm, ID, ["sprite_11.png", "sprite_12.png"]);
SPRITE_Disc = skin_sprite(sTwistedWolf_IllusionDisc, ID, ["sprite_13.png", "sprite_14.png"]);
SOUND_Appear = skin_sound(sfxWindowScare, ID, "sq_scare");
SOUND_Clicked = skin_sound(sfxMarioKick, ID, "sq_clicked");
SOUND_Vanish = skin_sound(sfxBitKnockout, ID, "sq_vanish");
Reach = 0;
ReachSpeed = -0.5;
TargetReach = 0;
DrawSurf = -1;
WolfSprite = -1;
DiscPosition = irandom(5);
Frame = 300;
InOffice = false;
WaitToAttack = false;
RollFailed = true;
Disc = undefined;
Legs = undefined;
Torso = undefined;
Head = undefined;
BackArm = undefined;
FrontArm = undefined;
Hand = undefined;
Plushie = undefined;
PlushieSpeed = 0;
PlushieImage = 0;
Despawning = false;

enum UnknownEnum
{
    Value_36 = 36
}
