gc_enable(false);
Timer = 0;
GlobalTimer = 0;
global.DevMode = false;
global.FourLayersDownMode = false;
room_goto(WarningScreen);
global.TrophyQueue = [];
CommandMode = false;
CommandArray = [];
CurrentCommand = "";
ScreenshotsTaken = 0;
global.MouseX = 0;
global.MouseY = 0;
global.PrevMouseX = 0;
global.PrevMouseY = 0;
display_reset(0, true);
global.FredbearMode = global.Night == 6 && global.Route == UnknownEnum.Value_4 && global.CanContinue;
global.GuardAmount = 21 + array_length(get_folders());
audio_bus_main.effects[0] = undefined;
audio_bus_main.effects[1] = undefined;
audio_bus_main.effects[2] = undefined;
audio_bus_main.effects[3] = undefined;
apply_settings(true);

for (var i = 0; i < array_length(global.Skins); i++)
    check_skins(i);

generate_face_tiles();
generate_voicelines();
define_music_loops();
EleanorDrainTimer = 300;
global.EleanorChallenge = undefined;
global.BlockedInputs = array_create(40, false);
UpsideDownTest = false;

enum UnknownEnum
{
    Value_4 = 4
}
