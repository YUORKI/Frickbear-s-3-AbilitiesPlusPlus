ID = UnknownEnum.Value_71;
SPRITE_Head = skin_sprite(sMXES_Head, ID, ["sprite_01.png", "sprite_02.png"]);
SPRITE_Body = skin_sprite(sMXES_Body, ID, "sprite_03.png");
SPRITE_Glitch = skin_sprite(sMXES_Glitch, ID, get_sprite_filenames(4, 7));
SOUND_Zapped = skin_sound(sfxMXES_Zap, ID, "sq_zap");
SOUND_Rise = skin_sound(sfxMXES_Rise, ID, "sq_rise");
SOUND_Fall = skin_sound(sfxMXES_Fall, ID, "sq_fall");
TargetX = 0;
TargetY = 0;
Speed = 1;
CamWait = 1;
DestinationOrd = [];
DestinationNum = 0;
Size = 0;
SizeSpeed = 0;
FullSize = false;
InfectedCamera = -1;

function set_time_to_attack()
{
    WaitTime = lerp(60, 34, global.AILevels[UnknownEnum.Value_71] / 20) * random_range(0.8, 1.2);
}

set_time_to_attack();
WaitTime *= random_range(0.8, 1);

function startup()
{
    Speed = lerp(1, 2, global.AILevels[UnknownEnum.Value_71] / 20);
    CamWait = lerp(3, 1, global.AILevels[UnknownEnum.Value_71] / 20);
    Active = true;
    var InitialCamera = choose(3, 8, 7);
    var EndCamera = choose(4, 5);
    var MidCamera = (EndCamera == 5) ? choose(2, 6) : 2;
    DestinationOrd = [EndCamera, MidCamera, 1, InitialCamera];
    set_destination();
    x = TargetX;
    y = TargetY;
    infect_camera();
    Size = 0;
    SizeSpeed = 0.5;
    FullSize = true;
    instance_create_depth(0, 0, 1, oMXES_Animation);
}

function zap_behavior()
{
    FullSize = false;
    Active = false;
    set_time_to_attack();
    DestinationNum = 0;
    infect_camera();
    
    with (oMXES_Animation)
    {
        SquishSpeed = -0.1;
        ShockedFace = true;
        ShockedCam = global.Cam;
    }
}

function infect_camera()
{
    with (oCamButton)
        MXESInfected = CamNumber == other.DestinationNum;
    
    InfectedCamera = DestinationNum;
    audio_play_sound(SOUND_Zapped, 10, false, 0.5);
    fuzz_up(InfectedCamera);
}

function set_destination()
{
    if (DestinationNum == -1)
        jumpscare(UnknownEnum.Value_71, 0);
    
    WaitTime = CamWait;
    DestinationNum = array_pop(DestinationOrd);
    fuzz_up(InfectedCamera);
    InfectedCamera = 0;
    
    with (oCamButton)
    {
        MXESInfected = false;
        
        if (CamNumber == other.DestinationNum)
        {
            other.TargetX = x + 24;
            other.TargetY = BaseY + 11;
        }
    }
    
    audio_play_sound(SOUND_Rise, 10, false, 0.5);
    FullSize = false;
    
    if (DestinationNum == undefined)
    {
        TargetX = oCameraUI.x + 119;
        TargetY = oCameraUI.y + 267;
        DestinationNum = -1;
        exit;
    }
}

AnimFrame = 1;
Active = false;

enum UnknownEnum
{
    Value_71 = 71
}
