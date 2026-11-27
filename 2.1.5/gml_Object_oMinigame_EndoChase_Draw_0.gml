global.MinigameWindowScale = 1;

if (room == Office)
{
    if (!global.CamUp || global.MonitorSystem != "Games")
        Paused = true;
}

if (!surface_exists(global.MinigameSurface))
    global.MinigameSurface = surface_create(320, 288);

var TexCLight = 13695200;
var TexC = 3354368;
surface_set_target(global.MinigameSurface);
draw_clear_alpha(#002F33, 1);
var MazeWidth = sprite_get_width(sEndoChase_MazeHitbox);
var MazeHeight = sprite_get_height(sEndoChase_MazeHitbox);
var MazePixelWidth = oEndoChase_Hitbox.sprite_width;
var MazePixelHeight = oEndoChase_Hitbox.sprite_height;
CameraX = clamp(oEndoChase_Player.x, 152, MazePixelWidth - 152);
CameraY = clamp(oEndoChase_Player.y, 136, MazePixelHeight - 136);
var Tile = 0;
var LightsOn = LightsOnTimer > 0;
var Flicker = false;

if (floor(FlickerTimer / 5) % 2)
    Flicker = true;

if (LightsOnTimer <= 180 && floor(LightsOnTimer / ((LightsOnTimer <= 60) ? 10 : 30)) % 2)
    Flicker = true;

var CamOffsetX = CameraX - 160;
var CamOffsetY = CameraY - 144;

for (var Y = 0; Y < MazeHeight; Y++)
{
    for (var X = 0; X < MazeWidth; X++)
    {
        draw_sprite(LightsOn ? (Flicker ? sEndoChase_Walls_LightsMiddle : sEndoChase_Walls_LightsOn) : sEndoChase_Walls, WallSprites[Tile], (X * 16) - CamOffsetX, (Y * 16) - CamOffsetY);
        Tile++;
    }
}

for (var p = 0; p < instance_number(oEndoChase_Pellet); p++)
{
    Obj = instance_find(oEndoChase_Pellet, p);
    draw_sprite(Obj.sprite_index, Obj.image_index, Obj.x - CamOffsetX, Obj.y - CamOffsetY);
}

if (instance_exists(oEndoChase_BonusCupcake))
{
    Obj = oEndoChase_BonusCupcake;
    var VerticalOffset = abs(dsin((Obj.Frame * 90) / 8) * 4);
    
    if (Obj.Time > 180 || floor(Obj.Time / 5) % 2)
        draw_sprite(Obj.sprite_index, Obj.image_index, Obj.x - CamOffsetX, Obj.y - (CamOffsetY + VerticalOffset));
}

for (var p = 0; p < instance_number(oEndoChase_Enemy); p++)
{
    Obj = instance_find(oEndoChase_Enemy, p);
    draw_sprite(Obj.sprite_index, Obj.image_index, Obj.x - CamOffsetX, Obj.y - CamOffsetY);
}

var Obj = oEndoChase_Player;
draw_sprite(Obj.sprite_index, Obj.image_index, Obj.x - CamOffsetX, Obj.y - CamOffsetY);
draw_set_font(global.FontGameboy);

if (Paused)
{
    draw_set_halign(fa_center);
    draw_rectangle_color(0, 136, 320, 152, TexC, TexC, TexC, TexC, false);
    draw_text_color(160, 141, "CLICK TO UNPAUSE", TexCLight, TexCLight, TexCLight, TexCLight, 1);
    draw_set_halign(fa_left);
}

draw_set_halign(fa_left);
draw_rectangle_color(0, 272, 320, 288, TexC, TexC, TexC, TexC, false);
draw_text_color(2, 277, "SCORE: " + string(Score), TexCLight, TexCLight, TexCLight, TexCLight, 1);
draw_set_halign(fa_left);
surface_reset_target();
