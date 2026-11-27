event_inherited();
MaxWidth = 8;
SorterArray = get_sorter_array(countup_array(86));
array_push(SorterArray, UnknownEnum.Value_118);
array_push(SorterArray, UnknownEnum.Value_120);
Killables = [];
FadeOut = false;
OriginalX = 0;
MenuSurf = -1;
BarOffset = 0;
BarDragged = false;
Destroy = false;

KillFunction = function(arg0)
{
    instance_destroy(get_animatronic_object(arg0));
    play_deathcoin_voiceline(arg0);
    x = OriginalX;
};

Value = speedup_item_price(UnknownEnum.Value_9);

enum UnknownEnum
{
    Value_9 = 9,
    Value_118 = 118,
    Value_120 = 120
}
