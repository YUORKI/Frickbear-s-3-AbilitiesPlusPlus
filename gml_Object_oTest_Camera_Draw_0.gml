shader_reset();
draw_clear(c_black);
var Camera = camera_get_active();
x = WallSize / 2;
y = WallSize / 2;
depth = WallSize / 2;
var MouseY = (mouse_y * -1) + (room_height / 2);
var CamRotationH = Rotation;
var CamRotationV = depth + ((keyboard_check(ord("W")) - keyboard_check(ord("S"))) * 60);
var CamXToTarget = x - (dsin(CamRotationH) * 128);
var CamYToTarget = y - (dcos(CamRotationH) * 128);
var CamZToTarget = CamRotationV;
var CameraX = x;
var CameraY = y;
var CameraZ = depth;
CameraRotation = point_direction(CameraX, CameraY, CamXToTarget, CamYToTarget);
camera_set_view_mat(Camera, matrix_build_lookat(CameraX, CameraY, CameraZ, CamXToTarget, CamYToTarget, CamZToTarget, 0, 0, -1));
camera_set_proj_mat(Camera, matrix_build_projection_perspective_fov(FOV, 1.7777777777777777, 1, 32000));
camera_apply(Camera);
ViewMat = camera_get_view_mat(Camera);
ProjMat = camera_get_proj_mat(Camera);
var FlipAudio = global.Settings[3][UnknownEnum.Value_1] && global.TurnedAround;
var ModifiedRotation = lerp(CameraRotation, FlipAudio ? -90 : 90, 0.75);
audio_listener_position(x, y, depth);
audio_listener_orientation(-dcos(ModifiedRotation), -dsin(ModifiedRotation), 0, 0, 0, -1);
draw_set_font(global.FontW97Black);
draw_set_halign(fa_left);
FOV += ((keyboard_check_pressed(vk_up) - keyboard_check_pressed(vk_down)) / -10);
show_debug_message("FOV: " + string(FOV));
RotationSetting += ((keyboard_check_pressed(ord("D")) - keyboard_check_pressed(ord("A"))) * 90);
Rotation += RotationSpeed;
RotationSpeed = lerp(RotationSpeed, (RotationSetting - Rotation) * 0.25, 0.4);
shader_set(TransparencyShader);
var Texture = sprite_get_texture(sWallTestGrid, 0);
draw_3d_square(0, 0, WallSize, 0, 0, WallSize, WallSize, WallSize, WallSize, 0, 1, 1, Texture, Texture, Texture, Texture);
shader_reset();

enum UnknownEnum
{
    Value_1 = 1
}
