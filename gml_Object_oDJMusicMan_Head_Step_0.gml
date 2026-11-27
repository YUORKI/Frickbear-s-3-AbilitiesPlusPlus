x = lerp(0, 0, HeadPos) + 256 + 1088;
y = lerp(-80, 224, HeadPos) + 448;
y = max(-80, y);
image_angle = (lerp(45 * AngleOffsetDirection, 0, HeadPos) + Turn + AngleOffset) * -1;
image_index = (TurnDir == 0) ? 0 : (sign_to_binary(TurnDir) + 1);

if (Success != 0)
    image_index = Success ? 3 : 4;

HeadPos += HeadPosSpeed;
HeadPosSpeed = lerp(HeadPosSpeed, (!Leaving - HeadPos) * (Leaving ? 0.05 : 0.1), Leaving ? 0.05 : 0.2);

if (HeadPosSpeed < 1 && AngleOffsetTarget == 180)
{
    AngleOffsetSpeed = 10;
    AngleOffsetTarget = 5;
}

if (Leaving)
    AngleOffsetTarget = 150;

AngleOffset += AngleOffsetSpeed;
AngleOffsetSpeed = lerp(AngleOffsetSpeed, (AngleOffsetTarget - AngleOffset) * (Leaving ? 0.05 : 0.1), Leaving ? 0.02 : 0.1);
Turn += (((TurnDir * -10) - Turn) / 4);
