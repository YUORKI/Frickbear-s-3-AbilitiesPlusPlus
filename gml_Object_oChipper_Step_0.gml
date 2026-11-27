var AI = global.AILevels[ID];

if (AI <= 0)
    exit;

if (!PicklesConverted)
{
    with (oCamButtonShopItem)
    {
        if (Text == "Pickles")
        {
            Sprite = other.SPRITE_Lumber;
            Text = "High-Quality Lumber";
            Description = other.ATTR_ItemDesc;
            Price = 5;
            Stock = 1;
            oChipper.Lumber = self;
            oChipper.PicklesConverted = true;
            DisplayText = other.ATTR_ItemName;
        }
    }
}

if (instance_exists(Lumber))
{
    Lumber.Price = ceil((10 + AI) / global.NightSpeedup);
    
    if (AI == 21)
        Lumber.Price = 300;
}
else if (PicklesConverted)
{
    if (global.SkinsFunctional[UnknownEnum.Value_42] == -1 && irandom(99) == 7)
        reverb_sound(voc_Chipper_SecretLaugh, 0, 0, false, 1);
    else
        reverb_sound(choose_from_array(SOUND_Purchase), 0, 0, false, 1);
    
    PicklesConverted = false;
    
    if (AI == 21)
        global.Timer = max(global.Timer, 358);
}

enum UnknownEnum
{
    Value_42 = 42
}
