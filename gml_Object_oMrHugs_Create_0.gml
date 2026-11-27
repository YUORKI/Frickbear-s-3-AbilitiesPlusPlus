ID = UnknownEnum.Value_58;
SPRITE_Office = skin_sprite(sMrHugs, ID, "sprite_01.png");
SOUND_Approach = skin_sound(sfxMrHugsApproach, ID, "sq_approach");
SOUND_Hit = skin_sound_generate_array([sfxPunch1, sfxPunch2, sfxPunch3], ID, "sq_hit");
SOUND_Slip = skin_sound(sfxCartoonHitSlip, ID, "sq_slip");

with (instance_create_layer(0, 0, "Behind_Wall", oMrHugs_Sprite))
    sprite_index = other.SPRITE_Office;

enum UnknownEnum
{
    Value_58 = 58
}
