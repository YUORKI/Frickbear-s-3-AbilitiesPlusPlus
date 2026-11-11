ID = UnknownEnum.Value_42;
LumberPurchased = false;
PicklesConverted = false;
Lumber = undefined;

function jumpscare_at_6AM()
{
    if (instance_exists(oJumpscare))
        return false;
    
    if (instance_exists(Lumber) && global.AILevels[UnknownEnum.Value_42] > 0)
    {
        jumpscare(UnknownEnum.Value_42);
        return true;
    }
    
    return false;
}

SPRITE_Lumber = skin_sprite(sShopItemIcons, ID, "sprite_01.png");
SOUND_Purchase = skin_sound_generate_array([voc_Chipper_Yahoo], ID, "voc_purchase");
ATTR_ItemName = skin_get_attribute(ID, "ItemName", "High-Quality Lumber");
ATTR_ItemDesc = skin_get_attribute(ID, "ItemDesc", "Buy this to keep Chipper happy!");

enum UnknownEnum
{
    Value_42 = 42
}
