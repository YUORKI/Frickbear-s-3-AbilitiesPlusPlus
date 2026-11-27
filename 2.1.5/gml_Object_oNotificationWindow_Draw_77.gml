set_target_to_ui();
draw_stuff();
surface_reset_target();
var YSpeed = (YTarget - YOffset) / 10;
YOffset += YSpeed;
y += YSpeed;
Alpha -= 0.016666666666666666;

if (Alpha <= 0)
    instance_destroy();
