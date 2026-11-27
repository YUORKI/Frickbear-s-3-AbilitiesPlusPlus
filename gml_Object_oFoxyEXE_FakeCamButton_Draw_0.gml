draw_set_halign(fa_left);
draw_set_font(global.FontW97Black);
shader_set(TransparencyShader);
image_index = 0;
draw_self();
draw_text(x + 5, y + 1, "CAM " + string(CamNumber));
shader_reset();
