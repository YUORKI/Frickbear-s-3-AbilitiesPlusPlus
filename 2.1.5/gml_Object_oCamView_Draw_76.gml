depth = 100;

if (!surface_exists(global.CamSurface))
    global.CamSurface = surface_create(400, 300);

if (surface_get_target() != global.CamSurface)
{
    surface_set_target(global.CamSurface);
    draw_clear_alpha(c_black, 1);
}

draw_sprite(sprite_index, global.CamUp ? (global.Cam - 1) : (global.TVCam[0] - 1), 0, 0);
surface_reset_target();

if (!surface_exists(global.CamSurfaceAlt))
    global.CamSurfaceAlt = surface_create(400, 300);

if (surface_get_target() != global.CamSurfaceAlt)
{
    surface_set_target(global.CamSurfaceAlt);
    draw_clear_alpha(c_black, 1);
}

draw_sprite(sCameraViews, global.TVCam[1] - 1, 0, 0);
surface_reset_target();

while (!ds_priority_empty(depth_queue))
{
    var _item = ds_priority_delete_min(depth_queue);
    
    with (_item)
        event_perform(ev_other, ev_user1);
}

with (oCameraUI)
    event_perform(ev_other, ev_user1);

with (oFredTV)
    event_perform(ev_other, ev_user1);
