random_set_seed(global.Seed + global.EndlessRound);
RandomSeed = random_get_seed();
TileSize = 0;
Active = true;
AveragePrice = 0;

for (var i = 0; i <= 86; i++)
{
    show_debug_message(string("{0} : {1}", global.Descriptions[i][0], AveragePrice));
    AveragePrice += (get_animatronic_data(i).SalvageValue / 100);
}

AveragePrice = round((AveragePrice / UnknownEnum.Value_87) - 1);
rerollMultiplier = 1;
QuotaInflator = 0;

function pick_choices()
{
    random_set_seed(RandomSeed);
    var ChoiceAmount = 3;
    Choices = [];
    array_copy(Choices, 0, array_shuffle(get_available_challenge_ids()), 0, 3);
    OptionAmount = array_length(Choices);
    SelectedChallenge = -1;
}

pick_choices();
Selected = false;
SelectedPrice = 0;
TransitionTime = 0;
AnimationFrame = 0;
PriceScaler = 1;
WindowOffset = 0;
WindowOffsetSpeed = 0;
BGFade = 1;

with (oBlackBars)
    TransitionAmount = 1;

enum UnknownEnum
{
    Value_87 = 87
}
