TimeSetting = 0;
SettingsArray = [["Default", undefined], ["Custom A", musNightCustom1], ["Custom B", musNightCustom2], ["Custom C", musNightCustom3], ["Custom D", musNightCustom4], ["Custom E", musNightCustom5], ["Custom F", musNightCustom6], ["Night 1", musNight1], ["Night 2", musNight2], ["Night 3", musNight3], ["Night 4", musNight4], ["Night 5", musNight5]];

if (global.UnlockedAnimatronics[UnknownEnum.Value_167])
    array_push(SettingsArray, ["Night 6", musNight6]);

if (global.UnlockedAnimatronics[UnknownEnum.Value_138])
    array_push(SettingsArray, ["Eleanor", musNightEleanor]);

if (global.UnlockedAnimatronics[UnknownEnum.Value_120])
    array_push(SettingsArray, ["Salvage", mus_BossSalvage]);

if (global.UnlockedAnimatronics[UnknownEnum.Value_121])
    array_push(SettingsArray, ["Nightmare", mus_BossNightmare_Main]);

if (global.UnlockedAnimatronics[UnknownEnum.Value_126])
    array_push(SettingsArray, ["Fredbear", mus_BossFredbear]);

if (global.UnlockedAnimatronics[UnknownEnum.Value_127])
    array_push(SettingsArray, ["Phony Boss", mus_BossPhony]);

while (global.CustomNightMusic != SettingsArray[TimeSetting][1] && (TimeSetting + 1) < array_length(SettingsArray))
    TimeSetting++;

if (TimeSetting > array_length(SettingsArray))
    TimeSetting = 0;

Text = SettingsArray[TimeSetting][0];
global.CustomNightMusic = SettingsArray[TimeSetting][1];

enum UnknownEnum
{
    Value_120 = 120,
    Value_121,
    Value_126 = 126,
    Value_127,
    Value_138 = 138,
    Value_167 = 167
}
