TileSize = 0;
Active = true;
RowCount = 2;
Choices = [
{
    ID: UnknownEnum.Value_131,
    ShopID: UnknownEnum.Value_0
}, 
{
    ID: UnknownEnum.Value_132,
    ShopID: UnknownEnum.Value_1
}, 
{
    ID: UnknownEnum.Value_133,
    ShopID: UnknownEnum.Value_2
}, 
{
    ID: UnknownEnum.Value_134,
    ShopID: UnknownEnum.Value_3
}, 
{
    ID: UnknownEnum.Value_135,
    ShopID: UnknownEnum.Value_5
}, 
{
    ID: UnknownEnum.Value_139,
    ShopID: UnknownEnum.Value_6
}, 
{
    ID: UnknownEnum.Value_137,
    ShopID: UnknownEnum.Value_9
}, 
{
    ID: UnknownEnum.Value_140,
    ShopID: UnknownEnum.Value_7
}, 
{
    ID: UnknownEnum.Value_138,
    ShopID: UnknownEnum.Value_8
}, 
{
    ID: UnknownEnum.Value_136,
    ShopID: UnknownEnum.Value_10
}, 
{
    ID: global.NuzlockeMode ? UnknownEnum.Value_143 : UnknownEnum.Value_142,
    ShopID: global.NuzlockeMode ? UnknownEnum.Value_11 : UnknownEnum.Value_4
}, 
{
    ID: UnknownEnum.Value_141,
    ShopID: UnknownEnum.Value_12
}];
Available = array_create(array_length(Choices), true);

for (var i = 0; i < array_length(Choices); i++)
{
    var Val = Choices[i].ShopID;
    
    if (array_contains(global.GuardParameters.disabled_shops, Val))
        Available[i] = false;
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12,
    Value_131 = 131,
    Value_132,
    Value_133,
    Value_134,
    Value_135,
    Value_136,
    Value_137,
    Value_138,
    Value_139,
    Value_140,
    Value_141,
    Value_142,
    Value_143
}
