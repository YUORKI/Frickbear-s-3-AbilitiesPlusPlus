if (AI <= 0)
    exit;

draw_set_font(global.FontHanddrawn);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
set_target_to_ui();
var BallX = 296;
var BallY = 24 - BallCounterOffset;
draw_sprite(SPRITE_Collectibles, 0, BallX, BallY);
draw_text(BallX + 24, BallY - 14, "x" + string(Ballz));
draw_set_font(global.FontW97Black);
surface_reset_target();
