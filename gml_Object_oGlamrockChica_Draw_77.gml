if (!Hungry || global.CamUp || abs(angle_difference(oCamera.CameraRotation, 90)) > 90)
    exit;

set_target_to_ui();
BubbleSize = 1;
var BubblePos = world_to_screen(oCamera.x + 20, oCamera.y - 256, 350, oCamera.ViewMat, oCamera.ProjMat);
draw_sprite_ext(sGlamrockChica_SpeechBubble, 0, BubblePos[0], BubblePos[1] + SpeechBubbleOffset, ((32 * (ToppingCount - 1)) + 56) / -56, 1, 0, c_white, 1);

for (var i = 0; i < array_length(RequestedToppings); i++)
    draw_sprite(sGlamrockChica_Toppings, RequestedToppings[i], BubblePos[0] - (29 + (i * 32)), BubblePos[1] + 27 + SpeechBubbleOffset);

surface_reset_target();
show_debug_message($"Angle Diff: {angle_difference(oCamera.CameraRotation, 90)}");
SpeechBubbleOffset += SpeechBubbleOffsetSpeed;
SpeechBubbleOffsetSpeed = lerp(SpeechBubbleOffsetSpeed, (0 - SpeechBubbleOffset) * 0.2, 0.25);
