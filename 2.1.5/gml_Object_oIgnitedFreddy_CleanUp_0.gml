if (Head != -1)
{
    instance_destroy(Head);
    instance_destroy(Body);
    instance_destroy(LUpperArm);
    instance_destroy(RUpperArm);
    instance_destroy(LLowerArm);
    instance_destroy(RLowerArm);
    instance_destroy(Pelvis);
}

audio_stop_sound(Static);
clear_window(ID);
