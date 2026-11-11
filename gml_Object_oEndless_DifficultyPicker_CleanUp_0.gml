if (sprite_exists(FaceSprites))
    sprite_delete(FaceSprites);

if (sprite_exists(BigFaceSprites))
    sprite_delete(BigFaceSprites);

surface_free(GuardSurf);
surface_free(DescSurf);
skin_sound_delete_array(VoiceLineID);
global.Difficulty = max(global.Difficulty, 0);
