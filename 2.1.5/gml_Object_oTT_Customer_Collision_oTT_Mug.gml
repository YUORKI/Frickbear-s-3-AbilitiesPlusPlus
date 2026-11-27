if (Drinking <= 0 && other.Speed < 0)
{
    audio_play_sound(sfxBitCrunch, 2, false);
    instance_destroy(other);
    Drinking = 2;
    PosTarget = round(x - (PushBack / ((HP > 0) ? 2 : ((HP < 0) ? 0.5 : 1))));
    HP--;
}
