if (!ImageApplied)
{
    if (global.SkinsFunctional[AnimatronicID] > -1)
    {
        CustomSprite = skin_sprite(sMaze_Animatronics_Backup, AnimatronicID, "salvage.png");
        Height = DepthOffset + skin_get_attribute(AnimatronicID, "SalvageLocation_Height", get_animatronic_height(AnimatronicID));
    }
    
    ImageApplied = true;
}

if (Text != "Destroy")
{
    image_angle = point_direction(x, y, oCamera3DMaze.x, oCamera3DMaze.y) + 90;
    image_xscale = sprite_get_width(Sprite) / 32;
    var FrameEstimate = round((Frame * 180) / 15) * 15;
    var WidthMultiplier = 1 + (dcos(FrameEstimate) / 25);
    var HeightMultiplier = 1 / WidthMultiplier;
    var x1 = x - lengthdir_x((sprite_width * WidthMultiplier) / 1.5, image_angle);
    var y1 = y - lengthdir_y((sprite_width * WidthMultiplier) / 1.5, image_angle);
    var x2 = x + lengthdir_x((sprite_width * WidthMultiplier) / 1.5, image_angle);
    var y2 = y + lengthdir_y((sprite_width * WidthMultiplier) / 1.5, image_angle);
    shader_set(TransparencyShader);
    var Columns = 10;
    var Rows = 10;
    var Texture = sprite_get_texture(sMaze_Animatronics, 0);
    var TextureX = (AnimatronicID % Columns) / Columns;
    var TextureY = floor(AnimatronicID / Columns) / Rows;
    
    if (CustomSprite != -1)
    {
        Rows = 1;
        Columns = 1;
        Texture = sprite_get_texture(CustomSprite, 0);
        TextureX = 0;
        TextureY = 0;
    }
    
    VertexBuffer = vertex_create_buffer();
    vertex_begin(VertexBuffer, global.VertexFormat);
    vertex_set_point(VertexBuffer, x1, y1, DepthOffset + (128 * HeightMultiplier), TextureX, TextureY);
    vertex_set_point(VertexBuffer, x2, y2, DepthOffset, TextureX + (1 / Columns), TextureY + (1 / Rows));
    vertex_set_point(VertexBuffer, x1, y1, DepthOffset, TextureX, TextureY + (1 / Rows));
    vertex_set_point(VertexBuffer, x1, y1, DepthOffset + (128 * HeightMultiplier), TextureX, TextureY);
    vertex_set_point(VertexBuffer, x2, y2, DepthOffset, TextureX + (1 / Columns), TextureY + (1 / Rows));
    vertex_set_point(VertexBuffer, x2, y2, DepthOffset + (128 * HeightMultiplier), TextureX + (1 / Columns), TextureY);
    vertex_end(VertexBuffer);
    vertex_submit(VertexBuffer, pr_trianglelist, Texture);
    vertex_delete_buffer(VertexBuffer);
    shader_reset();
    Frame += 0.016666666666666666;
}
