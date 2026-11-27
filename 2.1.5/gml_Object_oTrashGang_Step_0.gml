var AI = global.AILevels[ID];

if (SpawnCooldown > 0)
{
    SpawnCooldown--;
    exit;
}

if (get_item_amount() < inventory_space() && JunkSpawned < ceil(AI / 5))
{
    var Img = JunkImages[JunkSpawned % array_length(JunkImages)];
    
    with (instance_create_depth(0, 0, 0, oShopItem_Junk))
    {
        sprite_index = other.SPRITE_Junk;
        Image = Img;
    }
    
    audio_play_sound(SOUND_Appear, 10, false, 0.75, 0, random_range(0.8, 1.2));
    JunkSpawned++;
    SpawnCooldown = 5;
}
