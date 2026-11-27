VentX = irandom_range(-2, 2);
VentY = irandom_range(-1, 1);

function PositionTest(arg0, arg1)
{
    var Animatronic = get_animatronic_object(arg0);
}

Timer = 0;
x = (oCameraUI.x + 320 + (VentX * 80)) - 24;
y = (oCameraUI.y + 164 + (VentY * 80)) - 24;
BaseY = y;
