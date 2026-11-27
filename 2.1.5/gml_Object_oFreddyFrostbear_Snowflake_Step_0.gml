x += lengthdir_x(OwnSpeed, Direction);
y += lengthdir_y(OwnSpeed, Direction);
image_angle += OwnSpeed;
image_index = Image;

if (x > 656 || x < -16)
    instance_destroy();

if (y > 376 || y < -16)
    instance_destroy();
