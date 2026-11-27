ID = UnknownEnum.Value_50;
SPRITE_Background = skin_sprite(sFNAFWorld_BG, ID, "sprite_03.png");
SPRITE_Enemies = skin_sprite_unlimited(sFNAFWorld_Enemies, ID, "sprite_enemy");
SPRITE_Freddy = skin_sprite(sFNAFWorld_Freddy, ID, ["sprite_01.png", "sprite_02.png"]);
SPRITE_Menus = skin_sprite(sFNAFWorld_Windows, ID, get_sprite_filenames(4, 8));
SOUND_Attack = skin_sound(sfxBitCrunch, ID, "sq_attack");
SOUND_Select = skin_sound(sfxBitPlace, ID, "sq_select");
SOUND_Explode = skin_sound(sfxBitExplosionAlt, ID, "sq_die");
SOUND_ExplodeAlt = skin_sound(sfxBitExplosion, ID, "sq_defeat");
SOUND_Heal = skin_sound(sfxBitBoost, ID, "sq_heal");
SOUND_Fail = skin_sound(sfxBitPunish, ID, "sq_takedamage");
SOUND_Collect = skin_sound(sfxBitCollect, ID, "sq_win");
RPGSurface = -1;
FreddyProgress = 0;
BattleFrame = 0;
ActionCooldown = 0;
FreddyHP = 1;
EnemyHP = 1;
TicksTilFight = 9999;
EnemyAttackTimer = 9999;
BattleMode = false;
BattleWindowSize = 0;
BattleWindowShake = 0;
BattleWindowShakeDirection = 1;
HurtFrames = 0;
HealsLeft = 0;
EnemyType = irandom(2);
DeathFrames = 0;
YOffset = 128;
YOffsetSpeed = 0;
CommandInput = -1;

enum UnknownEnum
{
    Value_50 = 50
}
