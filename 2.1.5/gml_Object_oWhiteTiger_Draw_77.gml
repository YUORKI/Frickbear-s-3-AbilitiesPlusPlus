var AI = global.AILevels[UnknownEnum.Value_77];
depth = -100;
var HeadAngle = 235;
var TimeToLeave = lerp(60, 180, AI / 20) / lerp(1, global.NightSpeedup, 0.5);
var TimeToAppear = lerp(360 - (360 / global.NightSpeedup), 350 - TimeToLeave, RandomRange);

if (global.Timer >= TimeToAppear && global.Timer < (TimeToAppear + TimeToLeave) && Active == 0 && AI > 0)
{
    reverb_sound(choose_from_array(SOUND_Appear), 0, 0, false, 1.2);
    audio_play_sound(sfxSalvage_WireDrop, 8, false, 0.5, -0.5, 1.2);
    HeadTarget = 1;
    alarm[0] = 60;
    Active = true;
}

if (global.Timer >= (TimeToAppear + TimeToLeave) && Active == 1)
{
    reverb_sound(choose_from_array(SOUND_Leave), 0, 0, false, 1.2);
    audio_play_sound(sfxSalvage_WireDrop, 8, false, 0.5, -0.5, 1.6);
    HeadTarget = 0;
    alarm[0] = 15;
    Active = -1;
}

set_target_to_ui();
draw_sprite_ext(sWhiteTiger_Head, 0, 32 + (dsin(Frame) * 4) + lengthdir_x(lerp(-90, 1, HeadOffset), HeadAngle + 90), 32 + (dcos(Frame) * 4) + lengthdir_y(lerp(-90, 1, HeadOffset), HeadAngle + 90), 1, 1, HeadAngle + (dsin(Frame) * -5), c_white, 1);
draw_sprite_ext(sWhiteTiger_Arm, 0, -32 + (dsin(Frame * -2) * 8) + lerp(-256, 0, LimbOffset), 344 + (dcos(Frame * -2) * 4), -1, 1, dsin((Frame * 2) - 90) / 2, c_white, 1);
draw_sprite_ext(sWhiteTiger_Arm, 0, 662 + (dsin((Frame * 2) - 90) * 8) + lerp(256, 0, LimbOffset), 344 + (dcos((Frame * 2) - 90) * -4), 1, 1, dsin((Frame * 2) - 180), c_white, 1);
draw_sprite_ext(sWhiteTiger_Tail, 0, 664 + (dsin(Frame) * 4) + lerp(120, 0, LimbOffset), -4 + (dcos(Frame) * 4), 1, 1, (dsin(Frame) * 5) + 15, c_white, 1);
surface_reset_target();
Frame++;
HeadOffset += HeadOffsetSpeed;
HeadOffsetSpeed = lerp(HeadOffsetSpeed, (HeadTarget - HeadOffset) * 0.25, 0.25);
LimbOffset += LimbOffsetSpeed;
LimbOffsetSpeed = lerp(LimbOffsetSpeed, (LimbTarget - LimbOffset) * 0.25, 0.25);

enum UnknownEnum
{
    Value_77 = 77
}
