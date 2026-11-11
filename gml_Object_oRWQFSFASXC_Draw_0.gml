var ID = UnknownEnum.Value_18;
var AI = global.AILevels[ID];

if (AI == 0)
    exit;

if (!audio_is_playing(SOUND_FadeIn))
{
    audio_sound_gain(SOUND_FadeIn, 0, 0);
    audio_sound_gain(SOUND_FadeOut, 0, 0);
    simple_sound(SOUND_FadeIn, x - oCamera.x, y - oCamera.y, true, 0.5);
    simple_sound(SOUND_FadeOut, x - oCamera.x, y - oCamera.y, true, 1);
}

Flashed = global.Flashlight && Anger > 0 && abs(o3DMouse.x - 1100) < 256 && !global.CamUp && !global.TurnedAround;
var ScaleSize = 0.5 * (0.75 + (Anger * 0.25));

function corrupt_offset()
{
    var CorruptionDegree = (1 / max(Anger, 0.25)) + (Flashed * 32);
    return random_range(1 - CorruptionDegree, 1 + CorruptionDegree);
}

if (Anger > 0)
{
    var SpriteWidth = sprite_get_width(SPRITE_Office);
    var SpriteHeightHalf = sprite_get_height(SPRITE_Office) / 2;
    var x1 = x + ((SpriteWidth / 2) * dcos(image_angle) * ScaleSize);
    var y1 = y + ((SpriteWidth / 2) * dsin(image_angle) * ScaleSize);
    var x2 = x - ((SpriteWidth / 2) * dcos(image_angle) * ScaleSize);
    var y2 = y - ((SpriteWidth / 2) * dsin(image_angle) * ScaleSize);
    var zTop = SpriteHeightHalf + (SpriteHeightHalf * ScaleSize);
    var zBottom = SpriteHeightHalf - (SpriteHeightHalf * ScaleSize);
    var TextureX = 0;
    var TextureWidth = 1;
    var CorruptionDegree = 0.01 / max(Anger, 0.25);
    var AlphaDegree = power(Anger, 1.5) * random_range(1 - CorruptionDegree, 1 + CorruptionDegree);
    
    if (Anger > 0)
        AlphaDegree = max(AlphaDegree, 0.1);
    
    audio_sound_gain(SOUND_FadeIn, AlphaDegree * Anger * Anger, 0);
    audio_sound_gain(SOUND_FadeOut, Anger * Flashed, 0);
    shader_set(TransparencyShaderAlpha);
    shader_set_uniform_f(shader_get_uniform(TransparencyShaderAlpha, "Alpha_Value"), AlphaDegree);
    x1 += corrupt_offset();
    x2 += corrupt_offset();
    y1 += corrupt_offset();
    y2 += corrupt_offset();
    zTop += corrupt_offset();
    zBottom += corrupt_offset();
    var Texture = sprite_get_texture(SPRITE_Office, Flashed);
    VertexBuffer = vertex_create_buffer();
    vertex_begin(VertexBuffer, global.VertexFormat);
    vertex_set_point(VertexBuffer, x1, y1, zTop, TextureX, 0);
    vertex_set_point(VertexBuffer, x2, y2, zBottom, TextureWidth, 1);
    vertex_set_point(VertexBuffer, x1, y1, zBottom, TextureX, 1);
    vertex_set_point(VertexBuffer, x1, y1, zTop, TextureX, 0);
    vertex_set_point(VertexBuffer, x2, y2, zBottom, TextureWidth, 1);
    vertex_set_point(VertexBuffer, x2, y2, zTop, TextureWidth, 0);
    vertex_end(VertexBuffer);
    vertex_submit(VertexBuffer, pr_trianglelist, Texture);
    vertex_delete_buffer(VertexBuffer);
    shader_reset();
}
else
{
    audio_sound_gain(SOUND_FadeIn, 0, 0);
    audio_sound_gain(SOUND_FadeOut, 0, 0);
}

var FadeSpeed = ((1 + (AI / 10)) / 3) * (1 + max(0, global.Temperature / 20));

if (Flashed)
{
    Anger -= (oCamera.FlashlightPower / 180);
    
    if (Anger <= 0)
        Anger = -0.5;
}
else
{
    Anger += (FadeSpeed / 1200);
}

Frame += 1;

if (Anger >= 1)
    jumpscare(ID, -1);

enum UnknownEnum
{
    Value_18 = 18
}
