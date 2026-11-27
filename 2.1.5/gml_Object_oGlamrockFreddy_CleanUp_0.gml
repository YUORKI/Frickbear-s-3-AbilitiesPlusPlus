instance_destroy(Body);
instance_destroy(Head);
instance_destroy(UpperArm);
instance_destroy(LowerArm);

with (oDoor)
    Bounce = false;

if (Voiceclip != -1)
    audio_stop_sound(Voiceclip);

clear_doorway(ID, Side);
