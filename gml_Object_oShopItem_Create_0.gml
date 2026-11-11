global.HoveredShopItem = -1;
InventoryPosition = get_item_amount(false) - 1;
var ItemSpacer = 32 * (5 / inventory_space());
x = 88 + (InventoryPosition * ItemSpacer) + ((room == EndlessSelection) * 35);
y = -32;
TargetX = x;
Active = false;
TutorialSize = 0;
Value = 0;

function check_for_trophy()
{
    var SnowconeActive = false;
    var LasersActive = false;
    var MaskActive = false;
    
    for (var i = 0; i < instance_number(oShopItem); i++)
    {
        var obj = instance_find(oShopItem, i);
        
        if (obj.object_index == oShopItem_ARMask)
        {
            if (obj.Active)
                MaskActive = true;
        }
        
        if (obj.object_index == oShopItem_LaserDoors)
        {
            if (obj.Active)
                LasersActive = true;
        }
        
        if (obj.object_index == oShopItem_Snowcone)
        {
            if (obj.Active)
                SnowconeActive = true;
        }
    }
    
    if (SnowconeActive && LasersActive && MaskActive)
        get_trophy(UnknownEnum.Value_17);
}

function hovered()
{
    if (global.HoveredShopItem != -1)
        return false;
    
    if (mouse_in_zone(x, y, sprite_width, sprite_height))
    {
        global.HoveredShopItem = self;
        return true;
    }
    
    return false;
}

if (array_contains([oShopItem_ARMask, oShopItem_DeathCoin, oShopItem_Snowcone, oShopItem_LaserDoors, oShopItem_GoldenCupcake], object_index) && !global.UnlockedAnimatronics[UnknownEnum.Value_129])
{
    instance_create_depth(x + 16, 66, depth, oItemTutorial);
    global.UnlockedAnimatronics[UnknownEnum.Value_129] = true;
}

function reposition_shop_item()
{
    var SlotAmount = max(5, get_item_amount(false, false));
    var ItemSpacer = 32 * (5 / SlotAmount);
    var XTarget = 88 + (InventoryPosition * ItemSpacer) + ((room == EndlessSelection) * 35) + ((room == EndlessShopSelection) * 40);
    x += ((XTarget - x) / 5);
    y += ((2 - y) / 5);
    depth = -10 + InventoryPosition;
}

Hovered = false;
ExtraOffset = 0;
OriginalX = x;
OriginalY = y;
InInventory = true;
depth = -1;

enum UnknownEnum
{
    Value_17 = 17,
    Value_129 = 129
}
