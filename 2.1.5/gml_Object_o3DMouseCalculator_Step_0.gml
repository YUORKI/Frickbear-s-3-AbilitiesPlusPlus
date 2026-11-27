if (variable_instance_exists(oCamera, "ViewMat"))
{
    var MouseRay = screen_to_world(global.MouseX * (window_get_width() / 640), global.MouseY * (window_get_height() / 360), oCamera.ViewMat, oCamera.ProjMat);
    var LoopBreaker = 0;
    x = MouseRay[3];
    y = MouseRay[4];
    depth = MouseRay[5];
    
    while (place_meeting(x, y, oWall))
    {
        x += MouseRay[0];
        y += MouseRay[1];
        depth -= MouseRay[2];
        LoopBreaker++;
        
        if (LoopBreaker > 1024)
            break;
    }
    
    x = round(x);
    y = round(y);
    depth = round(depth);
}

var Wall = "???";
PointX = 1344;
PointY = 704;

function ApproximateEqual(arg0, arg1, arg2)
{
    if (abs(arg0 - arg1) <= arg2)
        return true;
    else
        return false;
}

if (ApproximateEqual(x, 608, 2))
{
    Wall = "LEFT";
    PointX = 832 - ((y - oCamera.y) * 0.9);
    PointY = 704 - ((depth - 256) * 0.9);
}

if (ApproximateEqual(y, -96, 2))
{
    Wall = "FRONT";
    PointX = 1344 - ((x - oCamera.x) * 0.9);
    PointY = 704 - ((depth - 256) * 0.9);
}

if (ApproximateEqual(x, 32, 2))
{
    Wall = "RIGHT";
    PointX = 1856 + ((y - oCamera.y) * 0.9);
    PointY = 704 - ((depth - 256) * 0.9);
}

if (ApproximateEqual(y, 480, 2))
{
    Wall = "BACK";
    PointX = 1344 - (x - oCamera.x);
    PointY = 1216 - ((depth - 256) * 0.9);
}

with (o3DMouse)
{
    x = other.PointX;
    y = other.PointY;
}
