if (global.AILevels[ID] <= 0)
    exit;

var SurfX = 880;
var SurfY = 32;
var TimeToDarkness = 600;

if (Active)
{
    global.Brightness = min(1, global.Brightness + (1 / TimeToDarkness));
    PoweroutTimer++;
}

if (PoweroutTimer <= 30 && !Active)
{
    if (PoweroutTimer == 0)
        audio_play_sound(SOUND_PowerOn, 15, false, 0.5);
    
    global.Brightness = random_range(0.5, 2);
    
    if (PoweroutTimer == 30)
        global.Brightness = global.BaseBrightness;
    
    PoweroutTimer++;
}

TimeToAttack -= 0.016666666666666666;

if (!Active)
{
    WarningTimer = 0;
    
    if (TimeToAttack <= 0 && global.AILevels[UnknownEnum.Value_56] > 0)
        initialize();
    
    if (PanelOffset <= -299)
        exit;
}

WarningTimer = (WarningTimer + 1) % 60;
ShowWarning = floor(WarningTimer / 15) % 2;

if (!(global.MonitorSystem == "Cameras" && global.CamUp && global.Cam == TargetCam))
{
    if (PanelOpen)
    {
        PanelOpen = false;
        PanelOffset = -300;
        audio_play_sound(SOUND_Close, 5, false);
        
        if (WiresToSolve <= 0)
            TargetCam = 0;
    }
    
    exit;
}

if (character_active(UnknownEnum.Value_19))
    oPhantoms.CurrentCams[TargetCam] = 0;

if (!surface_exists(ElectroSurf))
    ElectroSurf = surface_create(400, 300);

surface_set_target(ElectroSurf);
draw_clear_alpha(c_black, 0);
var WindowX = 200;
var WindowY = PanelOffset;
draw_sprite(SPRITE_Window, 0, WindowX, WindowY);

switch (Animation)
{
    case 0:
        draw_sprite(SPRITE_PoseChew, anim_frame(current_frame(), 3, 2), WindowX, WindowY + 273);
        break;
    
    case 1:
        draw_sprite(SPRITE_PoseChill, anim_frame(current_frame(), 30, 2), WindowX + 173, WindowY + 273);
        break;
    
    case 2:
        draw_sprite(SPRITE_PoseCape, anim_frame(current_frame(), 10, 6), WindowX, WindowY + 273);
        break;
}

var MouseX = global.MouseX - 240;
var MouseY = global.MouseY - 32;

if (!PanelOpen)
{
    MouseX = -99;
    MouseY = -99;
}
else
{
    WarningTimer = 10;
}

var TopWireY = WindowY + 32;
var WireYSpace = round(lerp(32 * (4 / (WireCount - 1)), 32, 0.75));
var WireX = WindowX - 173;
var RightEndX = WindowX + 173;
var RightDepositX = RightEndX - 38;

if (DraggedWire != -1)
    MouseX = clamp(MouseX, WireX + 38, RightDepositX);

for (var wire = 0; wire < WireCount; wire++)
{
    var Deposited = DepositedWires[wire] > -1;
    var WireY = TopWireY + (WireYSpace * wire);
    var ButtonX = WireX + 38;
    var ButtonY = WireY;
    var EndX = ButtonX;
    var EndY = ButtonY;
    
    if (mouse_check_button_pressed(mb_left) && point_distance(ButtonX, ButtonY, MouseX, MouseY) < 16 && !Deposited)
    {
        DraggedWire = wire;
        audio_play_sound(SOUND_Select, 5, false, 1, 0, 0.95);
    }
    
    if (wire == DraggedWire)
    {
        EndX = MouseX;
        EndY = MouseY;
    }
    
    if (Deposited)
    {
        EndX = RightDepositX;
        EndY = TopWireY + (WireYSpace * DepositedWires[wire]);
    }
    
    if (point_distance(RightDepositX, ButtonY, MouseX, MouseY) < 16 && DraggedWire != -1)
    {
        if (LeftWireOrder[DraggedWire] == RightWireOrder[wire])
        {
            DepositedWires[DraggedWire] = wire;
            WireBounceSpeed[LeftWireOrder[DraggedWire]] = 2;
            DraggedWire = -1;
            WiresToSolve--;
            audio_play_sound(SOUND_Select, 5, false);
        }
        
        if (WiresToSolve <= 0)
        {
            PanelOpen = false;
            audio_play_sound(SOUND_Close, 5, false);
            audio_play_sound(SOUND_Solved, 5, false);
            set_time_to_attack();
            PoweroutTimer = 0;
            WarningTimer = 0;
            Active = false;
            block_tokens();
        }
    }
    
    var RightEndOffset = WireOffset[RightWireOrder[wire]];
    var LeftEndOffset = WireOffset[LeftWireOrder[wire]];
    draw_sprite_ext(SPRITE_WireBase, RightWireOrder[wire], RightEndX, WireY + RightEndOffset, -1, 1, 0, c_white, 1);
    draw_sprite(SPRITE_WireButton, 0, RightDepositX, ButtonY + RightEndOffset);
    draw_sprite(SPRITE_WireBase, LeftWireOrder[wire], WireX, WireY + LeftEndOffset);
    draw_sprite_ext(SPRITE_Wire, LeftWireOrder[wire], ButtonX, ButtonY + LeftEndOffset, point_distance(ButtonX, ButtonY, EndX, EndY) / 8, 1, point_direction(ButtonX, ButtonY, EndX, EndY), c_white, 1);
    ButtonXs[wire] = EndX;
    ButtonYs[wire] = EndY + LeftEndOffset;
    WireOffset[wire] += WireBounceSpeed[wire];
    WireBounceSpeed[wire] = lerp(WireBounceSpeed[wire], (0 - WireOffset[wire]) * 0.2, 0.25);
}

for (var wire = 0; wire < WireCount; wire++)
    draw_sprite(SPRITE_WireButton, 1, ButtonXs[wire], ButtonYs[wire]);

if (!mouse_check_button(mb_left))
    DraggedWire = -1;

surface_reset_target();
shader_set(TransparencyShader);
draw_surface(ElectroSurf, SurfX, SurfY);
shader_reset();
PanelSpeed = lerp(PanelSpeed, ((PanelOpen ? 0 : -300) - PanelOffset) * 0.2, PanelOpen ? 0.35 : 1);
PanelOffset += PanelSpeed;
depth = -1;

enum UnknownEnum
{
    Value_19 = 19,
    Value_56 = 56
}
