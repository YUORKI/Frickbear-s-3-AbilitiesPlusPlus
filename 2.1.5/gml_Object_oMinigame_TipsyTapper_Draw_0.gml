if (!surface_exists(global.MinigameSurface))
    global.MinigameSurface = surface_create(160, 144);

surface_set_target(global.MinigameSurface);
draw_clear_alpha(c_black, 0);

if (Initialize)
{
    instance_destroy(oTT_Customer);
    instance_destroy(oTT_Mug);
    carnie_check();
    Score = 0;
    CustomersPerAlley = array_create(4, 0);
    Paused = true;
    CrackX = -8;
    CrackY = -8;
    DeathFrames = 0;
    DrinkFill = 0;
    Alley = 0;
    ThrowFrames = 0;
    CustomerSpawnTimer = 1;
    Score = 0;
    TipsyX = 0;
    TipsyY = 0;
    LastAlley = -1;
    CustomersSpawned = 0;
    CustomersPerAlley = array_create(4, 0);
    CustomerIdentities = array_shuffle(CustomerIdentities);
    Initialize = false;
}

var MenuOpen = true;

if (room == Office)
{
    if (global.MonitorSystem != "Games" || !global.CamUp)
    {
        Paused = true;
        MenuOpen = false;
    }
}

if (Paused && (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right)) && mouse_in_minigame_window() && MenuOpen)
{
    Paused = false;
    mouse_clear(mb_left);
    mouse_clear(mb_right);
}

if (input_check_pressed(UnknownEnum.Value_0) && MenuOpen)
    Paused = !Paused;

Running = !Paused && DeathFrames <= 0;
var MousedAlley = clamp(floor(minigame_mouse_y() / 32), 0, 3);

if (MousedAlley != Alley && Running)
{
    ThrowFrames = 0;
    Alley = MousedAlley;
}

draw_sprite(sTT_BG, 0, 0, 0);
TipsyX += (((104 + (8 * Alley)) - TipsyX) / 1);
TipsyY += (((26 + (32 * Alley)) - TipsyY) / 1);
var TipsyImage = 0;

if (Running)
{
    if (((mouse_check_button(mb_right) || mouse_check_button(mb_left)) && DrinkFill > 0) || ((mouse_check_button_pressed(mb_right) || mouse_check_button_pressed(mb_left)) && DrinkFill == 0))
    {
        var WasFull = DrinkFill == 1;
        
        if (DrinkFill == 0)
            audio_play_sound(sfxBitPlace, 2, false);
        
        DrinkFill = min(DrinkFill + (1/15), 1);
        
        if (DrinkFill == 1 && !WasFull)
            audio_play_sound(sfxBitThud, 2, false, 0.5, 0, 1.5);
        
        TipsyImage = 1;
    }
    else if (DrinkFill == 1)
    {
        audio_play_sound(sfxBitDash, 2, false);
        DrinkFill = 0;
        ThrowFrames = 15;
        
        with (instance_create_depth(TipsyX - 8, TipsyY + 6, depth, oTT_Mug))
        {
            Alley = other.Alley;
            Speed = -3;
        }
    }
    
    if (ThrowFrames > 0)
    {
        TipsyImage = 2;
        ThrowFrames--;
    }
}

if (DeathFrames > 0)
    TipsyImage = 3;

draw_sprite(sTT_Tipsy, TipsyImage, TipsyX + ((DeathFrames > 60) ? binary_to_sign(floor(DeathFrames / 2) % 2) : 0), TipsyY);

if (DrinkFill > 0)
{
    var MugX = TipsyX + 12;
    var MugY = TipsyY - 2;
    draw_sprite(sTT_Mug, 0, MugX, MugY);
    draw_sprite_part(sTT_Mug, 4, 0, 3 + (10 * (1 - DrinkFill)), 16, 10 * DrinkFill, MugX - 8, (MugY - 5) + ((1 - DrinkFill) * 10));
}

for (var i = 0; i < instance_number(oTT_Customer); i++)
{
    var Object = instance_find(oTT_Customer, i);
    draw_sprite(GuardSprite, Object.image_index + (Object.Identity * 4), round(Object.x), round(Object.y));
    
    if (Object.Drinking > 0)
        draw_sprite(sTT_Mug, 5, round(Object.x) + 4, round(Object.y) - 1);
    else
        draw_sprite(sTT_Mug, 6, round(Object.x), round(Object.y) - 16);
}

draw_sprite(sTT_BG, 1, 0, 0);

for (var i = 0; i < instance_number(oTT_Mug); i++)
{
    var Object = instance_find(oTT_Mug, i);
    draw_sprite(sTT_Mug, Object.image_index, round(Object.x), round(Object.y));
}

if (Running)
{
    moon_passive_gain();
    CustomerSpawnTimer -= 0.016666666666666666;
    
    if (!instance_exists(oTT_Customer))
        CustomerSpawnTimer = 0;
    
    if (CustomerSpawnTimer <= 0 && instance_number(oTT_Customer) < 8)
    {
        var StartPos = round(lerp(8, 24, min(Score / 100, 1)));
        var SpawnsAtATime = clamp(1 + round(random_range(floor(Score / 10), Score / 10)), 1, 4);
        var PushPower = round(lerp(48, 24, min(Score / 100, 1)));
        
        for (var c = 0; c < SpawnsAtATime; c++)
        {
            var CustomerID = CustomerIdentities[CustomersSpawned++ % array_length(CustomerIdentities)];
            var BulkLikelihood = round(lerp(8, 1, min(Score / 100, 1)));
            var AlleyChosen = irandom(3);
            
            if (CustomersPerAlley[AlleyChosen] >= 3)
                AlleyChosen = find_lowest_alley();
            
            with (instance_create_depth((-16 * SpawnsAtATime) + (c * 16), depth, -16, oTT_Customer))
            {
                Alley = AlleyChosen;
                PosTarget = StartPos + (16 * c);
                PushBack = PushPower;
                HP = (irandom(BulkLikelihood) == 0) ? 1 : 0;
                Identity = CustomerID;
            }
            
            CustomersPerAlley[AlleyChosen]++;
        }
        
        CustomerSpawnTimer = lerp(2, 1, min(Score / 100, 1)) * instance_number(oTT_Customer);
    }
}

for (var i = 0; i < instance_number(oTT_Customer); i++)
{
    var Object = instance_find(oTT_Customer, i);
    
    if (Object.Drinking <= 0)
        draw_sprite(sTT_Mug, 6, round(Object.x), round(Object.y - 16));
}

draw_set_halign(fa_right);
draw_set_font(global.FontGameboy);
draw_text(160, 0, Score);
draw_set_halign(fa_left);

if (Paused)
{
    var TexC = 3354368;
    var TexCLight = 13695200;
    draw_set_halign(fa_center);
    draw_rectangle_color(0, 64, 160, 80, TexC, TexC, TexC, TexC, false);
    draw_text_color(80, 69, "PAUSED", TexCLight, TexCLight, TexCLight, TexCLight, 1);
    draw_set_halign(fa_left);
    draw_set_font(global.FontW97Black);
    surface_reset_target();
    exit;
}

if (DeathFrames > 0)
{
    DeathFrames--;
    draw_sprite(sTT_Mug, 7, CrackX, CrackY);
    
    if (DeathFrames == 0)
        Initialize = true;
}

surface_reset_target();

enum UnknownEnum
{
    Value_0
}
