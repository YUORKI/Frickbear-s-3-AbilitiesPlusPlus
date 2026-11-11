shader_reset();
draw_clear(c_black);
var Camera = camera_get_active();
x = WallSize / 2;
y = WallSize / 2;
depth = WallSize / 2;
var MouseY = (mouse_y * -1) + (room_height / 2);
CamRotationH = (global.MouseX - (room_width / 2)) / 3;
CamRotationH = clamp(CamRotationH, -90, 90);

if (TransitioningOut)
    CamRotationH = TransitionSideLock * 90;

if (DoorwayFreeze)
    CamRotationH = 0;

var CamRotationV = depth + ((keyboard_check(ord("W")) - keyboard_check(ord("S"))) * 60);
var CamXToTarget = x - (dsin(CamRotationH) * 128);
var CamYToTarget = y - (dcos(CamRotationH) * 128);
var CamZToTarget = CamRotationV;
CameraX = x;
CameraY = y;
CameraZ = depth;
CameraXTo += ((CamXToTarget - CameraXTo) / 8);
CameraYTo += ((CamYToTarget - CameraYTo) / 8);
CameraZTo += ((CamZToTarget - CameraZTo) / 8);
CameraXTo += ShakeX;
CameraZTo += ShakeY;
CameraRotation = point_direction(CameraX, CameraY, CameraXTo, CameraYTo);
camera_set_view_mat(Camera, matrix_build_lookat(CameraX, CameraY, CameraZ, CameraXTo, CameraYTo, CameraZTo, 0, 0, -1));
camera_set_proj_mat(Camera, matrix_build_projection_perspective_fov(FOV, 1.7777777777777777, 1, 32000));
camera_apply(Camera);
ViewMat = camera_get_view_mat(Camera);
ProjMat = camera_get_proj_mat(Camera);
var ModifiedRotation = lerp(CameraRotation, 90, 0.75);
audio_listener_position(x, y, depth);
audio_listener_orientation(-dcos(ModifiedRotation), -dsin(ModifiedRotation), 0, 0, 0, -1);
draw_set_font(global.FontW97Black);
draw_set_halign(fa_left);
FOV += ((keyboard_check_pressed(vk_up) - keyboard_check_pressed(vk_down)) / -4);
show_debug_message("FOV: " + string(FOV));
RotationSetting += ((keyboard_check_pressed(ord("D")) - keyboard_check_pressed(ord("A"))) * 90);

if (!surface_exists(LeftWallSurf))
    LeftWallSurf = surface_create(sprite_get_width(sOfficeWallFront), sprite_get_height(sOfficeWallFront));

surface_set_target(LeftWallSurf);
draw_clear(c_black);
draw_sprite(sShopPicker_Door, PickedShops[0], 256, 135 - (315 * DoorOffset));
draw_sprite(sShopPicker_Wall, 1 + AngelMode, 0, 0);
surface_reset_target();

if (!surface_exists(CenterWallSurf))
    CenterWallSurf = surface_create(sprite_get_width(sOfficeWallFront), sprite_get_height(sOfficeWallFront));

surface_set_target(CenterWallSurf);
draw_clear(c_black);

if (ThirdShopAvailable)
{
    draw_sprite(sShopPicker_Door, PickedShops[2], 256, 135 - (315 * DoorOffset));
    draw_sprite(sShopPicker_Wall, 1, 0, 0);
}
else
{
    draw_sprite(sShopPicker_Wall, 0, 0, 0);
}

surface_reset_target();

if (!surface_exists(RightWallSurf))
    RightWallSurf = surface_create(sprite_get_width(sOfficeWallFront), sprite_get_height(sOfficeWallFront));

surface_set_target(RightWallSurf);
draw_clear(c_black);
draw_sprite(sShopPicker_Door, PickedShops[1], 256, 135 - (315 * DoorOffset));
draw_sprite(sShopPicker_Wall, 1 + AngelMode, 0, 0);
surface_reset_target();
DoorOffset += ((TransitioningOut - DoorOffset) / 5);
shader_set(TransparencyShader);
draw_3d_square(0, 0, WallSize, 0, 0, WallSize, WallSize, WallSize, 0, WallSize, 1, 1, surface_get_texture(CenterWallSurf), surface_get_texture(LeftWallSurf), surface_get_texture(CenterWallSurf), surface_get_texture(RightWallSurf));
shader_reset();
