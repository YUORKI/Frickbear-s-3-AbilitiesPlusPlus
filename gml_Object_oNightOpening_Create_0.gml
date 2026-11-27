Frame = -30;
y = -96;
YSpeed = 5;
ArraySize = 200;

if (numbered_night() && (global.Night > 1 || global.Difficulty == 3) && !array_contains(global.AllTimeSalvages, global.ShuffleData.Animatronics[UnknownEnum.Value_14]))
    array_push(global.AllTimeSalvages, global.ShuffleData.Animatronics[UnknownEnum.Value_14]);

var i = ArraySize - 1;

while (i >= 0)
{
    PositionY[i] = y;
    i--;
}

switch (global.Night)
{
    default:
        Text = "Night " + string(global.Night);
        break;
    
    case "Custom":
        Text = "Custom Night";
        break;
    
    case "Endless":
        Text = "Endless Night";
        break;
}

if (global.Route == UnknownEnum.Value_4 && global.Night == 6)
    Text = "Night F";

if (numbered_night())
    global.Cheats = array_create(10, false);

TextOrder = "NECimndlesghtuo1234567890 PaF";
FontNightOpening = font_add_sprite_ext(sFontNightOpening, TextOrder, true, 4);
draw_set_font(FontNightOpening);
Alpha = 0;
depth = 50;

if (global.Route == UnknownEnum.Value_4 && global.Night == 6)
    Background = 7;
else if (is_numeric(global.Night))
    Background = global.Night - 1;
else
    Background = 6;

global.CallMuted = false;
TipList = ["You can switch cameras on the fly using the number keys!", $"You can use the {cur_key_name(UnknownEnum.Value_21)}, {cur_key_name(UnknownEnum.Value_22)}, {cur_key_name(UnknownEnum.Value_23)} and {cur_key_name(UnknownEnum.Value_24)} keys while in the cameras to switch systems!", "Any tokens or power left over at the end of the night get converted to cash.", "Running low on power? You can buy additional battery packs at the shop!", "You can review your upgrades and animatronics' mechanics in the pause menu.", "Buy a Distortion Clock at the shop to skip an hour of the night! Just be careful not to buy a Rewind Clock instead...", "Tokens can be earned by dealing with animatronics or playing minigames.", "The heater will push back animatronics in the vents...at the cost of raising the office temperature.", "When you run out of power, all animatronics will continue roaming like normal.", "You can hold up to 5 items at a time.", "Beating a night with an animatronic active will permanently unlock them in Custom Night.", "A King's Prize can net you tokens and free powerups, but it can also summon in animatronics...or kill you.", "Pay attention to audio cues to know when animatronics move.", "Arcade boards found in salvage locations will permanently unlock minigames to play during the night!", "You can use multiple tools at once! The doors, flashlight and fan can be used even with the mask or cameras up.", "That office TV's not just for show, you know!"];
Tip = TipList[((global.TipNum + global.FunValue[0]) * global.FunValue[1]) % array_length(TipList)];
global.TipNum++;

if (global.Night == 6)
{
    if (global.Route == UnknownEnum.Value_2)
        Tip = "Press space to jump!";
    
    if (global.Route == UnknownEnum.Value_3)
        Tip = "Don't follow the white rabbit.";
    
    if (global.Route == UnknownEnum.Value_4)
        Tip = "Give up.";
}

TipOffset = 32;
global.BossPhase = 0;
global.SavedBossTime = 0;

if (global.Night == "Custom" && boss_fight_night())
    global.BossPhase = 1;

NewAnimatronics = [];

if (numbered_night() && !boss_fight_night())
{
    var NightlyChars = global.Difficulty + 1;
    
    if (global.Night >= 2 && global.Night < 6)
        NightlyChars += global.SalvagedScraps[global.Night - 2];
    
    if (global.Night == 2 && global.Difficulty != 3)
        NightlyChars++;
    
    if (global.Night == 1)
        NightlyChars = 6;
    
    i = array_length(global.AllTimeSalvages) - 1;
    
    while (i >= max(array_length(global.AllTimeSalvages) - NightlyChars, 0))
    {
        array_push(NewAnimatronics, global.AllTimeSalvages[i]);
        i--;
    }
}

AnimatronicOffsets = array_create(array_length(NewAnimatronics), -48);

enum UnknownEnum
{
    Value_2 = 2,
    Value_3,
    Value_4,
    Value_14 = 14,
    Value_21 = 21,
    Value_22,
    Value_23,
    Value_24
}
