var Angle = 0;
var BaseSize = 1;
var i = 16 - ((Frame / 60) % 1);

while (i > -4)
{
    var Size = power(BaseSize - (i * (1/3)), 1.5);
    Angle = (15 * i) + (Frame % 360);
    
    if (Size > 0)
        draw_sprite_ext(sSpiralBackground, 0, 320, 160, Size, Size, Angle, c_white, 1);
    
    i--;
}

Frame++;
