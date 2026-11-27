if (ChosenMinigame == -1)
{
    do
        ChosenMinigame = choose_from_array(oCameraUI.AvailableMinigames);
    until (oCameraUI.DisabledMinigames[ChosenMinigame] == false);
}

if (ChosenMinigame == UnknownEnum.Value_0 || ChosenMinigame == UnknownEnum.Value_4 || ChosenMinigame == UnknownEnum.Value_7)
{
    if (TFScores[ChosenMinigame] > global.HiScores[ChosenMinigame])
        BeatenAmount++;
}
else if (TFScores[ChosenMinigame] < global.HiScores[ChosenMinigame])
{
    BeatenAmount++;
}

if (BeatenAmount > 0)
{
    audio_play_sound(sfxChildrenCheering, 5, false);
    notification("Eleanor's score has been beaten!");
    reverb_sound(voc_Eleanor_Leave, 0, -200);
    instance_destroy();
}

if (global.Progress >= global.ProgressToMake && !BlockNotification)
{
    error();
    notification("Beat Eleanor's score to finish the night!", 3);
    BlockNotification = true;
}

depth = 80;

enum UnknownEnum
{
    Value_0,
    Value_4 = 4,
    Value_7 = 7
}
