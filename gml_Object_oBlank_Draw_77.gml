var AI = global.AILevels[ID];
depth = 2;

if (AI > 0 && !instance_exists(oBlank_PaperStack))
{
    with (instance_create_layer(1486, 1160, "OnWall", oBlank_PaperStack))
        sprite_index = other.SPRITE_PaperStack;
}

set_target_to_ui();

if (!global.PanelUp)
    PaperUp = false;

var PageWidth = 320;
var PageHeight = 360;
var CanvasX = 176;
var CanvasY = 16;
var CanvasWidth = PageWidth - 32;
var CanvasHeight = PageHeight - 32;
var BaseY = lerp(460, 0, TransitionPercent);
var OffsetX = global.MouseX - CanvasX;
var OffsetY = global.MouseY - CanvasY - BaseY;
var CurrentImage = DrawingOrder[PagesCompleted];
var ImgDifficulty = lerp(0, 2, AI / 20);
ImgDifficulty = (PagesCompleted % 2) ? floor(ImgDifficulty) : round(ImgDifficulty);
smooth_x = lerp(smooth_x, global.MouseX - CanvasX, factor);
smooth_y = lerp(smooth_y, global.MouseY - CanvasY - BaseY, factor);

if (!surface_exists(UI_surf))
{
    UI_surf = surface_create(PageWidth, PageHeight);
    surface_set_target(UI_surf);
    draw_clear_alpha(c_black, 0);
    draw_sprite(SPRITE_Paper, 0, 0, 0);
    draw_sprite(SPRITE_Templates, CurrentImage, 16, 16);
    draw_set_font(global.FontHanddrawn);
    draw_set_halign(fa_right);
    draw_text_color(PageWidth - 24, PageHeight - 42, string("{0}/{1}", PagesCompleted + 1, TotalPages), c_black, c_black, c_black, c_black, 1);
    draw_set_halign(fa_left);
    surface_reset_target();
}

if (!surface_exists(canvas_surf))
{
    canvas_surf = surface_create(CanvasWidth, CanvasHeight);
    surface_set_target(canvas_surf);
    draw_clear_alpha(c_black, 0);
    surface_reset_target();
}

if (!surface_exists(sketch_surf))
{
    sketch_surf = surface_create(CanvasWidth, CanvasHeight);
    surface_set_target(sketch_surf);
    draw_clear_alpha(c_black, 0);
    draw_sprite_ext(SPRITE_TraceLines, (CurrentImage * 3) + ImgDifficulty, 0, 0, 1, 1, 0, c_white, 1);
    surface_reset_target();
}

if (mouse_check_button(mb_left) && BaseY < 2 && PaperUp)
{
    surface_set_target(canvas_surf);
    draw_circle_color(smooth_x, smooth_y, 2, c_red, c_red, false);
    draw_line_width_color(mouse_x_previous, mouse_y_previous, smooth_x, smooth_y, 4, c_red, c_red);
    surface_reset_target();
    
    if (PenSound == -1)
        PenSound = audio_play_sound(SOUND_Draw, 5, true);
    
    audio_sound_pitch(PenSound, lerp(1, point_distance(mouse_x_previous, mouse_y_previous, smooth_x, smooth_y) / 3, 0.5));
    audio_sound_gain(PenSound, point_distance(mouse_x_previous, mouse_y_previous, smooth_x, smooth_y) > 0, 0);
}
else if (PenSound != -1)
{
    audio_stop_sound(PenSound);
    PenSound = -1;
}

if (!rated)
{
    draw_surface(UI_surf, CanvasX - 16, (CanvasY - 16) + BaseY);
    draw_surface(sketch_surf, CanvasX, CanvasY + BaseY);
    draw_surface(canvas_surf, CanvasX, CanvasY + BaseY);
}

if (mouse_check_button_pressed(mb_left) && !clicked(CanvasX - 16, (CanvasY - 16) + BaseY, surface_get_width(UI_surf), surface_get_height(UI_surf)) && TransitionPercent > 0.25)
    global.PanelUp = false;

mouse_x_previous = smooth_x;
mouse_y_previous = smooth_y;
draw_sprite(SPRITE_Meter, 0, lerp(700, 640, TransitionPercent) - 16, 180);
draw_sprite(SPRITE_MeterPointer, 0, lerp(700, 640, TransitionPercent) - 32, 180 + lerp(142, -142, VisualScore / 100));
VisualScore += ((TotalScore - VisualScore) / 5);

if (TotalScore == 0)
    jumpscare(ID);

surface_reset_target();
TransitionSpeed = lerp(TransitionSpeed, ((!rated && PaperUp) - TransitionPercent) / 4, PaperUp ? 0.35 : 1);
TransitionPercent += TransitionSpeed;

if (rated && TransitionPercent < 0.1)
    instance_destroy();
