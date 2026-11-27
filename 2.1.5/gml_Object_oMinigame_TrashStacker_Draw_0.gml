if (room == Office)
{
    if (!global.CamUp || global.MonitorSystem != "Games")
        Paused = true;
}

if (!surface_exists(global.MinigameSurface))
    global.MinigameSurface = surface_create(160, 144);

var TexCLight = 13695200;
var TexC = 3354368;
surface_set_target(global.MinigameSurface);
draw_clear_alpha(c_black, 1);
draw_rectangle_color(0, 0, 160, 144, TexC, TexC, TexC, TexC, false);
var BoardX = 40;
var BoardY = 0;
draw_rectangle_color(BoardX, BoardY, BoardX + 80, BoardY + 144, TexCLight, TexCLight, TexCLight, TexCLight, true);
var PieceColors = [16777215, 10276685, 16745888, 5538767, 6014174, 5756069, 12149443, 5591248];

for (var _y = 22; _y < 40; _y++)
{
    for (var _x = 0; _x < BoardWidth; _x++)
    {
        var cell = Grid[(_y * BoardWidth) + _x];
        
        if (cell != 0)
        {
            var px = BoardX + (_x * 8);
            var py = BoardY + ((_y - 22) * 8);
            draw_sprite_ext(sTrashStacker_Blocks, cell, px, py, 1, 1, 0, c_white, 1);
        }
    }
}

if (!Dead && ActivePiece != -1)
{
    var shape = Pieces[ActivePiece];
    var size = array_length(shape);
    var GhostY = ActiveY;
    
    while (!check_collision(ActiveX, GhostY + 1, ActiveRot))
        GhostY++;
    
    for (var r = 0; r < size; r++)
    {
        for (var c = 0; c < size; c++)
        {
            var src_r, src_c;
            
            if (ActiveRot == 0)
            {
                src_r = r;
                src_c = c;
            }
            else if (ActiveRot == 1)
            {
                src_r = size - 1 - c;
                src_c = r;
            }
            else if (ActiveRot == 2)
            {
                src_r = size - 1 - r;
                src_c = size - 1 - c;
            }
            else if (ActiveRot == 3)
            {
                src_r = c;
                src_c = size - 1 - r;
            }
            
            var cell = shape[src_r][src_c];
            
            if (cell != 0)
            {
                var draw_x = BoardX + ((ActiveX + c) * 8);
                var ghost_draw_y = BoardY + (((floor(GhostY) + r) - 22) * 8);
                
                if (ghost_draw_y >= BoardY && floor(GhostY) != floor(ActiveY))
                    draw_sprite_ext(sTrashStacker_Blocks, 0, draw_x, ghost_draw_y, 1, 1, 0, c_white, 1);
                
                var active_draw_y = BoardY + (((floor(ActiveY) + r) - 22) * 8);
                
                if (active_draw_y >= BoardY)
                    draw_sprite(sTrashStacker_Blocks, cell, draw_x, active_draw_y);
            }
        }
    }
}

draw_set_font(global.FontGameboy);
draw_set_halign(fa_left);
draw_text_color(2, 4, "HOLD", TexCLight, TexCLight, TexCLight, TexCLight, 1);

if (HoldPiece != -1)
{
    var h_shape = Pieces[HoldPiece];
    var h_size = array_length(h_shape);
    
    for (var hr = 0; hr < h_size; hr++)
    {
        for (var hc = 0; hc < h_size; hc++)
        {
            var cell = h_shape[hr][hc];
            
            if (cell != 0)
            {
                var off_x = (h_size == 4) ? -4 : 0;
                draw_sprite(sTrashStacker_Blocks, cell, 8 + (hc * 8) + off_x, 16 + (hr * 8));
            }
        }
    }
}

draw_text_color(125, 4, "NEXT", TexCLight, TexCLight, TexCLight, TexCLight, 1);
var max_next = min(5, array_length(Bag));

for (var n = 0; n < max_next; n++)
{
    var n_piece = Bag[n];
    var n_shape = Pieces[n_piece];
    var n_size = array_length(n_shape);
    
    for (var nr = 0; nr < n_size; nr++)
    {
        for (var nc = 0; nc < n_size; nc++)
        {
            var cell = n_shape[nr][nc];
            
            if (cell != 0)
            {
                var off_x = (n_size == 4) ? -4 : 0;
                draw_sprite(sTrashStacker_Blocks, cell, 128 + (nc * 8) + off_x, 16 + (n * 24) + (nr * 8));
            }
        }
    }
}

var popup_y = 50;
draw_text_color(2, popup_y, ClearText, TexCLight, TexCLight, TexCLight, TexCLight, 1);

if (ClearAttack > 0)
{
    popup_y += 10;
    draw_text_color(2, popup_y, "(+" + string(ClearAttack) + ")", TexCLight, TexCLight, TexCLight, TexCLight, 1);
}

popup_y += 10;

if (Combo >= 2)
{
    draw_text_color(2, popup_y, "CMB" + string(Combo - 1), TexCLight, TexCLight, TexCLight, TexCLight, 1);
    popup_y += 10;
}

if (B2B > 1)
    draw_text_color(2, popup_y, "B2B" + string(B2B - 1), TexCLight, TexCLight, TexCLight, TexCLight, 1);

draw_text_color(2, 125, "PTS", TexCLight, TexCLight, TexCLight, TexCLight, 1);
var score_str = string(min(floor(Score / 10), 9999));
draw_text_color(2, 135, score_str, TexCLight, TexCLight, TexCLight, TexCLight, 1);

if (AllClearTimer > 0)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text_color(BoardX + 40, BoardY + 72, "ALL\nCLEAR", TexCLight, TexCLight, TexCLight, TexCLight, 1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}

if (Paused)
{
    draw_set_halign(fa_center);
    draw_rectangle_color(0, 64, 160, 80, TexC, TexC, TexC, TexC, false);
    draw_text_color(80, 69, "CLICK TO UNPAUSE", TexCLight, TexCLight, TexCLight, TexCLight, 1);
    draw_set_halign(fa_left);
}

surface_reset_target();
