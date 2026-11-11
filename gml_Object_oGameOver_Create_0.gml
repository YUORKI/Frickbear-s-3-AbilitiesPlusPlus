Frame = 0;
Alpha = 0;
VoiceLineID = -1;
texturegroup_load("DeathScreen");

if (global.Jumpscare == -1)
{
    Tip = "You passed out.";
}
else
{
    Tip = get_tips(global.Jumpscare);
    
    if (global.Jumpscare == UnknownEnum.Value_120)
        Tip = choose("The flashlight will force Salvage to move faster.", "Salvage will always go for the doors after being zapped, and will typically go for the breakers after that.", "Wires in the vents will squeak when they first appear. Listen out for them.");
}

application_surface_draw_enable(true);
SelectedOption = 0;
OptionOffset = 0;
ExitFrame = 0;
ExitDegree = 0;
audio_listener_position(0, 0, 0);
SubtitleList = [];
SubtitleTimingList = [];
SubtitleEntry = 0;
SoundPlaying = undefined;
Sound = undefined;
var numExt = "";

if (get_jumpscares_per_char(global.Jumpscare) > 1)
    numExt = string(global.JumpscareType + 1);

CustomDeathscreen = skin_sprite(sDeathscreen_Freddy, global.Jumpscare, "deathscreen" + numExt + ".png", 1);
GuardSprite = import_sprites("minigame.png", sHD_Guard, 4, 8, 8);
Options = ["Retry Night", "Quit to Menu", "Quit Game"];
GuardsWhoDied = [];
LostChallenge = undefined;

if (any_challenge_active())
{
    LostChallenge = global.EleanorChallenge.ID;
    global.EleanorChallenge = undefined;
}

GuardLine = -1;
GuardLinePlayed = false;
DeathLinePlayed = false;

if (global.Night == "Endless")
{
    BoozeBlocked = (global.EndlessInventory.BarrierBooze == 1) ? true : false;
    
    if (BoozeBlocked)
        global.EndlessInventory.BarrierBooze = -1;
    
    if (guard_ability(UnknownEnum.Value_11) || LostChallenge == UnknownEnum.Value_5)
        BoozeBlocked = false;
    
    if (!BoozeBlocked)
    {
        var Repeats = 1 - BoozeBlocked;
        
        if (guard_ability(UnknownEnum.Value_11) || LostChallenge == UnknownEnum.Value_5)
            Repeats = lives_left();
        
        repeat (Repeats)
            array_push(GuardsWhoDied, array_pop(global.Lives));
        
        global.DeathsThisRound += Repeats;
        global.Deaths += Repeats;
        global.Guard = GuardsWhoDied[0];
        var WasEdwin = guard_ability(UnknownEnum.Value_12);
        
        if (array_length(global.Lives) > 0)
            global.Guard = global.Lives[array_length(global.Lives) - 1];
        
        edwin_money_exchange(WasEdwin);
    }
    else
    {
        GuardLinePlayed = true;
    }
    
    save_endless_data(Office, lives_left() > 0);
    
    if (lives_left() == 0 && global.EndlessRound >= 10)
        unlock_guard(UnknownEnum.Value_17);
}
else
{
    GuardLinePlayed = true;
}

if (global.Night == "Endless" && lives_left() == 0)
    Options[0] = "See Results";

enum UnknownEnum
{
    Value_5 = 5,
    Value_11 = 11,
    Value_12,
    Value_17 = 17,
    Value_120 = 120
}
