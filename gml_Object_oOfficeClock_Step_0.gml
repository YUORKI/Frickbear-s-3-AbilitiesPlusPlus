image_index = 0;
sprite_index = sNOTHING;

with (MinuteHand)
{
    x = other.x;
    y = other.y;
    sprite_index = other.SpriteIndex;
    image_index = 1;
    image_angle = floor(global.Timer) * 6;
}

with (HourHand)
{
    x = other.x;
    y = other.y;
    sprite_index = other.SpriteIndex;
    image_index = 2;
    image_angle = floor(global.Timer) * 0.5;
}
