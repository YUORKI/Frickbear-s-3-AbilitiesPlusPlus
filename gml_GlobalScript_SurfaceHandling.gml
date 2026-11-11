function surfaceHandling(arg0, arg1, arg2, arg3, arg4)
{
    with (oOfficeSprite)
    {
        if (!sprite_exists(sprite_index))
            instance_destroy();
    }
    
    var Sort = true;
    
    var SortFunc = function(arg0, arg1)
    {
        var Object1 = layer_instance_get_instance(arg0);
        var Object2 = layer_instance_get_instance(arg1);
        
        if (!variable_instance_exists(Object1, "DrawDepth"))
            Object1.DrawDepth = 0;
        
        if (!variable_instance_exists(Object2, "DrawDepth"))
            Object2.DrawDepth = 0;
        
        return Object1.DrawDepth - Object2.DrawDepth;
    };
    
    surface_set_target(arg0);
    draw_clear_alpha(c_black, 0);
    var list = layer_get_all_elements("Background");
    var i;
    
    for (var insId = 0; insId < array_length(list); insId++)
    {
        i = layer_instance_get_instance(list[insId]);
        
        if (i.bbox_right >= arg3 && i.bbox_left <= (arg3 + sprite_get_width(arg1)) && i.bbox_bottom >= arg4 && i.bbox_top <= (arg4 + sprite_get_height(arg1)))
            draw_sprite_ext(i.sprite_index, i.image_index, ((i.x - arg3) * 2) - (sprite_get_width(arg1) / 2), (sprite_get_height(arg1) * 1.5) - ((i.y - arg4) * 2), i.image_xscale * 2, i.image_yscale * -2, i.image_angle, i.image_blend, i.image_alpha);
    }
    
    if (Sorted)
    {
        list = List_BehindWall;
    }
    else
    {
        list = layer_get_all_elements("Behind_Wall");
        array_sort(list, SortFunc);
        List_BehindWall = list;
    }
    
    for (var insId = 0; insId < array_length(list); insId++)
    {
        i = layer_instance_get_instance(list[insId]);
        
        if (i.bbox_right >= arg3 && i.bbox_left <= (arg3 + sprite_get_width(arg1)) && i.bbox_bottom >= arg4 && i.bbox_top <= (arg4 + sprite_get_height(arg1)))
            draw_sprite_ext(i.sprite_index, i.image_index, ((i.x - arg3) * 2) - (sprite_get_width(arg1) / 2), (sprite_get_height(arg1) * 1.5) - ((i.y - arg4) * 2), i.image_xscale * 2, i.image_yscale * -2, i.image_angle, i.image_blend, i.image_alpha);
    }
    
    draw_sprite_ext(arg1, arg2, -sprite_get_width(arg1) / 2, sprite_get_height(arg1) * 1.5, 2, i.image_yscale * -2, 0, c_white, 1);
    var OldChallenges = [UnknownEnum.Value_1, UnknownEnum.Value_3, UnknownEnum.Value_0, UnknownEnum.Value_5, UnknownEnum.Value_8, UnknownEnum.Value_9, UnknownEnum.Value_10, UnknownEnum.Value_11, UnknownEnum.Value_13, UnknownEnum.Value_15, UnknownEnum.Value_17, UnknownEnum.Value_18, UnknownEnum.Value_20, UnknownEnum.Value_22, UnknownEnum.Value_23, UnknownEnum.Value_30, UnknownEnum.Value_31, UnknownEnum.Value_32, UnknownEnum.Value_33, UnknownEnum.Value_36];
    var NewChallenges = [UnknownEnum.Value_2, UnknownEnum.Value_4, UnknownEnum.Value_6, UnknownEnum.Value_7, UnknownEnum.Value_12, UnknownEnum.Value_14, UnknownEnum.Value_16, UnknownEnum.Value_19, UnknownEnum.Value_21, UnknownEnum.Value_24, UnknownEnum.Value_25, UnknownEnum.Value_26, UnknownEnum.Value_27, UnknownEnum.Value_28, UnknownEnum.Value_29, UnknownEnum.Value_34, UnknownEnum.Value_35, UnknownEnum.Value_37, UnknownEnum.Value_38, UnknownEnum.Value_39];
    
    if (arg3 == 576 && Data.IncludeChallengeStickers)
    {
        for (var s = 0; s < 20; s++)
        {
            if (!global.ClearedChallenges[OldChallenges[s]])
                continue;
            
            draw_sprite_ext(sCabinetStickers, s, ((585 - arg3) * 2) - (sprite_get_width(arg1) / 2), (sprite_get_height(arg1) * 1.5) - ((710 - arg4) * 2), 2, -2, 0, c_white, 1);
        }
    }
    
    if (arg3 == 1600 && Data.IncludeChallengeStickers)
    {
        for (var s = 0; s < 20; s++)
        {
            if (!global.ClearedChallenges[NewChallenges[s]])
                continue;
            
            draw_sprite_ext(sCabinetStickers4LD, s, ((1958 - arg3) * 2) - (sprite_get_width(arg1) / 2), (sprite_get_height(arg1) * 1.5) - ((555 - arg4) * 2), 2, -2, 0, c_white, 1);
        }
    }
    
    if (Sorted)
    {
        list = List_OnWall;
    }
    else
    {
        list = layer_get_all_elements("OnWall");
        array_sort(list, SortFunc);
        List_OnWall = list;
    }
    
    for (var insId = 0; insId < array_length(list); insId++)
    {
        i = layer_instance_get_instance(list[insId]);
        
        if (i.bbox_right >= arg3 && i.bbox_left <= (arg3 + sprite_get_width(arg1)) && i.bbox_bottom >= arg4 && i.bbox_top <= (arg4 + sprite_get_height(arg1)))
            draw_sprite_ext(i.sprite_index, i.image_index, ((i.x - arg3) * 2) - (sprite_get_width(arg1) / 2), (sprite_get_height(arg1) * 1.5) - ((i.y - arg4) * 2), i.image_xscale * 2, i.image_yscale * -2, i.image_angle, i.image_blend, i.image_alpha);
    }
    
    if (Sorted)
    {
        list = List_InFrontOfWall;
    }
    else
    {
        list = layer_get_all_elements("InFrontOf_Wall");
        array_sort(list, SortFunc);
        List_InFrontOfWall = list;
    }
    
    for (var insId = 0; insId < array_length(list); insId++)
    {
        i = layer_instance_get_instance(list[insId]);
        
        if (i.bbox_right >= arg3 && i.bbox_left <= (arg3 + sprite_get_width(arg1)) && i.bbox_bottom >= arg4 && i.bbox_top <= (arg4 + sprite_get_height(arg1)))
            draw_sprite_ext(i.sprite_index, i.image_index, ((i.x - arg3) * 2) - (sprite_get_width(arg1) / 2), (sprite_get_height(arg1) * 1.5) - ((i.y - arg4) * 2), i.image_xscale * 2, i.image_yscale * -2, i.image_angle, i.image_blend, i.image_alpha);
    }
    
    surface_reset_target();
    return surface_get_texture(arg0);
    Sorted = true;
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12,
    Value_13,
    Value_14,
    Value_15,
    Value_16,
    Value_17,
    Value_18,
    Value_19,
    Value_20,
    Value_21,
    Value_22,
    Value_23,
    Value_24,
    Value_25,
    Value_26,
    Value_27,
    Value_28,
    Value_29,
    Value_30,
    Value_31,
    Value_32,
    Value_33,
    Value_34,
    Value_35,
    Value_36,
    Value_37,
    Value_38,
    Value_39
}
