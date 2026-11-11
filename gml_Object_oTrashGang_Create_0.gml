ID = UnknownEnum.Value_57;
SPRITE_Junk = skin_sprite_unlimited(sShopItemIcons_Junk, ID, "sprite_junk");
SOUND_Appear = skin_sound(sfxTrashGang_Clatter, ID, "sq_appear");
JunkSpawned = 0;
JunkImages = array_shuffle(countup_array(sprite_get_number(SPRITE_Junk) - 1));
SpawnCooldown = 5;

enum UnknownEnum
{
    Value_57 = 57
}
