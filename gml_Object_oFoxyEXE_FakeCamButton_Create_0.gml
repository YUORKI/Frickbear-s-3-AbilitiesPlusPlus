ButtPosition = irandom(6);

switch (ButtPosition)
{
    case 0:
    case 1:
    case 2:
        x = 16;
        break;
    
    case 3:
        x = 96;
        break;
    
    case 4:
    case 5:
    case 6:
        x = 177;
        break;
}

switch (ButtPosition)
{
    case 0:
        y = 65;
        break;
    
    case 1:
        y = 176;
        break;
    
    case 2:
        y = 209;
        break;
    
    case 3:
        y = 216;
        break;
    
    case 4:
        y = 120;
        break;
    
    case 5:
        y = 201;
        break;
    
    case 6:
        y = 234;
        break;
}

x += 640;
CamNumber = irandom_range(1, 8);
BaseY = y;
CharsOnCam = [];
y -= 360;
