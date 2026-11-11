with (oCamButtonShopItem)
{
    if (Text == "High-Quality Lumber")
    {
        Sprite = sShopItemIcons;
        Text = "Pickles";
        Description = "Happiness +1. (INSTANT USE)";
        Price = 300;
        Stock = 1;
    }
}

sprite_delete(SPRITE_Lumber);
skin_sound_delete_array(SOUND_Purchase);
