depth = 512;
z = depth;
ObjectWidth = 32 * image_xscale;
ObjectHeight = 32 * image_yscale;
x1 = x - ObjectWidth;
y1 = y - ObjectHeight;
x2 = x + ObjectWidth;
y2 = y - ObjectHeight;
x3 = x - ObjectWidth;
y3 = y + ObjectHeight;
x4 = x + ObjectWidth;
y4 = y + ObjectHeight;
WallScale = 1;
global.SurfaceF = surface_create(sprite_get_width(sOfficeWallFront) * WallScale, sprite_get_height(sOfficeWallFront) * WallScale);
global.SurfaceL = surface_create(sprite_get_width(sOfficeWallLeft) * WallScale, sprite_get_height(sOfficeWallLeft) * WallScale);
global.SurfaceB = surface_create(sprite_get_width(sOfficeWallBack) * WallScale, sprite_get_height(sOfficeWallBack) * WallScale);
global.SurfaceR = surface_create(sprite_get_width(sOfficeWallRight) * WallScale, sprite_get_height(sOfficeWallRight) * WallScale);
List_BehindWall = [];
List_OnWall = [];
List_InFrontOfWall = [];
Sorted = false;
SortTimer = 60;
var folders = get_folders("offices");
var ChosenSkin = global.SkinOffice;

if (global.RandomizeOffice)
    ChosenSkin = irandom_range(-1, array_length(folders) - 1);

var CurSkin = (ChosenSkin == -1) ? "foogle doogly foo" : folders[ChosenSkin];
var Dir = working_directory + "offices/" + CurSkin;
var BackupData = 
{
    FanPosition: [858, 210],
    ClockPosition: [77, 163],
    HonkHitboxPosition: [654, 300],
    HonkHitboxRadius: 6,
    ToyChica_CupcakePositions: [[10, 193], [93, 193], [723, 270], [1100, 183], [1402, 226]],
    Dreadbear_BowlPositions: [[21, 189], [1412, 222]],
    MinigamePalette: [13695200, 7389320, 5662772, 3354368],
    IncludeChallengeStickers: true
};
var struct = skin_data_from_directory(BackupData, Dir);
var names = struct_get_names(BackupData);

for (var i = 0; i < array_length(names); i++)
{
    var name = names[i];
    
    if (variable_struct_exists(struct, name))
        struct_set(BackupData, name, struct_get(struct, name));
}

Data = BackupData;

for (var i = 0; i < array_length(Data.MinigamePalette); i++)
{
    var Col = Data.MinigamePalette[i];
    
    if (is_array(Col))
        Data.MinigamePalette[i] = make_color_rgb(Col[0], Col[1], Col[2]);
}

SPRITE_WallLeft = skin_sprite_from_directory(sOfficeWallLeft, Dir, "wall_left.png");
SPRITE_WallFront = skin_sprite_from_directory(sOfficeWallFront, Dir, "wall_front.png");
SPRITE_WallRight = skin_sprite_from_directory(sOfficeWallRight, Dir, "wall_right.png");
SPRITE_WallBack = skin_sprite_from_directory(sOfficeWallBack, Dir, "wall_back.png");
SPRITE_BG = skin_sprite_from_directory(sOfficeWallOutside, Dir, ["outside_1.png", "outside_2.png"]);
SPRITE_DoorLeft = skin_sprite_from_directory(sDoor, Dir, "door_left.png");
SPRITE_DoorRight = skin_sprite_from_directory(sDoor, Dir, "door_right.png");
SPRITE_Clock = skin_sprite_from_directory(sSearchesUpFreddyClockForgetsTheL, Dir, ["clock_hourhand.png", "clock_minutehand.png"]);
SPRITE_Fan = skin_sprite_from_directory(sOfficeFan, Dir, ["fan_off.png", "fan_on1.png", "fan_on2.png"]);
SPRITE_Blinds = skin_sprite_from_directory(sWindowBlinds, Dir, ["windowblinds_right.png", "windowblinds_left.png"]);
SPRITE_TVOff = skin_sprite_from_directory(sTitleTex_TV, Dir, "tv.png");
SPRITE_TVOn = skin_sprite_from_directory(sTitleTex_TVAlt, Dir, "tv_on.png");
SPRITE_Animations = skin_sprite_from_directory_unlimited(sTVAnimations, Dir + "/tv_animations", "tv");
SPRITE_HangingDecor = skin_sprite_from_directory(sTitleTex_StarLine, Dir, "hangingdecoration.png");
SPRITE_Cameras = skin_sprite_from_directory(sCameraViews, Dir, ["cameras/cam01.png", "cameras/cam02.png", "cameras/cam03.png", "cameras/cam04.png", "cameras/cam05.png", "cameras/cam06.png", "cameras/cam07.png", "cameras/cam08.png"]);

with (oOfficeBackground)
    sprite_index = other.SPRITE_BG;

with (instance_find(oDoor, 0))
    sprite_index = other.SPRITE_DoorLeft;

with (instance_find(oDoor, 1))
    sprite_index = other.SPRITE_DoorRight;

with (oWindowBlinds)
    sprite_index = other.SPRITE_Blinds;

with (oCamView)
    sprite_index = other.SPRITE_Cameras;

var OrgX = 576;
var OrgY = 448;

with (instance_create_layer(OrgX + other.Data.ClockPosition[0], OrgY + other.Data.ClockPosition[1], "OnWall", oOfficeClock))
    SpriteIndex = other.SPRITE_Clock;

with (instance_create_layer(OrgX + other.Data.FanPosition[0], OrgY + other.Data.FanPosition[1], "OnWall", oOfficeFan))
    sprite_index = other.SPRITE_Fan;

with (instance_create_layer(OrgX + other.Data.HonkHitboxPosition[0], OrgY + other.Data.HonkHitboxPosition[1], "OnWall", oNoseHonkHitbox))
    Radius = other.Data.HonkHitboxRadius;

LeftBowlCoords = [OrgX + other.Data.Dreadbear_BowlPositions[0][0] + sprite_get_xoffset(sCandyBowl), OrgY + other.Data.Dreadbear_BowlPositions[0][1] + sprite_get_yoffset(sCandyBowl)];
RightBowlCoords = [OrgX + other.Data.Dreadbear_BowlPositions[1][0] + sprite_get_xoffset(sCandyBowl), OrgY + other.Data.Dreadbear_BowlPositions[1][1] + sprite_get_yoffset(sCandyBowl)];

with (oTitle_HangingDecor_Office)
    Sprite = other.SPRITE_HangingDecor;

NightMusic = -1;
HonkSound = sfxNoseHonk;
var file = "";

if (ChosenSkin != -1)
{
    switch (oCamera.SongID)
    {
        case musNight1:
            file = "night1.ogg";
            break;
        
        case musNight2:
            file = "night2.ogg";
            break;
        
        case musNight3:
            file = "night3.ogg";
            break;
        
        case musNight4:
            file = "night4.ogg";
            break;
        
        case musNight5:
            file = "night5.ogg";
            break;
        
        case musNight6:
            file = "night6.ogg";
            break;
        
        case musNightCustom1:
            file = "custom1.ogg";
            break;
        
        case musNightCustom2:
            file = "custom2.ogg";
            break;
        
        case musNightCustom3:
            file = "custom3.ogg";
            break;
        
        case musNightCustom4:
            file = "custom4.ogg";
            break;
        
        case musNightCustom5:
            file = "custom5.ogg";
            break;
        
        case musNightCustom6:
            file = "custom6.ogg";
            break;
        
        default:
            file = "DO NOT USE";
            break;
    }
    
    if (file != "DO NOT USE")
    {
        NightMusic = skin_sound_from_directory(oCamera.SongID, Dir + "/music", file);
        
        if (NightMusic != oCamera.SongID)
        {
            audio_stop_sound(oCamera.SongID);
            global.Music = audio_play_sound(NightMusic, 150, true, 0.3, 0);
        }
    }
    
    HonkSound = skin_sound_from_directory(sfxNoseHonk, Dir, "honk.ogg");
}

DeletionArray = [SPRITE_WallLeft, SPRITE_WallFront, SPRITE_WallRight, SPRITE_WallBack, SPRITE_BG, SPRITE_DoorLeft, SPRITE_DoorRight, SPRITE_Clock, SPRITE_Fan, SPRITE_Blinds, SPRITE_TVOff, SPRITE_TVOn, SPRITE_Animations, SPRITE_HangingDecor, SPRITE_Cameras];
