if (Initialize)
    initialize();

var DoofImg = floor(Timer * 2) % 2;
Active = true && WinFrames == 0;

if (room == Office)
{
    if (global.MonitorSystem != "Games" || !global.CamUp)
        Active = false;
}

if (!surface_exists(global.MinigameSurface))
    global.MinigameSurface = surface_create(160, 144);

surface_set_target(global.MinigameSurface);
draw_clear_alpha(c_black, 0);
draw_set_font(global.FontGameboy);
draw_sprite(sDoofPix_BG, 0, 0, 0);
draw_set_halign(fa_right);
draw_text_color(68, 36, format_as_timer(Timer), #002F33, #002F33, #002F33, #002F33, 1);
draw_text_color(68, 44, round(VisualPoints), #002F33, #002F33, #002F33, #002F33, 1);
draw_set_halign(fa_left);

for (var r = 0; r < 10; r++)
{
    var TheseClues = HorizontalClues[r];
    
    for (var i = 0; i < array_length(TheseClues); i++)
        draw_sprite(sDoofPix_ClueNumber, TheseClues[i], 24 + (8 * (i + (5 - array_length(TheseClues)))), 56 + (8 * r));
}

for (var c = 0; c < 10; c++)
{
    var TheseClues = VerticalClues[c];
    
    for (var i = 0; i < array_length(TheseClues); i++)
        draw_sprite(sDoofPix_ClueNumber, TheseClues[i], 72 + (8 * c), 8 + (8 * (i + (5 - array_length(TheseClues)))));
}

var TouchedTiles = [];

if (!(mouse_check_button(mb_left) || mouse_check_button(mb_right)))
{
    MouseX = minigame_mouse_x();
    MouseY = minigame_mouse_y();
}

do
{
    MouseX += clamp(minigame_mouse_x() - MouseX, -4, 4);
    MouseY += clamp(minigame_mouse_y() - MouseY, -4, 4);
    
    for (var X = 0; X < 10; X++)
    {
        for (var Y = 0; Y < 10; Y++)
        {
            var TileXPos = 72 + (8 * X);
            var TileYPos = 56 + (8 * Y);
            var InternalTilePos = X + (Y * 10);
            
            if (custom_in_window(TileXPos, TileYPos, 8, 8, MouseX, MouseY) && MistakeFreeze <= 0 && Active)
            {
                if (((mouse_check_button(mb_left) && LastTile != InternalTilePos) || mouse_check_button_pressed(mb_left)) && TileStates[InternalTilePos] == 0)
                {
                    audio_play_sound(sfxBitCrunch, 5, false);
                    
                    if (WaitForClick)
                    {
                        WaitForClick = false;
                        
                        for (var rowX = 0; rowX < 10; rowX++)
                        {
                            var tileToClear = rowX + (Y * 10);
                            TileStates[tileToClear] = (Answer[tileToClear] == 0) ? 2 : 1;
                        }
                        
                        for (var columnY = 0; columnY < 10; columnY++)
                        {
                            var tileToClear = X + (columnY * 10);
                            TileStates[tileToClear] = (Answer[tileToClear] == 0) ? 2 : 1;
                        }
                        
                        WaitForClick = false;
                    }
                    else
                    {
                        TileStates[InternalTilePos] = 1;
                        
                        if (TileStates[InternalTilePos] != Answer[InternalTilePos])
                        {
                            MistakeFreeze = 1;
                            TileStates[InternalTilePos] = 2;
                            audio_play_sound(sfxBitPunish, 10, false);
                            moon_death_gain(0.5);
                            PointsLeft = max(PointsLeft - 10, 5);
                        }
                        
                        if (check_if_solved())
                        {
                            add_tokens(PointsLeft);
                            global.TokensPerMinigame[UnknownEnum.Value_13] += PointsLeft;
                            
                            if (global.HiScores[UnknownEnum.Value_13] < PointsLeft)
                                global.HiScores[UnknownEnum.Value_13] = PointsLeft;
                            
                            if (global.HiScoresOverall[UnknownEnum.Value_13] < PointsLeft)
                                global.HiScoresOverall[UnknownEnum.Value_13] = PointsLeft;
                            
                            if (PointsLeft == 60 && Timer <= 60)
                                get_trophy(UnknownEnum.Value_57);
                            
                            WinFrames = 3;
                        }
                        
                        LastTile = InternalTilePos;
                    }
                }
                else if (((mouse_check_button(mb_right) && LastTile != InternalTilePos) || mouse_check_button_pressed(mb_right)) && TileStates[InternalTilePos] != 1 && !WaitForClick)
                {
                    if (mouse_check_button_pressed(mb_right))
                        MarkMode = !TileStates[InternalTilePos] * 2;
                    
                    if (TileStates[InternalTilePos] != MarkMode)
                    {
                        audio_play_sound(sfxBitPlace, 5, false);
                        TileStates[InternalTilePos] = MarkMode;
                    }
                    
                    LastTile = InternalTilePos;
                }
            }
            
            draw_sprite(sDoofPix_Tile, TileStates[InternalTilePos], TileXPos, TileYPos);
            array_push(TouchedTiles, InternalTilePos);
            
            if (InternalTilePos == LastTile && MistakeFreeze > 0 && floor(MistakeFreeze * 10) % 2)
                draw_sprite(sDoofPix_Tile, 1, TileXPos, TileYPos);
        }
    }
}
until (point_distance(minigame_mouse_x(), minigame_mouse_y(), MouseX, MouseY) <= 0);

for (var tile = 0; tile < array_length(TouchedTiles); tile++)
    var InternalTilePos = TouchedTiles[tile];

if (MistakeFreeze > 0)
{
    MistakeFreeze -= 0.016666666666666666;
    DoofImg = 2;
}

if (WaitForClick)
{
    draw_text_color(81, 65, "CLICK", #002F33, #002F33, #002F33, #002F33, 1);
    draw_text_color(81, 73, "ANY", #002F33, #002F33, #002F33, #002F33, 1);
    draw_text_color(81, 81, "TILE", #002F33, #002F33, #002F33, #002F33, 1);
    draw_text_color(81, 89, "TO", #002F33, #002F33, #002F33, #002F33, 1);
    draw_text_color(81, 97, "START", #002F33, #002F33, #002F33, #002F33, 1);
}

if (WinFrames > 0)
{
    if (!(floor((WinFrames * 10) % 2) && WinFrames > 2.5))
        draw_sprite_ext(sDoofPix_Solutions, SolutionImg, 72, 56, 8, 8, 0, c_white, 1);
    
    draw_rectangle_color(7, 7, 152, 8 + string_height_ext(PuzzleNames[SolutionImg], 8, 144), #002F33, #002F33, #002F33, #002F33, false);
    draw_text_ext_color(8, 8, PuzzleNames[SolutionImg], 8, 144, #E0F8D0, #E0F8D0, #E0F8D0, #E0F8D0, 1);
}

if (!WaitForClick && Active)
{
    Timer += 0.016666666666666666;
    moon_passive_gain(0.5);
}

if (WinFrames > 0)
{
    WinFrames -= 0.016666666666666666;
    
    if (WinFrames == 0)
        Initialize = true;
    
    DoofImg = 3;
}

draw_sprite(sDoofpix_Doofas, DoofImg, 12, 10 + (10 * (DoofImg == 3)));
var PointChange = sign(PointsLeft - VisualPoints);

if (abs(PointChange) > 0 && VisualPoints % 2)
    audio_play_sound(sfxTick, 5, false);

VisualPoints += PointChange;
surface_reset_target();

enum UnknownEnum
{
    Value_13 = 13,
    Value_57 = 57
}
