reset_challenge_alterations(true, false);
global.Night = "Endless";
global.NightSpeedup = 3;
Offset = -360;
OffsetTarget = 0;
OptionPressed = false;
audio_stop_all();
application_surface_draw_enable(true);
var Check = global.CheckForEndlessSave;
global.CheckForEndlessSave = false;

if (!Check)
{
    instance_change(oEndless_AnimatronicPicker, true);
    play_music(mus_EndlessSelect, 0.5);
    exit;
}

play_music(mus_EndlessSelectNEW, 0.75);

if (!global.CanContinue)
{
    initialize_endless_data();
    instance_change(oEndless_ModePicker, true);
    exit;
}

var DiffNames = ["Easy", "Normal", "Hard", "Lunatic", "Nightmare"];
ContinueString = "You appear to have a run in progress already. Would you like to continue your previous run?" + $"\n\n{(global.Guard >= array_length(global.GuardNames)) ? "UNKNOWN GUARD" : guard_nickname(global.Guard)}" + $"\nRound {global.EndlessRound}" + $"\nLives: {lives_left()}" + $"\nDifficulty: {DiffNames[global.Difficulty]}";
