ID = UnknownEnum.Value_63;
SPRITE_Border = skin_sprite(sControlPanel_Border, ID, "sprite_01.png");
SPRITE_Tiles = skin_sprite(sControlPanel_GridTiles, ID, "sprite_02.png");
SPRITE_Background = skin_sprite(sControlPanel_Header, ID, "sprite_03.png");
SPRITE_Screen = skin_sprite(sControlPanel_Screen, ID, get_sprite_filenames(4, 18));
SOUND_Open = skin_sound(sfxControlPanel_Open, ID, "sq_open");
SOUND_Select = skin_sound(sfxControlPanel_Select, ID, "sq_select");
SOUND_TaskDone = skin_sound(sfxControlPanel_TaskDone, ID, "sq_taskdone");
SOUND_Close = skin_sound(sfxControlPanel_Close, ID, "sq_close");
TaskNames = [array_shuffle(["Clean Monitors", "Do a Backflip", "Scribble Out Expiration Dates", "Print New Menus", "Order Pizza Kits", "Grate Mozzarella", "Re-Inflate Balloons", "Install Microgames", "Readjust Cameras", "Scare Away Squatters", "Wash Hands", "Burp BB", "Wishlist GIMMIKO", "Feed Sea-Bonnies", "Scratch Butt", "SMOKE BREAK!!!", "Rethink Career Path", "Blow Nose", "Pick Nose"]), array_shuffle(["Wipe Windows", "Take Out Trash", "Stack Pizza Boxes", "Replace Bulbs", "Unclog Toilets", "Pay Cable Bill", "Pay Phone Bill", "Slander Rival Restaurants", "Chica-Proof Trash Bins", "Tune Bonnie's Guitar", "Spit-Shine Foxy's Hook", "Wash Dishes", "State-Mandated Lunch Break", "Play Tiddlywinks", "Read Employee Handbook", "Board Up Saferoom", "Review Fanart", "Recycle Pizza Slices", "Practice Singing"]), array_shuffle(["Forge Financial Reports", "Repair Ballpit Continuum", "Polish Boss's Motorcycle", "Find Needle in Haystack", "Run Nightmare Experiments", "Take Inventory", "Run Endo Diagnostics", "Restock Prize Counter", "Stall Lawsuits", "Deal With Health Inspector", "Bake Birthday Cakes", "Sue Critics", "Prepare Party Setlist", "Wash Table Cloths", "Grovel", "Record New Showtapes", "Cure Super Cancer", "Secure Cheesetrap Supply", "Build Ultimate Body"])];
TaskNames[0] = skin_get_attribute(ID, "ShortTasks", TaskNames[0]);
TaskNames[1] = skin_get_attribute(ID, "ShortTasks", TaskNames[1]);
TaskNames[2] = skin_get_attribute(ID, "ShortTasks", TaskNames[2]);
Tasks = [];
TimeToKill = 0;
var NightLength = 6 / global.NightSpeedup;

for (var dur = 0; dur <= 2; dur++)
{
    if ((NightLength % 2) == 1 && dur == 2)
        continue;
    
    for (var n = 0; n < ceil(NightLength / 2); n++)
    {
        var DurationFactor = lerp(10, 20, global.AILevels[UnknownEnum.Value_63] / 20) * ((dur == 0) ? 0.2 : ((dur == 1) ? 1 : 3));
        array_push(Tasks, 
        {
            Title: TaskNames[dur][n],
            Duration: DurationFactor,
            Rank: dur + 1,
            Offset: 0
        });
        TimeToKill += DurationFactor;
    }
}

for (var i = 0; i < array_length(Tasks); i++)
    Tasks[i].Offset = i * 27;

if ((TimeToKill + global.Timer) >= 360)
    instance_destroy();

enum UnknownEnum
{
    Value_63 = 63
}
