ID = UnknownEnum.Value_86;
SPRITE_Arm = skin_sprite(sSpringBonnie_Arm, ID, get_sprite_filenames(5, 7));
SPRITE_Balls = skin_sprite(sSpringBonnie_BallPile, ID, "sprite_08.png");
SPRITE_Body = skin_sprite(sSpringBonnie_Body, ID, "sprite_04.png");
SPRITE_HeadAttacking = skin_sprite(sSpringBonnie_Head_Attacking, ID, "sprite_03.png");
SPRITE_HeadAway = skin_sprite(sSpringBonnie_Head_FacingAway, ID, "sprite_02.png");
SPRITE_Head = skin_sprite(sSpringBonnie_Head_Normal, ID, "sprite_01.png");
SPRITE_Collectibles = skin_sprite_unlimited(sSpringBonniesBalls, ID, "sprite_collectible");
SOUND_Ambience = skin_sound(sfxSpringBonnieAmbience, ID, "sq_ambience");
SOUND_Hurt = skin_sound(sfxSpringBonnieHurt, ID, "sq_hurt");
SOUND_Clicked = skin_sound_generate_array([sfxPunch1, sfxPunch2, sfxPunch3], ID, "sq_hit");
SOUND_Pluck = skin_sound(sfxPluck, ID, "sq_pluck");
SOUND_Collect = skin_sound(sfxBitCollect, ID, "sq_collect");
AI = 0;
Mode = 0;
Frame = 0;
WhackAngle = 0;
WhackAngleSpeed = 0;
Squish = 1;
SquishSpeed = 0;
HitFrames = 0;
AggroLevel = -0.5;
Head = instance_create_layer(-999, -999, "InFrontOf_Wall", oOfficeSprite);
Body = instance_create_layer(-999, -999, "InFrontOf_Wall", oOfficeSprite);
Arm = instance_create_layer(-999, -999, "InFrontOf_Wall", oOfficeSprite);
Balls = instance_create_layer(1088, -999, "InFrontOf_Wall", oOfficeSprite);

with (Balls)
{
    DrawDepth = 30;
    sprite_index = other.SPRITE_Balls;
}

Ballz = 0;
WaitForFlip = true;
BallCounterOffset = 64;
KillFrames = 0;
Ambience = audio_play_sound(SOUND_Ambience, 8, true, 1, 0, 1);
audio_sound_gain(Ambience, 0, 0);

enum UnknownEnum
{
    Value_86 = 86
}
