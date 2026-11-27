set_target_to_ui();
depth = 1;
var TopBins = floor(BinCount / 2);
var BottomBins = ceil(BinCount / 2);
var BinX = 320 + (((TopBins - 1) / 2) * -90);
var BinY = BinOffset - (TabletOffset + 8);
var PizzaX = 320;
var PizzaY = 360 - BinOffset;

if (PizzaGrabbed)
{
    PizzaX = global.MouseX;
    PizzaY = global.MouseY;
}

var LookedAt = abs(o3DMouse.x - 1344) < 128 && !global.CamUp && !global.TurnedAround;
var AngleShift = irandom_range(-2, 2) * PizzaGrabbed;
draw_sprite_ext(SPRITE_PizzaBase, 0, PizzaX, PizzaY, 1 / PizzaStretch, PizzaStretch, AngleShift, c_white, 1);

for (var i = 0; i < 7; i++)
{
    if (array_contains(ToppingsOnPizza, i))
        draw_sprite_ext(SPRITE_PizzaBase, i + 1, PizzaX, PizzaY, 1 / PizzaStretch, PizzaStretch, AngleShift, c_white, 1);
}

draw_sprite(SPRITE_ToppingBinHolder, 0, 275 + (((TopBins - 1) / 2) * -90), BinOffset);
draw_sprite(SPRITE_ToppingBinHolder, 0, 365 + (((TopBins - 1) / 2) * 90), BinOffset);
draw_sprite(SPRITE_ToppingBinHolder, 0, 275 + (((BottomBins - 1) / 2) * -90), BinOffset + 42);
draw_sprite(SPRITE_ToppingBinHolder, 0, 365 + (((BottomBins - 1) / 2) * 90), BinOffset + 42);

for (var i = 0; i < BinCount; i++)
{
    draw_sprite(SPRITE_ToppingBins, i, BinX, BinY);
    
    if (Input == i)
    {
        DraggedTopping = i;
        audio_play_sound(SOUND_PizzaPluck, 10, false);
    }
    
    if (i == (TopBins - 1))
    {
        BinX = 320 + (((BottomBins - 1) / 2) * -90);
        BinY += 42;
    }
    else
    {
        BinX += 90;
    }
}

if (mouse_in_zone(233, 360 - BinOffset - 36, 174, 87))
{
    if (DraggedTopping >= 0)
    {
        audio_play_sound(SOUND_PizzaSplat, 10, false, 1, 0, random_range(1, 1.25));
        array_push(ToppingsOnPizza, DraggedTopping);
        PizzaStretchSpeed = -0.2;
        DraggedTopping = -1;
    }
    
    if (Input == 10)
    {
        PizzaStretchSpeed = -0.2;
        PizzaGrabbed = true;
        TabletUp = false;
    }
}

if (DraggedTopping >= 0)
{
    ToppingSize += ((1 - ToppingSize) / 4);
    draw_sprite_ext(SPRITE_Toppings, DraggedTopping, global.MouseX, global.MouseY, ToppingSize, ToppingSize, 0, c_white, 1);
}
else
{
    ToppingSize = 0;
}

if (!mouse_check_button(mb_left) && Input == -1)
{
    if (PizzaGrabbed)
    {
        if (oGlamrockChica.Hungry && LookedAt)
        {
            with (oGlamrockChica)
                eat_pizza(other.ToppingsOnPizza);
        }
        
        ToppingsOnPizza = [];
        PizzaGrabbed = false;
    }
    
    DraggedTopping = -1;
}

Input = -1;
PizzaStretch += PizzaStretchSpeed;
PizzaStretchSpeed = lerp(PizzaStretchSpeed, (1 - PizzaStretch) * 0.5, 0.3);
TabletOffsetSpeed = lerp(TabletOffsetSpeed, ((TabletUp ? 0 : 96) - TabletOffset) * 0.25, TabletUp ? 0.35 : 1);
TabletOffset += TabletOffsetSpeed;
surface_reset_target();
