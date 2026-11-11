if (ReturnToTitle)
{
    global.FourLayersDownMode = false;
    room_goto(TitleScreenMap);
}
else
{
    instance_create_depth(0, 0, depth, o4LD_Opening_MikeFalling);
}

instance_destroy();
