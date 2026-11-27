global.MicrogameWin = false;
var AnimatronicsToSummon = array_shuffle([UnknownEnum.Value_10, UnknownEnum.Value_6, UnknownEnum.Value_32, UnknownEnum.Value_38, UnknownEnum.Value_27, UnknownEnum.Value_4, UnknownEnum.Value_22, 95]);

if (global.MicrogameLevel == 1)
{
    var RandomPick = 96 + irandom(3);
    AnimatronicsToSummon = array_shuffle([RandomPick, RandomPick, RandomPick, RandomPick, RandomPick, RandomPick, RandomPick, 95]);
}

if (global.MicrogameLevel == 2)
    AnimatronicsToSummon = array_shuffle([96, 97, 98, 99, 96 + irandom(3), 96 + irandom(3), 96 + irandom(3), 95]);

for (var i = 0; i < array_length(AnimatronicsToSummon); i++)
{
    var XValue = i % 4;
    var YValue = floor(i / 4);
    
    with (instance_create_depth((XValue * 96) + 144, (YValue * 160) + 80, 0, oInteraction_Animatronic))
    {
        AnimatronicID = AnimatronicsToSummon[i];
        Text = (AnimatronicsToSummon[i] == 95) ? "Microgame_Found" : ((AnimatronicsToSummon[i] <= 99 && AnimatronicsToSummon[i] > 95) ? string("Microgame_Fail_{0}", AnimatronicsToSummon[i] - 96) : "Microgame_Fail");
        Height = get_animatronic_height(AnimatronicsToSummon[i]);
    }
}

enum UnknownEnum
{
    Value_4 = 4,
    Value_6 = 6,
    Value_10 = 10,
    Value_22 = 22,
    Value_27 = 27,
    Value_32 = 32,
    Value_38 = 38
}
