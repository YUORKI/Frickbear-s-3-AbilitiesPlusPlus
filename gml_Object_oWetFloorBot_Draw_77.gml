if (Dragged)
{
    set_target_to_ui();
    draw_sprite_ext(sWetFloorBot_Dragged, 0, DragX, DragY, 1 / Squish, Squish, Angle + random_range(-0.2, 0.2), c_white, 1);
    draw_sprite_ext(sWetFloorBot_Dragged, 1, DragX, DragY, 1 / Squish, Squish, Angle + random_range(-0.2, 0.2), c_white, global.Brightness);
    surface_reset_target();
}
