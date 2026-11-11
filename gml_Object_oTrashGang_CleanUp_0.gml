with (oShopItem)
{
    if (sprite_index == other.SPRITE_Junk)
        instance_destroy();
}

sprite_delete(SPRITE_Junk);
skin_sound_delete_array([SOUND_Appear]);
