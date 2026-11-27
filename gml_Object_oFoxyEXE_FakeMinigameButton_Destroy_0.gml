with (oCameraUI)
{
    for (var i = 0; i < array_length(AvailableMinigames); i++)
    {
        if (AvailableMinigames[i] == 666)
        {
            array_delete(AvailableMinigames, i, 1);
            array_delete(DisabledMinigames, i, 1);
            break;
        }
    }
}
