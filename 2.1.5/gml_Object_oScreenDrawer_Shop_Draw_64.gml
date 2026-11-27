shader_set(shRecolor);
var Pal = Palettes[global.Shop];
replace_color(16777215, 10461087, 1248964, 0, Pal[0], Pal[1], Pal[2], Pal[3]);

if (surface_exists(global.UISurface))
    draw_surface_ext(global.UISurface, 0, 0, 1, 1, 0, c_white, 1);

shader_reset();
