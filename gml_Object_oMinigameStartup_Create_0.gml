Frame = 0;
audio_play_sound(sfxMinigameStartup, 10, false);
BlockLengths = [640];
Startup = true;
Palettes = [[13497343, 9150972, 2367462, 3670100], [16776682, 15582005, 10510858, 3875328], [13695200, 7389320, 5662772, 3354368], [15852799, 15045092, 9517434, 3997737], [14940415, 13479679, 11422463, 3670100]];
application_surface_draw_enable(true);
instance_destroy(oTransitionMinigame);
Sprite = import_sprites("minigame.png", sHD_Guard, 4, 8, 8);
Destination = global.ShuffleData.Locations[global.Night - 1];
Img = 0;
LocationName = "???";

switch (Destination)
{
    case MinigameMaze_1:
        LocationName = "Freddy Fazbear's Pizza";
        Img = 1;
        break;
    
    case MinigameMaze_2:
        LocationName = "The New & Improved Freddy Fazbear's Pizza";
        Img = 2;
        break;
    
    case MinigameMaze_3:
        LocationName = "Fazbear's Fright";
        Img = 3;
        break;
    
    case MinigameMaze_4:
        LocationName = "William's Woods";
        Img = 4;
        break;
    
    case MinigameMaze_5:
        LocationName = "Circus Baby's Entertainment & Rentals";
        Img = 5;
        break;
}
