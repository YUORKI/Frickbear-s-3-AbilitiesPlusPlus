DrawDepth = 50;
Size += ((2 - Size) / 20);
x += XSpeed;
y += YSpeed;
YSpeed += 1;

if (y > 1472)
    instance_destroy();

image_index = Color;
image_xscale = Size;
image_yscale = Size;
