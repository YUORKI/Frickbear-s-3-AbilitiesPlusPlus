TileSize = 0;
Active = true;
AnimatronicList = [];

for (var i = 0; i <= 86; i++)
    array_push(AnimatronicList, i);

AnimatronicList = get_sorter_array(AnimatronicList);
SelectedAnimatronics = array_create(87, false);
AnimatronicQuota = 6 + ((global.Difficulty + 1) * 4) + ((global.Route == UnknownEnum.Value_4) * 4);
SelectionSurf = -1;
ScrollBarOffset = 0;
ScrollBarDragged = false;

enum UnknownEnum
{
    Value_4 = 4
}
