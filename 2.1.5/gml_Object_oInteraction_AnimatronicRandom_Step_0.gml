event_inherited();

if (has_upgrade(UnknownEnum.Value_10))
{
    x = OriginalX;
    y = OriginalY;
}
else if (has_upgrade(UnknownEnum.Value_9) && ID <= 1)
{
    x = OriginalX;
    y = OriginalY;
}
else if (has_upgrade(UnknownEnum.Value_8) && ID <= 0)
{
    x = OriginalX;
    y = OriginalY;
}
else
{
    x = -32;
    y = -32;
}

enum UnknownEnum
{
    Value_8 = 8,
    Value_9,
    Value_10
}
