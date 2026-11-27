ID = UnknownEnum.Value_79;
SPRITE_Player = skin_sprite(sDoofas, ID, get_sprite_filenames(1, 4));
SPRITE_Collectibles = skin_sprite_unlimited(sDoofas_Popsicle, ID, "sprite_collectible");
SPRITE_Tokens = skin_sprite(sDoofas_Coin, ID, get_sprite_filenames(5, 8));
SOUND_Appear = skin_sound(sfxDoofas_Pop, ID, "sq_popup");
SOUND_Collect = skin_sound(sfxDoofas_Collect, ID, "sq_collect");
SOUND_Fail = skin_sound(sfxBitPunish, ID, "sq_drain");
SOUND_Miss = skin_sound_generate_array([voc_Doofas_Unlucky, voc_Doofas_Whoops, voc_Doofas_Yeargh], ID, "voc_miss");
BlinkFrame = 120;
PopsicleTimer = 0;
PopsiclesToSummon = 0;
LastMouseX = 0;
LastMouseY = 0;
WalkFrame = 0;
sprite_index = SPRITE_Player;

enum UnknownEnum
{
    Value_79 = 79
}
