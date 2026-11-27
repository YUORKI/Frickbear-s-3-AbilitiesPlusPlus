Selected = -1;
global.MinigameWindowX = 270;
global.MinigameWindowY = 36;
global.MinigameWindowScale = 2;
initialize_minigame_scores();
global.CupcakeMeter = 0;
TileSize = 0;
Active = true;
SelectionSurf = -1;
ScrollOffset = 0;
BarDragged = false;

if (surface_exists(global.MinigameSurface))
    surface_free(global.MinigameSurface);
