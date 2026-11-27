Text = " ";
DisplayTest = " ";
Description = " ";
Price = 0;
Stock = 1;
Sprite = sShopItemIcons;
MimicText = "NOTHING";
BaseY = y;
Discount = 1;
var AvailableItems = instance_number(oCamButtonShopItem);
var MimicID = irandom(AvailableItems - 1);
var PlacementID;

do
    PlacementID = irandom(AvailableItems - 1);
until (PlacementID != MimicID);

var MimicItem = instance_find(oCamButtonShopItem, MimicID);
PlacementItem = instance_find(oCamButtonShopItem, PlacementID);
x = PlacementItem.x;
BaseY = PlacementItem.BaseY;
y = -360;
depth = -1;
Text = MimicItem.Text;
AlteredPrice = 666;
Stock = irandom_range(1, 3);
Description = oFoxyEXE.ATTR_FakeItemText;
show_debug_message($"TEXT: {Text}");
show_debug_message($"X: {x} | Y: {y}");
