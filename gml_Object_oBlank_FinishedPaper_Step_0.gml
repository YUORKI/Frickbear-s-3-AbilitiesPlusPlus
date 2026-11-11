x += XSpeed;
y += YSpeed;
YSpeed += 0.75;
image_angle += (XSpeed / 4);

if (y > 720)
    instance_destroy();
