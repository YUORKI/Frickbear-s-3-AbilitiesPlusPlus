event_inherited();
x = 1344;
y = 1272;

for (var i = 0; i < round(9 / global.NightSpeedup); i++)
{
    with (instance_create_layer((x + 28) - (6 * i), y - 41, layer, oBonZapper_Life))
    {
        DrawDepth = other.DrawDepth + 1;
        sprite_index = oBon.SPRITE_Life;
    }
}

image_xscale = -1;
