set_target_to_ui();
var SpriteTop = 48 * SpriteDraw;
var SpriteHeight = 96 * SpriteDraw;
var Image = floor((Frame + 10) * 2) % 2;

if (SpriteDraw > 0)
{
    draw_set_alpha(0.5);
    draw_sprite_part(SPRITE_Grid, 2 + Image, 0, 48 - SpriteTop, 96, SpriteHeight, BallX - 32, BallY - SpriteTop);
    draw_sprite_part(SPRITE_Grid, 0 + Image, 0, 48 - SpriteTop, 96, SpriteHeight, 8, global.MouseY - SpriteTop);
    draw_sprite_part(SPRITE_Grid, 4 + Image, 0, 48 - SpriteTop, 96, SpriteHeight, 568, BunnyY - SpriteTop);
    draw_set_alpha(1);
    draw_sprite_part(SPRITE_Coffee, 2 + Image, 0, 48 - SpriteTop, 96, SpriteHeight, BallX - 32, BallY - SpriteTop);
    draw_sprite_part(SPRITE_Coffee, 0 + Image, 0, 48 - SpriteTop, 96, SpriteHeight, 8, global.MouseY - SpriteTop);
    draw_sprite_part(SPRITE_Coffee, 4 + Image, 0, 48 - SpriteTop, 96, SpriteHeight, 568, BunnyY - SpriteTop);
}

surface_reset_target();
