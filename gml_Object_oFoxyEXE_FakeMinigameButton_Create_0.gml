var Position = irandom(array_length(oCameraUI.AvailableMinigames));

with (oCameraUI)
{
    array_insert(AvailableMinigames, Position, 666);
    array_insert(DisabledMinigames, Position, false);
}
