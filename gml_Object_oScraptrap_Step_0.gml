var AI = global.AILevels[ID];

if ((TimeToKill + global.Timer) >= 360 && AI > 0 && array_length(Tasks) > 0)
    jumpscare(ID, 0);

if (!instance_exists(oControlPanel))
{
    with (instance_create_layer(1488, 1234, "OnWall", oControlPanel))
        image_xscale = -1;
}
