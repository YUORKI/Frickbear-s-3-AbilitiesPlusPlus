function countup_array(arg0, arg1 = 0)
{
    var returnArr = [];
    
    for (var i = arg1; i <= arg0; i++)
        array_push(returnArr, i);
    
    return returnArr;
}

function get_sorting_array_order(arg0)
{
    switch (arg0)
    {
        case UnknownEnum.Value_0:
            return [UnknownEnum.Value_0, UnknownEnum.Value_1, UnknownEnum.Value_2, UnknownEnum.Value_3, UnknownEnum.Value_4, UnknownEnum.Value_5, UnknownEnum.Value_10, UnknownEnum.Value_11, UnknownEnum.Value_12, UnknownEnum.Value_13, UnknownEnum.Value_6, UnknownEnum.Value_7, UnknownEnum.Value_8, UnknownEnum.Value_9, UnknownEnum.Value_16, UnknownEnum.Value_14, UnknownEnum.Value_15, UnknownEnum.Value_17, UnknownEnum.Value_18, UnknownEnum.Value_19, UnknownEnum.Value_20, UnknownEnum.Value_21, UnknownEnum.Value_22, UnknownEnum.Value_47, UnknownEnum.Value_48, UnknownEnum.Value_49, UnknownEnum.Value_23, UnknownEnum.Value_24, UnknownEnum.Value_51, UnknownEnum.Value_52, UnknownEnum.Value_26, UnknownEnum.Value_27, UnknownEnum.Value_28, UnknownEnum.Value_29, UnknownEnum.Value_53, UnknownEnum.Value_83, UnknownEnum.Value_54, UnknownEnum.Value_55, UnknownEnum.Value_25, UnknownEnum.Value_56, UnknownEnum.Value_30, UnknownEnum.Value_34, UnknownEnum.Value_63, UnknownEnum.Value_35, UnknownEnum.Value_33, UnknownEnum.Value_59, UnknownEnum.Value_32, UnknownEnum.Value_60, UnknownEnum.Value_61, UnknownEnum.Value_62, UnknownEnum.Value_57, UnknownEnum.Value_58, UnknownEnum.Value_31, UnknownEnum.Value_37, UnknownEnum.Value_38, UnknownEnum.Value_64, UnknownEnum.Value_66, UnknownEnum.Value_67, UnknownEnum.Value_68, UnknownEnum.Value_69, UnknownEnum.Value_70, UnknownEnum.Value_71, UnknownEnum.Value_73, UnknownEnum.Value_74, UnknownEnum.Value_75, UnknownEnum.Value_76, UnknownEnum.Value_77, UnknownEnum.Value_78, UnknownEnum.Value_50, UnknownEnum.Value_39, UnknownEnum.Value_65, UnknownEnum.Value_36, UnknownEnum.Value_86, UnknownEnum.Value_72, UnknownEnum.Value_84, UnknownEnum.Value_44, UnknownEnum.Value_80, UnknownEnum.Value_85, UnknownEnum.Value_45, UnknownEnum.Value_81, UnknownEnum.Value_79, UnknownEnum.Value_40, UnknownEnum.Value_41, UnknownEnum.Value_42, UnknownEnum.Value_43, UnknownEnum.Value_82, UnknownEnum.Value_46, UnknownEnum.Value_120, UnknownEnum.Value_121, UnknownEnum.Value_122, UnknownEnum.Value_123, UnknownEnum.Value_124, UnknownEnum.Value_125, UnknownEnum.Value_126, UnknownEnum.Value_127, UnknownEnum.Value_118, UnknownEnum.Value_119, UnknownEnum.Value_154, UnknownEnum.Value_129, UnknownEnum.Value_130, UnknownEnum.Value_131, UnknownEnum.Value_132, UnknownEnum.Value_133, UnknownEnum.Value_134, UnknownEnum.Value_141, UnknownEnum.Value_142, UnknownEnum.Value_143, UnknownEnum.Value_135, UnknownEnum.Value_139, UnknownEnum.Value_137, UnknownEnum.Value_140, UnknownEnum.Value_136, UnknownEnum.Value_138, UnknownEnum.Value_128, UnknownEnum.Value_155, UnknownEnum.Value_156, UnknownEnum.Value_157, UnknownEnum.Value_159, UnknownEnum.Value_160, UnknownEnum.Value_161, UnknownEnum.Value_162, UnknownEnum.Value_158, UnknownEnum.Value_164, UnknownEnum.Value_163, UnknownEnum.Value_167, UnknownEnum.Value_168, UnknownEnum.Value_165, UnknownEnum.Value_166, UnknownEnum.Value_169, UnknownEnum.Value_170, UnknownEnum.Value_171, UnknownEnum.Value_172, UnknownEnum.Value_175, UnknownEnum.Value_173, UnknownEnum.Value_174, UnknownEnum.Value_176, UnknownEnum.Value_177, UnknownEnum.Value_178, UnknownEnum.Value_179, UnknownEnum.Value_200, UnknownEnum.Value_201];
        
        case UnknownEnum.Value_1:
            return [UnknownEnum.Value_0, UnknownEnum.Value_1, UnknownEnum.Value_2, UnknownEnum.Value_3, UnknownEnum.Value_4, UnknownEnum.Value_5, UnknownEnum.Value_154, UnknownEnum.Value_160, UnknownEnum.Value_128, UnknownEnum.Value_200, UnknownEnum.Value_156, UnknownEnum.Value_10, UnknownEnum.Value_11, UnknownEnum.Value_12, UnknownEnum.Value_13, UnknownEnum.Value_6, UnknownEnum.Value_7, UnknownEnum.Value_8, UnknownEnum.Value_9, UnknownEnum.Value_16, UnknownEnum.Value_14, UnknownEnum.Value_15, UnknownEnum.Value_17, UnknownEnum.Value_18, UnknownEnum.Value_159, UnknownEnum.Value_162, UnknownEnum.Value_170, UnknownEnum.Value_157, UnknownEnum.Value_19, UnknownEnum.Value_20, UnknownEnum.Value_122, UnknownEnum.Value_123, UnknownEnum.Value_124, UnknownEnum.Value_125, UnknownEnum.Value_21, UnknownEnum.Value_22, UnknownEnum.Value_121, UnknownEnum.Value_155, UnknownEnum.Value_47, UnknownEnum.Value_48, UnknownEnum.Value_49, UnknownEnum.Value_23, UnknownEnum.Value_24, UnknownEnum.Value_50, UnknownEnum.Value_51, UnknownEnum.Value_25, UnknownEnum.Value_129, UnknownEnum.Value_179, UnknownEnum.Value_201, UnknownEnum.Value_135, UnknownEnum.Value_52, UnknownEnum.Value_26, UnknownEnum.Value_27, UnknownEnum.Value_28, UnknownEnum.Value_29, UnknownEnum.Value_53, UnknownEnum.Value_83, UnknownEnum.Value_163, UnknownEnum.Value_173, UnknownEnum.Value_54, UnknownEnum.Value_55, UnknownEnum.Value_56, UnknownEnum.Value_30, UnknownEnum.Value_34, UnknownEnum.Value_63, UnknownEnum.Value_35, UnknownEnum.Value_33, UnknownEnum.Value_57, UnknownEnum.Value_58, UnknownEnum.Value_131, UnknownEnum.Value_132, UnknownEnum.Value_133, UnknownEnum.Value_134, UnknownEnum.Value_59, UnknownEnum.Value_32, UnknownEnum.Value_60, UnknownEnum.Value_61, UnknownEnum.Value_62, UnknownEnum.Value_31, UnknownEnum.Value_141, UnknownEnum.Value_118, UnknownEnum.Value_130, UnknownEnum.Value_169, UnknownEnum.Value_37, UnknownEnum.Value_38, UnknownEnum.Value_64, UnknownEnum.Value_66, UnknownEnum.Value_67, UnknownEnum.Value_68, UnknownEnum.Value_69, UnknownEnum.Value_70, UnknownEnum.Value_161, UnknownEnum.Value_158, UnknownEnum.Value_71, UnknownEnum.Value_174, UnknownEnum.Value_140, UnknownEnum.Value_73, UnknownEnum.Value_74, UnknownEnum.Value_75, UnknownEnum.Value_76, UnknownEnum.Value_142, UnknownEnum.Value_77, UnknownEnum.Value_78, UnknownEnum.Value_171, UnknownEnum.Value_172, UnknownEnum.Value_65, UnknownEnum.Value_136, UnknownEnum.Value_39, UnknownEnum.Value_36, UnknownEnum.Value_86, UnknownEnum.Value_138, UnknownEnum.Value_175, UnknownEnum.Value_119, UnknownEnum.Value_139, UnknownEnum.Value_72, UnknownEnum.Value_84, UnknownEnum.Value_79, UnknownEnum.Value_40, UnknownEnum.Value_41, UnknownEnum.Value_42, UnknownEnum.Value_44, UnknownEnum.Value_80, UnknownEnum.Value_176, UnknownEnum.Value_85, UnknownEnum.Value_45, UnknownEnum.Value_177, UnknownEnum.Value_137, UnknownEnum.Value_81, UnknownEnum.Value_43, UnknownEnum.Value_82, UnknownEnum.Value_178, UnknownEnum.Value_168, UnknownEnum.Value_167, UnknownEnum.Value_127, UnknownEnum.Value_46, UnknownEnum.Value_143, UnknownEnum.Value_164, UnknownEnum.Value_165, UnknownEnum.Value_166, UnknownEnum.Value_120, UnknownEnum.Value_126];
        
        case UnknownEnum.Value_2:
            return [];
        
        case UnknownEnum.Value_4:
            return [UnknownEnum.Value_79, UnknownEnum.Value_40, UnknownEnum.Value_41, UnknownEnum.Value_42, UnknownEnum.Value_0, UnknownEnum.Value_1, UnknownEnum.Value_2, UnknownEnum.Value_3, UnknownEnum.Value_4, UnknownEnum.Value_154, UnknownEnum.Value_128, UnknownEnum.Value_200, UnknownEnum.Value_160, UnknownEnum.Value_156, UnknownEnum.Value_6, UnknownEnum.Value_7, UnknownEnum.Value_8, UnknownEnum.Value_9, UnknownEnum.Value_14, UnknownEnum.Value_10, UnknownEnum.Value_11, UnknownEnum.Value_12, UnknownEnum.Value_13, UnknownEnum.Value_16, UnknownEnum.Value_5, UnknownEnum.Value_15, UnknownEnum.Value_17, UnknownEnum.Value_18, UnknownEnum.Value_159, UnknownEnum.Value_162, UnknownEnum.Value_157, UnknownEnum.Value_170, UnknownEnum.Value_20, UnknownEnum.Value_19, UnknownEnum.Value_44, UnknownEnum.Value_80, UnknownEnum.Value_176, UnknownEnum.Value_122, UnknownEnum.Value_123, UnknownEnum.Value_124, UnknownEnum.Value_125, UnknownEnum.Value_21, UnknownEnum.Value_22, UnknownEnum.Value_121, UnknownEnum.Value_155, UnknownEnum.Value_50, UnknownEnum.Value_47, UnknownEnum.Value_48, UnknownEnum.Value_49, UnknownEnum.Value_23, UnknownEnum.Value_24, UnknownEnum.Value_85, UnknownEnum.Value_169, UnknownEnum.Value_25, UnknownEnum.Value_129, UnknownEnum.Value_51, UnknownEnum.Value_135, UnknownEnum.Value_179, UnknownEnum.Value_201, UnknownEnum.Value_52, UnknownEnum.Value_45, UnknownEnum.Value_177, UnknownEnum.Value_26, UnknownEnum.Value_27, UnknownEnum.Value_28, UnknownEnum.Value_29, UnknownEnum.Value_53, UnknownEnum.Value_83, UnknownEnum.Value_163, UnknownEnum.Value_173, UnknownEnum.Value_54, UnknownEnum.Value_55, UnknownEnum.Value_56, UnknownEnum.Value_36, UnknownEnum.Value_30, UnknownEnum.Value_34, UnknownEnum.Value_63, UnknownEnum.Value_35, UnknownEnum.Value_33, UnknownEnum.Value_57, UnknownEnum.Value_58, UnknownEnum.Value_59, UnknownEnum.Value_32, UnknownEnum.Value_60, UnknownEnum.Value_61, UnknownEnum.Value_62, UnknownEnum.Value_131, UnknownEnum.Value_132, UnknownEnum.Value_133, UnknownEnum.Value_134, UnknownEnum.Value_31, UnknownEnum.Value_141, UnknownEnum.Value_118, UnknownEnum.Value_130, UnknownEnum.Value_168, UnknownEnum.Value_167, UnknownEnum.Value_37, UnknownEnum.Value_38, UnknownEnum.Value_64, UnknownEnum.Value_136, UnknownEnum.Value_65, UnknownEnum.Value_39, UnknownEnum.Value_86, UnknownEnum.Value_138, UnknownEnum.Value_82, UnknownEnum.Value_175, UnknownEnum.Value_158, UnknownEnum.Value_66, UnknownEnum.Value_67, UnknownEnum.Value_68, UnknownEnum.Value_69, UnknownEnum.Value_70, UnknownEnum.Value_161, UnknownEnum.Value_46, UnknownEnum.Value_119, UnknownEnum.Value_137, UnknownEnum.Value_73, UnknownEnum.Value_171, UnknownEnum.Value_172, UnknownEnum.Value_139, UnknownEnum.Value_174, UnknownEnum.Value_71, UnknownEnum.Value_178, UnknownEnum.Value_43, UnknownEnum.Value_140, UnknownEnum.Value_72, UnknownEnum.Value_84, UnknownEnum.Value_74, UnknownEnum.Value_75, UnknownEnum.Value_76, UnknownEnum.Value_142, UnknownEnum.Value_77, UnknownEnum.Value_78, UnknownEnum.Value_120, UnknownEnum.Value_126, UnknownEnum.Value_143, UnknownEnum.Value_165, UnknownEnum.Value_166, UnknownEnum.Value_164, UnknownEnum.Value_81];
        
        case UnknownEnum.Value_3:
            return [UnknownEnum.Value_0, UnknownEnum.Value_1, UnknownEnum.Value_2, UnknownEnum.Value_3, UnknownEnum.Value_16, UnknownEnum.Value_14, UnknownEnum.Value_10, UnknownEnum.Value_11, UnknownEnum.Value_12, UnknownEnum.Value_13, UnknownEnum.Value_4, UnknownEnum.Value_5, UnknownEnum.Value_20, UnknownEnum.Value_6, UnknownEnum.Value_7, UnknownEnum.Value_8, UnknownEnum.Value_9, UnknownEnum.Value_15, UnknownEnum.Value_18, UnknownEnum.Value_33, UnknownEnum.Value_17, UnknownEnum.Value_19, UnknownEnum.Value_30, UnknownEnum.Value_32, UnknownEnum.Value_31, UnknownEnum.Value_37, UnknownEnum.Value_35, UnknownEnum.Value_21, UnknownEnum.Value_22, UnknownEnum.Value_23, UnknownEnum.Value_24, UnknownEnum.Value_36, UnknownEnum.Value_38, UnknownEnum.Value_34, UnknownEnum.Value_26, UnknownEnum.Value_27, UnknownEnum.Value_28, UnknownEnum.Value_29, UnknownEnum.Value_25, UnknownEnum.Value_39, UnknownEnum.Value_40, UnknownEnum.Value_41, UnknownEnum.Value_42, UnknownEnum.Value_43, UnknownEnum.Value_44, UnknownEnum.Value_45, UnknownEnum.Value_46];
        
        case UnknownEnum.Value_6:
            return [UnknownEnum.Value_64, UnknownEnum.Value_177, UnknownEnum.Value_50, UnknownEnum.Value_138, UnknownEnum.Value_134, UnknownEnum.Value_46, UnknownEnum.Value_179, UnknownEnum.Value_163, UnknownEnum.Value_3, UnknownEnum.Value_13, UnknownEnum.Value_125, UnknownEnum.Value_162, UnknownEnum.Value_127, UnknownEnum.Value_26, UnknownEnum.Value_35, UnknownEnum.Value_74, UnknownEnum.Value_174, UnknownEnum.Value_0, UnknownEnum.Value_10, UnknownEnum.Value_6, UnknownEnum.Value_122, UnknownEnum.Value_61, UnknownEnum.Value_131, UnknownEnum.Value_76, UnknownEnum.Value_42, UnknownEnum.Value_45, UnknownEnum.Value_34, UnknownEnum.Value_160, UnknownEnum.Value_140, UnknownEnum.Value_141, UnknownEnum.Value_43, UnknownEnum.Value_84, UnknownEnum.Value_85, UnknownEnum.Value_81, UnknownEnum.Value_137, UnknownEnum.Value_47, UnknownEnum.Value_75, UnknownEnum.Value_66, UnknownEnum.Value_48, UnknownEnum.Value_169, UnknownEnum.Value_171, UnknownEnum.Value_173, UnknownEnum.Value_62, UnknownEnum.Value_156, UnknownEnum.Value_70, UnknownEnum.Value_2, UnknownEnum.Value_12, UnknownEnum.Value_8, UnknownEnum.Value_124, UnknownEnum.Value_133, UnknownEnum.Value_22, UnknownEnum.Value_56, UnknownEnum.Value_161, UnknownEnum.Value_167, UnknownEnum.Value_143, UnknownEnum.Value_4, UnknownEnum.Value_37, UnknownEnum.Value_86, UnknownEnum.Value_155, UnknownEnum.Value_170, UnknownEnum.Value_20, UnknownEnum.Value_21, UnknownEnum.Value_63, UnknownEnum.Value_175, UnknownEnum.Value_19, UnknownEnum.Value_59, UnknownEnum.Value_68, UnknownEnum.Value_165, UnknownEnum.Value_166, UnknownEnum.Value_176, UnknownEnum.Value_58, UnknownEnum.Value_38, UnknownEnum.Value_119, UnknownEnum.Value_154, UnknownEnum.Value_142, UnknownEnum.Value_82, UnknownEnum.Value_41, UnknownEnum.Value_65, UnknownEnum.Value_7, UnknownEnum.Value_39, UnknownEnum.Value_129, UnknownEnum.Value_14, UnknownEnum.Value_44, UnknownEnum.Value_78, UnknownEnum.Value_29, UnknownEnum.Value_71, UnknownEnum.Value_15, UnknownEnum.Value_1, UnknownEnum.Value_11, UnknownEnum.Value_123, UnknownEnum.Value_132, UnknownEnum.Value_67, UnknownEnum.Value_130, UnknownEnum.Value_159, UnknownEnum.Value_23, UnknownEnum.Value_32, UnknownEnum.Value_17, UnknownEnum.Value_120, UnknownEnum.Value_83, UnknownEnum.Value_172, UnknownEnum.Value_27, UnknownEnum.Value_30, UnknownEnum.Value_31, UnknownEnum.Value_72, UnknownEnum.Value_51, UnknownEnum.Value_79, UnknownEnum.Value_55, UnknownEnum.Value_60, UnknownEnum.Value_118, UnknownEnum.Value_69, UnknownEnum.Value_9, UnknownEnum.Value_49, UnknownEnum.Value_28, UnknownEnum.Value_52, UnknownEnum.Value_168, UnknownEnum.Value_80, UnknownEnum.Value_16, UnknownEnum.Value_24, UnknownEnum.Value_158, UnknownEnum.Value_164, UnknownEnum.Value_178, UnknownEnum.Value_77, UnknownEnum.Value_139, UnknownEnum.Value_25, UnknownEnum.Value_5, UnknownEnum.Value_53, UnknownEnum.Value_54, UnknownEnum.Value_36, UnknownEnum.Value_40, UnknownEnum.Value_73, UnknownEnum.Value_128, UnknownEnum.Value_200, UnknownEnum.Value_57, UnknownEnum.Value_126, UnknownEnum.Value_33, UnknownEnum.Value_136, UnknownEnum.Value_121, UnknownEnum.Value_135, UnknownEnum.Value_157, UnknownEnum.Value_18, UnknownEnum.Value_201];
        
        case UnknownEnum.Value_5:
            return [UnknownEnum.Value_0, UnknownEnum.Value_10, UnknownEnum.Value_6, UnknownEnum.Value_122, UnknownEnum.Value_131, UnknownEnum.Value_66, UnknownEnum.Value_85, UnknownEnum.Value_27, UnknownEnum.Value_54, UnknownEnum.Value_30, UnknownEnum.Value_34, UnknownEnum.Value_38, UnknownEnum.Value_65, UnknownEnum.Value_4, UnknownEnum.Value_22, UnknownEnum.Value_155, UnknownEnum.Value_126, UnknownEnum.Value_17, UnknownEnum.Value_121, UnknownEnum.Value_33, UnknownEnum.Value_140, UnknownEnum.Value_61, UnknownEnum.Value_81, UnknownEnum.Value_1, UnknownEnum.Value_11, UnknownEnum.Value_7, UnknownEnum.Value_123, UnknownEnum.Value_47, UnknownEnum.Value_132, UnknownEnum.Value_20, UnknownEnum.Value_21, UnknownEnum.Value_63, UnknownEnum.Value_37, UnknownEnum.Value_86, UnknownEnum.Value_120, UnknownEnum.Value_71, UnknownEnum.Value_18, UnknownEnum.Value_55, UnknownEnum.Value_158, UnknownEnum.Value_82, UnknownEnum.Value_2, UnknownEnum.Value_12, UnknownEnum.Value_8, UnknownEnum.Value_124, UnknownEnum.Value_48, UnknownEnum.Value_133, UnknownEnum.Value_118, UnknownEnum.Value_69, UnknownEnum.Value_143, UnknownEnum.Value_46, UnknownEnum.Value_3, UnknownEnum.Value_13, UnknownEnum.Value_125, UnknownEnum.Value_134, UnknownEnum.Value_64, UnknownEnum.Value_9, UnknownEnum.Value_49, UnknownEnum.Value_28, UnknownEnum.Value_25, UnknownEnum.Value_36, UnknownEnum.Value_67, UnknownEnum.Value_76, UnknownEnum.Value_43, UnknownEnum.Value_178, UnknownEnum.Value_42, UnknownEnum.Value_141, UnknownEnum.Value_32, UnknownEnum.Value_60, UnknownEnum.Value_72, UnknownEnum.Value_62, UnknownEnum.Value_77, UnknownEnum.Value_44, UnknownEnum.Value_45, UnknownEnum.Value_137, UnknownEnum.Value_68, UnknownEnum.Value_179, UnknownEnum.Value_79, UnknownEnum.Value_59, UnknownEnum.Value_119, UnknownEnum.Value_50, UnknownEnum.Value_130, UnknownEnum.Value_39, UnknownEnum.Value_177, UnknownEnum.Value_57, UnknownEnum.Value_58, UnknownEnum.Value_40, UnknownEnum.Value_128, UnknownEnum.Value_200, UnknownEnum.Value_52, UnknownEnum.Value_5, UnknownEnum.Value_73, UnknownEnum.Value_129, UnknownEnum.Value_154, UnknownEnum.Value_14, UnknownEnum.Value_15, UnknownEnum.Value_23, UnknownEnum.Value_51, UnknownEnum.Value_135, UnknownEnum.Value_16, UnknownEnum.Value_24, UnknownEnum.Value_19, UnknownEnum.Value_26, UnknownEnum.Value_35, UnknownEnum.Value_138, UnknownEnum.Value_74, UnknownEnum.Value_53, UnknownEnum.Value_29, UnknownEnum.Value_56, UnknownEnum.Value_142, UnknownEnum.Value_84, UnknownEnum.Value_80, UnknownEnum.Value_70, UnknownEnum.Value_78, UnknownEnum.Value_31, UnknownEnum.Value_75, UnknownEnum.Value_139, UnknownEnum.Value_41, UnknownEnum.Value_201];
    }
}

function get_animatronic_role(arg0)
{
    if (arg0 >= UnknownEnum.Value_0 && arg0 <= 86)
        return ["Enemy", "Animatronic"];
    
    if (arg0 == UnknownEnum.Value_118 || arg0 == UnknownEnum.Value_119 || arg0 == UnknownEnum.Value_154)
        return ["Enemy", "Jumpscarer"];
    
    if (arg0 >= UnknownEnum.Value_120 && arg0 <= UnknownEnum.Value_127)
        return ["Enemy", "Boss"];
    
    if (arg0 >= UnknownEnum.Value_129 && arg0 <= UnknownEnum.Value_143)
        return ["NPC", "Shopkeeper"];
    
    if (array_contains([UnknownEnum.Value_158, UnknownEnum.Value_155, UnknownEnum.Value_156, UnknownEnum.Value_128, UnknownEnum.Value_200], arg0))
        return ["NPC", "Story Character"];
    
    if (arg0 >= UnknownEnum.Value_159 && arg0 < 180)
        return ["Guard"];
}

function get_animatronic_colors(arg0)
{
    var Red = "Red";
    var Orange = "Orange";
    var Yellow = "Yellow";
    var Green = "Green";
    var Blue = "Blue";
    var Purple = "Purple";
    var White = "White";
    var Black = "Black";
    var Brown = "Brown";
    var Gray = "Gray";
    var Pink = "Pink";
    
    switch (arg0)
    {
        case UnknownEnum.Value_0:
        case UnknownEnum.Value_10:
        case UnknownEnum.Value_6:
        case UnknownEnum.Value_122:
        case UnknownEnum.Value_61:
        case UnknownEnum.Value_131:
        case UnknownEnum.Value_43:
            return [Brown];
        
        case UnknownEnum.Value_45:
        case UnknownEnum.Value_140:
            return [Brown, Green];
        
        case UnknownEnum.Value_42:
            return [Brown, Blue];
        
        case UnknownEnum.Value_137:
            return [Orange, Brown];
        
        case UnknownEnum.Value_34:
            return [White, Brown, Gray];
        
        case UnknownEnum.Value_1:
        case UnknownEnum.Value_11:
        case UnknownEnum.Value_7:
        case UnknownEnum.Value_29:
        case UnknownEnum.Value_65:
        case UnknownEnum.Value_44:
        case UnknownEnum.Value_41:
        case UnknownEnum.Value_123:
        case UnknownEnum.Value_129:
        case UnknownEnum.Value_132:
        case UnknownEnum.Value_142:
        case UnknownEnum.Value_154:
        case UnknownEnum.Value_82:
            return [Blue];
        
        case UnknownEnum.Value_14:
            return [Red, Blue];
        
        case UnknownEnum.Value_15:
            return [Purple, Blue];
        
        case UnknownEnum.Value_78:
            return [Gray, Blue];
        
        case UnknownEnum.Value_71:
            return [Blue, Black];
        
        case UnknownEnum.Value_2:
        case UnknownEnum.Value_12:
        case UnknownEnum.Value_8:
        case UnknownEnum.Value_124:
        case UnknownEnum.Value_133:
        case UnknownEnum.Value_4:
        case UnknownEnum.Value_22:
        case UnknownEnum.Value_155:
        case UnknownEnum.Value_37:
        case UnknownEnum.Value_86:
            return [Yellow];
        
        case UnknownEnum.Value_156:
            return [Yellow, Black, White];
        
        case UnknownEnum.Value_167:
            return [Black, Yellow];
        
        case UnknownEnum.Value_70:
            return [Yellow, Blue];
        
        case UnknownEnum.Value_3:
        case UnknownEnum.Value_13:
        case UnknownEnum.Value_125:
        case UnknownEnum.Value_134:
        case UnknownEnum.Value_46:
        case UnknownEnum.Value_138:
            return [Red];
        
        case UnknownEnum.Value_120:
        case UnknownEnum.Value_163:
        case UnknownEnum.Value_23:
        case UnknownEnum.Value_174:
            return [Purple, Red];
        
        case UnknownEnum.Value_9:
        case UnknownEnum.Value_49:
        case UnknownEnum.Value_28:
        case UnknownEnum.Value_69:
        case UnknownEnum.Value_118:
            return [White, Pink];
        
        case UnknownEnum.Value_19:
        case UnknownEnum.Value_20:
        case UnknownEnum.Value_63:
        case UnknownEnum.Value_21:
        case UnknownEnum.Value_38:
        case UnknownEnum.Value_59:
        case UnknownEnum.Value_68:
        case UnknownEnum.Value_165:
        case UnknownEnum.Value_166:
        case UnknownEnum.Value_175:
            return [Green];
        
        case UnknownEnum.Value_176:
            return [Black, Green];
        
        case UnknownEnum.Value_51:
            return [Orange, Pink];
        
        case UnknownEnum.Value_60:
        case UnknownEnum.Value_55:
        case UnknownEnum.Value_79:
            return [Pink];
        
        case UnknownEnum.Value_72:
            return [Pink, Purple];
        
        case UnknownEnum.Value_18:
        case UnknownEnum.Value_33:
        case UnknownEnum.Value_121:
        case UnknownEnum.Value_157:
        case UnknownEnum.Value_135:
            return [Black];
        
        case UnknownEnum.Value_77:
        case UnknownEnum.Value_80:
        case UnknownEnum.Value_158:
        case UnknownEnum.Value_164:
        case UnknownEnum.Value_168:
        case UnknownEnum.Value_139:
        case UnknownEnum.Value_178:
            return [White];
        
        case UnknownEnum.Value_16:
        case UnknownEnum.Value_24:
        case UnknownEnum.Value_201:
            return [White, Black];
        
        case UnknownEnum.Value_56:
            return [White, Yellow];
        
        case UnknownEnum.Value_27:
        case UnknownEnum.Value_30:
            return [White, Purple];
        
        case UnknownEnum.Value_25:
            return [White, Purple, Orange];
        
        case UnknownEnum.Value_32:
        case UnknownEnum.Value_172:
            return [Purple];
        
        case UnknownEnum.Value_17:
            return [Purple, Black];
        
        case UnknownEnum.Value_83:
            return [Purple, Green];
        
        case UnknownEnum.Value_76:
            return [Brown, Blue];
        
        case UnknownEnum.Value_26:
        case UnknownEnum.Value_35:
            return [White, Red, Orange];
        
        case UnknownEnum.Value_47:
        case UnknownEnum.Value_48:
            return [Orange];
        
        case UnknownEnum.Value_64:
            return [Orange, Gray];
        
        case UnknownEnum.Value_74:
            return [White, Red];
        
        case UnknownEnum.Value_31:
            return [White, Pink, Purple];
        
        case UnknownEnum.Value_75:
            return [Brown, Gray];
        
        case UnknownEnum.Value_5:
        case UnknownEnum.Value_54:
        case UnknownEnum.Value_73:
        case UnknownEnum.Value_40:
        case UnknownEnum.Value_36:
        case UnknownEnum.Value_200:
        case UnknownEnum.Value_128:
        case UnknownEnum.Value_130:
        case UnknownEnum.Value_39:
        case UnknownEnum.Value_67:
            return [Gray];
        
        case UnknownEnum.Value_126:
        case UnknownEnum.Value_53:
            return [Gray, White];
        
        case UnknownEnum.Value_50:
        case UnknownEnum.Value_162:
        case UnknownEnum.Value_177:
            return [Gray, Red];
        
        case UnknownEnum.Value_161:
            return [Gray, Yellow];
        
        case UnknownEnum.Value_160:
            return [Gray, Brown];
        
        case UnknownEnum.Value_159:
            return [Gray, Blue, Black];
        
        case UnknownEnum.Value_58:
            return [Gray, Green, Brown];
        
        case UnknownEnum.Value_169:
            return [Orange, Blue];
        
        case UnknownEnum.Value_170:
            return [Purple, Yellow];
        
        case UnknownEnum.Value_66:
            return [Orange];
        
        case UnknownEnum.Value_62:
            return [Orange, Yellow];
        
        case UnknownEnum.Value_81:
        case UnknownEnum.Value_171:
            return [Black, Orange];
        
        case UnknownEnum.Value_136:
            return [Black, Red];
        
        case UnknownEnum.Value_143:
            return [Yellow, Red];
        
        case UnknownEnum.Value_52:
            return [Pink, Yellow, Blue];
        
        case UnknownEnum.Value_57:
            return [Gray, Red, Blue];
        
        case UnknownEnum.Value_84:
            return [Yellow, Green];
        
        case UnknownEnum.Value_85:
        case UnknownEnum.Value_141:
            return [Brown, Black];
        
        default:
            return ["Unknown"];
    }
}

function get_animatronic_gender(arg0)
{
    switch (arg0)
    {
        case UnknownEnum.Value_5:
        case UnknownEnum.Value_9:
        case UnknownEnum.Value_16:
        case UnknownEnum.Value_18:
        case UnknownEnum.Value_19:
        case UnknownEnum.Value_24:
        case UnknownEnum.Value_49:
        case UnknownEnum.Value_50:
        case UnknownEnum.Value_25:
        case UnknownEnum.Value_28:
        case UnknownEnum.Value_53:
        case UnknownEnum.Value_83:
        case UnknownEnum.Value_71:
        case UnknownEnum.Value_73:
        case UnknownEnum.Value_77:
        case UnknownEnum.Value_156:
        case UnknownEnum.Value_128:
        case UnknownEnum.Value_200:
        case UnknownEnum.Value_57:
        case UnknownEnum.Value_84:
        case UnknownEnum.Value_201:
            return "???";
        
        case UnknownEnum.Value_2:
        case UnknownEnum.Value_12:
        case UnknownEnum.Value_8:
        case UnknownEnum.Value_15:
        case UnknownEnum.Value_51:
        case UnknownEnum.Value_52:
        case UnknownEnum.Value_26:
        case UnknownEnum.Value_29:
        case UnknownEnum.Value_55:
        case UnknownEnum.Value_35:
        case UnknownEnum.Value_59:
        case UnknownEnum.Value_67:
        case UnknownEnum.Value_69:
        case UnknownEnum.Value_74:
        case UnknownEnum.Value_124:
        case UnknownEnum.Value_48:
        case UnknownEnum.Value_118:
        case UnknownEnum.Value_133:
        case UnknownEnum.Value_139:
        case UnknownEnum.Value_138:
        case UnknownEnum.Value_142:
        case UnknownEnum.Value_158:
        case UnknownEnum.Value_157:
        case UnknownEnum.Value_161:
        case UnknownEnum.Value_143:
        case UnknownEnum.Value_172:
        case UnknownEnum.Value_164:
        case UnknownEnum.Value_178:
        case UnknownEnum.Value_176:
        case UnknownEnum.Value_174:
        case UnknownEnum.Value_173:
            return "Female";
        
        default:
            return "Male";
    }
}

function get_animatronic_debut(arg0)
{
    switch (arg0)
    {
        case UnknownEnum.Value_40:
            return 
            {
                Name: "The Desolate Room",
                Year: 2007
            };
        
        case UnknownEnum.Value_79:
            return 
            {
                Name: "DOOFAS",
                Year: 1994
            };
        
        case UnknownEnum.Value_41:
            return 
            {
                Name: "There Is No Pause Button!!",
                Year: 2013
            };
        
        case UnknownEnum.Value_42:
            return 
            {
                Name: "Chipper & Sons Lumber Co.",
                Year: 2013
            };
        
        case UnknownEnum.Value_0:
        case UnknownEnum.Value_1:
        case UnknownEnum.Value_2:
        case UnknownEnum.Value_3:
        case UnknownEnum.Value_4:
        case UnknownEnum.Value_5:
        case UnknownEnum.Value_160:
        case UnknownEnum.Value_156:
        case UnknownEnum.Value_128:
        case UnknownEnum.Value_154:
        case UnknownEnum.Value_200:
            return 
            {
                Name: "Five Nights at Freddy's",
                Year: 2014
            };
        
        case UnknownEnum.Value_6:
        case UnknownEnum.Value_7:
        case UnknownEnum.Value_8:
        case UnknownEnum.Value_9:
        case UnknownEnum.Value_10:
        case UnknownEnum.Value_11:
        case UnknownEnum.Value_12:
        case UnknownEnum.Value_13:
        case UnknownEnum.Value_14:
        case UnknownEnum.Value_15:
        case UnknownEnum.Value_16:
        case UnknownEnum.Value_17:
        case UnknownEnum.Value_18:
        case UnknownEnum.Value_159:
        case UnknownEnum.Value_162:
        case UnknownEnum.Value_157:
        case UnknownEnum.Value_170:
            return 
            {
                Name: "Five Nights at Freddy's 2",
                Year: 2014
            };
        
        case UnknownEnum.Value_19:
        case UnknownEnum.Value_20:
            return 
            {
                Name: "Five Nights at Freddy's 3",
                Year: 2015
            };
        
        case UnknownEnum.Value_21:
        case UnknownEnum.Value_22:
        case UnknownEnum.Value_122:
        case UnknownEnum.Value_123:
        case UnknownEnum.Value_124:
        case UnknownEnum.Value_125:
        case UnknownEnum.Value_121:
        case UnknownEnum.Value_155:
            return 
            {
                Name: "Five Nights at Freddy's 4",
                Year: 2015
            };
        
        case UnknownEnum.Value_23:
        case UnknownEnum.Value_24:
        case UnknownEnum.Value_47:
        case UnknownEnum.Value_48:
        case UnknownEnum.Value_49:
            return 
            {
                Name: "Five Nights at Freddy's 4 - Halloween Edition",
                Year: 2015
            };
        
        case UnknownEnum.Value_44:
        case UnknownEnum.Value_80:
        case UnknownEnum.Value_176:
            return 
            {
                Name: "Five Nights at Candy's",
                Year: 2015
            };
        
        case UnknownEnum.Value_169:
            return 
            {
                Name: "Five Nights at Freddy's: The Silver Eyes",
                Year: 2015
            };
        
        case UnknownEnum.Value_50:
            return 
            {
                Name: "FNAF World: Halloween Edition",
                Year: 2015
            };
        
        case UnknownEnum.Value_85:
            return 
            {
                Name: "The Joy of Creation: Classic",
                Year: 2015
            };
        
        case UnknownEnum.Value_25:
        case UnknownEnum.Value_51:
        case UnknownEnum.Value_135:
        case UnknownEnum.Value_129:
        case UnknownEnum.Value_179:
        case UnknownEnum.Value_201:
            return 
            {
                Name: "FNAF World",
                Year: 2016
            };
        
        case UnknownEnum.Value_52:
            return 
            {
                Name: "FNAF World - Update 2",
                Year: 2016
            };
        
        case UnknownEnum.Value_26:
        case UnknownEnum.Value_27:
        case UnknownEnum.Value_28:
        case UnknownEnum.Value_29:
        case UnknownEnum.Value_53:
        case UnknownEnum.Value_83:
        case UnknownEnum.Value_54:
        case UnknownEnum.Value_163:
        case UnknownEnum.Value_173:
            return 
            {
                Name: "Five Nights at Freddy's: Sister Location",
                Year: 2016
            };
        
        case UnknownEnum.Value_55:
        case UnknownEnum.Value_56:
            return 
            {
                Name: "Five Nights at Freddy's: Sister Location - Custom Night",
                Year: 2016
            };
        
        case UnknownEnum.Value_45:
        case UnknownEnum.Value_177:
            return 
            {
                Name: "Popgoes",
                Year: 2016
            };
        
        case UnknownEnum.Value_30:
        case UnknownEnum.Value_57:
        case UnknownEnum.Value_58:
        case UnknownEnum.Value_32:
        case UnknownEnum.Value_31:
        case UnknownEnum.Value_33:
        case UnknownEnum.Value_34:
        case UnknownEnum.Value_35:
        case UnknownEnum.Value_59:
        case UnknownEnum.Value_60:
        case UnknownEnum.Value_61:
        case UnknownEnum.Value_62:
        case UnknownEnum.Value_131:
        case UnknownEnum.Value_132:
        case UnknownEnum.Value_133:
        case UnknownEnum.Value_134:
        case UnknownEnum.Value_141:
        case UnknownEnum.Value_118:
        case UnknownEnum.Value_63:
        case UnknownEnum.Value_130:
            return 
            {
                Name: "Freddy Fazbear's Pizzeria Simulator",
                Year: 2017
            };
        
        case UnknownEnum.Value_36:
            return 
            {
                Name: "Five Nights at Freddy's: The Twisted Ones",
                Year: 2017
            };
        
        case UnknownEnum.Value_37:
            return 
            {
                Name: "Five Nights at Freddy's: Help Wanted",
                Year: 2019
            };
        
        case UnknownEnum.Value_38:
        case UnknownEnum.Value_64:
            return 
            {
                Name: "Five Nights at Freddy's: Help Wanted - Curse of Dreadbear",
                Year: 2019
            };
        
        case UnknownEnum.Value_39:
            return 
            {
                Name: "Freddy in Space 2",
                Year: 2019
            };
        
        case UnknownEnum.Value_65:
        case UnknownEnum.Value_136:
            return 
            {
                Name: "Five Nights at Freddy's AR: Special Delivery",
                Year: 2019
            };
        
        case UnknownEnum.Value_167:
        case UnknownEnum.Value_168:
            return 
            {
                Name: "Five Nights at Frickbear's",
                Year: 2019
            };
        
        case UnknownEnum.Value_82:
            return 
            {
                Name: "The Walten Files - Company Introductory Tape",
                Year: 2020
            };
        
        case UnknownEnum.Value_66:
        case UnknownEnum.Value_67:
        case UnknownEnum.Value_68:
        case UnknownEnum.Value_69:
        case UnknownEnum.Value_70:
        case UnknownEnum.Value_161:
        case UnknownEnum.Value_158:
            return 
            {
                Name: "Five Nights at Freddy's: Security Breach",
                Year: 2021
            };
        
        case UnknownEnum.Value_71:
        case UnknownEnum.Value_174:
            return 
            {
                Name: "Five Nights at Freddy's: Security Breach - RUIN",
                Year: 2023
            };
        
        case UnknownEnum.Value_86:
            return 
            {
                Name: "Fazbear Frights #1: Into the Pit",
                Year: 2019
            };
        
        case UnknownEnum.Value_138:
            return 
            {
                Name: "Fazbear Frights #1: Into the Pit - To Be Beautiful",
                Year: 2019
            };
        
        case UnknownEnum.Value_175:
            return 
            {
                Name: "Fazbear Frights #8: Gumdrop Angel - What We Found",
                Year: 2021
            };
        
        case UnknownEnum.Value_119:
            return 
            {
                Name: "Fazbear Frights #12: Felix the Shark - Felix the Shark",
                Year: 2022
            };
        
        case UnknownEnum.Value_84:
            return 
            {
                Name: "Five Nights at Freddy's Interactive Novel #3: Escape the Pizzaplex",
                Year: 2025
            };
        
        case UnknownEnum.Value_73:
        case UnknownEnum.Value_171:
        case UnknownEnum.Value_172:
            return 
            {
                Name: "Five Nights at Freddy's: Tales from the Pizzaplex #1: Lally's Game",
                Year: 2022
            };
        
        case UnknownEnum.Value_137:
            return 
            {
                Name: "POPGOES Arcade: POPGOES and The Machinist",
                Year: 2022
            };
        
        case UnknownEnum.Value_46:
        case UnknownEnum.Value_127:
            return 
            {
                Name: "Five Nights at Frickbear's 2",
                Year: 2022
            };
        
        case UnknownEnum.Value_43:
            return 
            {
                Name: "Five Nights at Freddy's (Film)",
                Year: 2023
            };
        
        case UnknownEnum.Value_140:
            return 
            {
                Name: "Five Nights at Freddy's: Help Wanted 2",
                Year: 2023
            };
        
        case UnknownEnum.Value_74:
        case UnknownEnum.Value_75:
        case UnknownEnum.Value_76:
        case UnknownEnum.Value_142:
        case UnknownEnum.Value_77:
        case UnknownEnum.Value_78:
            return 
            {
                Name: "Five Nights at Freddy's: Secret of the Mimic",
                Year: 2025
            };
        
        case UnknownEnum.Value_120:
        case UnknownEnum.Value_126:
        case UnknownEnum.Value_143:
        case UnknownEnum.Value_165:
        case UnknownEnum.Value_166:
        case UnknownEnum.Value_164:
            return 
            {
                Name: "Five Nights at Frickbear's 3",
                Year: 2026
            };
        
        case UnknownEnum.Value_72:
            return 
            {
                Name: "Five Nights at Freddy's Interactive Novel #0: VIP",
                Year: 2024
            };
        
        case UnknownEnum.Value_139:
            return 
            {
                Name: "Five Nights at Freddy's: Tales from the Pizzaplex 4: Submechanophobia",
                Year: 2022
            };
        
        case UnknownEnum.Value_178:
            return 
            {
                Name: "Playtime With Percy",
                Year: 2023
            };
        
        case UnknownEnum.Value_81:
            return 
            {
                Name: "Freddy or Not",
                Year: 2027
            };
        
        default:
            return 
            {
                Name: "",
                Year: -1
            };
    }
}

function get_animatronic_va(arg0)
{
    switch (arg0)
    {
        case UnknownEnum.Value_0:
        case UnknownEnum.Value_4:
        case UnknownEnum.Value_10:
        case UnknownEnum.Value_20:
        case UnknownEnum.Value_29:
        case UnknownEnum.Value_31:
        case UnknownEnum.Value_41:
        case UnknownEnum.Value_42:
        case UnknownEnum.Value_45:
        case UnknownEnum.Value_120:
        case UnknownEnum.Value_54:
        case UnknownEnum.Value_63:
        case UnknownEnum.Value_65:
        case UnknownEnum.Value_75:
        case UnknownEnum.Value_134:
        case UnknownEnum.Value_159:
        case UnknownEnum.Value_160:
        case UnknownEnum.Value_162:
        case UnknownEnum.Value_170:
        case UnknownEnum.Value_179:
        case UnknownEnum.Value_141:
        case UnknownEnum.Value_86:
            return "G-Zone";
        
        case UnknownEnum.Value_3:
        case UnknownEnum.Value_12:
        case UnknownEnum.Value_13:
        case UnknownEnum.Value_6:
        case UnknownEnum.Value_28:
        case UnknownEnum.Value_38:
        case UnknownEnum.Value_44:
        case UnknownEnum.Value_78:
        case UnknownEnum.Value_131:
            return "Zachary Attackary";
        
        case UnknownEnum.Value_7:
        case UnknownEnum.Value_9:
        case UnknownEnum.Value_14:
        case UnknownEnum.Value_15:
        case UnknownEnum.Value_19:
        case UnknownEnum.Value_23:
        case UnknownEnum.Value_49:
        case UnknownEnum.Value_30:
        case UnknownEnum.Value_39:
        case UnknownEnum.Value_166:
            return "RainingKetchup";
        
        case UnknownEnum.Value_167:
        case UnknownEnum.Value_61:
        case UnknownEnum.Value_62:
        case UnknownEnum.Value_70:
        case UnknownEnum.Value_80:
        case UnknownEnum.Value_58:
        case UnknownEnum.Value_132:
        case UnknownEnum.Value_135:
        case UnknownEnum.Value_137:
        case UnknownEnum.Value_171:
        case UnknownEnum.Value_177:
        case UnknownEnum.Value_50:
        case UnknownEnum.Value_84:
        case UnknownEnum.Value_127:
            return "RedTv53";
        
        case UnknownEnum.Value_1:
        case UnknownEnum.Value_21:
        case UnknownEnum.Value_32:
        case UnknownEnum.Value_43:
        case UnknownEnum.Value_46:
        case UnknownEnum.Value_140:
            return "Nukelear";
        
        case UnknownEnum.Value_64:
        case UnknownEnum.Value_136:
        case UnknownEnum.Value_175:
            return "Saltydkdan";
        
        case UnknownEnum.Value_8:
        case UnknownEnum.Value_16:
        case UnknownEnum.Value_33:
        case UnknownEnum.Value_158:
        case UnknownEnum.Value_164:
            return "Frostee";
        
        case UnknownEnum.Value_36:
        case UnknownEnum.Value_118:
            return "RadicalSoda";
        
        case UnknownEnum.Value_17:
        case UnknownEnum.Value_22:
        case UnknownEnum.Value_85:
            return "KaiTheGuy123";
        
        case UnknownEnum.Value_24:
        case UnknownEnum.Value_37:
            return "nixliz";
        
        case UnknownEnum.Value_25:
        case UnknownEnum.Value_67:
            return "TheTVBunny";
        
        case UnknownEnum.Value_59:
        case UnknownEnum.Value_60:
            return "Bizabizow";
        
        case UnknownEnum.Value_163:
        case UnknownEnum.Value_119:
        case UnknownEnum.Value_165:
        case UnknownEnum.Value_47:
            return "RadioNifty";
        
        case UnknownEnum.Value_26:
        case UnknownEnum.Value_35:
            return "destin_";
        
        case UnknownEnum.Value_81:
            return "CARIO55555";
        
        case UnknownEnum.Value_2:
            return "SuperKirbyLover";
        
        case UnknownEnum.Value_11:
            return "diegoof17";
        
        case UnknownEnum.Value_53:
            return "Zekeram12";
        
        case UnknownEnum.Value_68:
            return "BugDroidCell";
        
        case UnknownEnum.Value_69:
            return "Spacey Tracey";
        
        case UnknownEnum.Value_72:
        case UnknownEnum.Value_169:
            return "RecD";
        
        case UnknownEnum.Value_174:
        case UnknownEnum.Value_142:
            return "MayDoesAThing";
        
        case UnknownEnum.Value_77:
        case UnknownEnum.Value_82:
            return "Eva C. aka Bravvyy";
        
        case UnknownEnum.Value_51:
        case UnknownEnum.Value_74:
        case UnknownEnum.Value_161:
        case UnknownEnum.Value_138:
        case UnknownEnum.Value_71:
        case UnknownEnum.Value_173:
        case UnknownEnum.Value_172:
            return "angelfaise";
        
        case UnknownEnum.Value_56:
            return "GooseCultist";
        
        case UnknownEnum.Value_52:
        case UnknownEnum.Value_55:
            return "bingusbnuy";
        
        case UnknownEnum.Value_48:
            return "SrPelo";
        
        case UnknownEnum.Value_178:
            return "RAD1OSILENC3";
        
        case UnknownEnum.Value_133:
            return "mini_cocoa";
        
        case UnknownEnum.Value_143:
            return "Egollusional";
        
        case UnknownEnum.Value_176:
            return "gooberthed";
        
        case UnknownEnum.Value_66:
            return ["Saltydkdan", "MayDoesAThing"];
        
        case UnknownEnum.Value_27:
            return ["CARIO55555", "RadicalSoda"];
        
        case UnknownEnum.Value_34:
            return ["CARIO55555", "G-Zone", "Zachary Attackary"];
        
        case UnknownEnum.Value_128:
            return ["Deku Scrublord", "CARIO55555", "mini_cocoa", "Nukelear", "RedTv53", "G-Zone", "RainingKetchup", "Frostee", "Zachary Attackary", "KaiTheGuy123", "RecD", "Zekeram12", "Count Cannoli", "RustyRed", "Kyle DeNigris", "AussieBun39"];
        
        case UnknownEnum.Value_76:
            return ["RedTv53", "Zachary Attackary", "TheTVBunny"];
        
        case UnknownEnum.Value_139:
            return ["Hatsune Miku", "Kasane Teto", "GUMI"];
        
        case UnknownEnum.Value_83:
            return ["RedTv53", "FlyPlague", "Wrathstetic", "Churgney \"STURMVIDEO\" Gurgney", "RedTv53's Dad", "TheGrandestGoon", "RainingKetchup", "TellySayHi", "Scrumbo_", "G-Zone", "RecD"];
        
        default:
            return "";
    }
}

function get_sorter_array(arg0, arg1 = global.Settings[3][UnknownEnum.Value_6])
{
    var SorterArray = get_sorting_array_order(arg1);
    
    for (var i = 0; i < array_length(arg0); i++)
    {
        if (!array_contains(SorterArray, arg0[i]))
            array_push(SorterArray, arg0[i]);
    }
    
    for (var i = 0; i < array_length(SorterArray); i++)
    {
        if (!array_contains(arg0, SorterArray[i]) || global.Descriptions[SorterArray[i]][0] == "UNKNOWN")
        {
            array_delete(SorterArray, i, 1);
            i--;
        }
    }
    
    return SorterArray;
}

function animatronics_in_set(arg0)
{
    var _Set = get_animatronic_set(arg0);
    var _SetSize = 0;
    var _CharsInSet = 0;
    
    for (var i = 0; i <= 86; i++)
    {
        if (get_animatronic_set(arg0) == _Set)
        {
            _SetSize++;
            
            if (array_contains(global.AllTimeSalvages, arg0))
                _CharsInSet++;
        }
    }
    
    return 
    {
        Set: _Set,
        SetSize: _SetSize,
        CharsInSet: _CharsInSet
    };
}

function get_animatronic_set(arg0)
{
    switch (arg0)
    {
        case UnknownEnum.Value_0:
        case UnknownEnum.Value_1:
        case UnknownEnum.Value_2:
        case UnknownEnum.Value_3:
            return "Classics";
        
        case UnknownEnum.Value_10:
        case UnknownEnum.Value_11:
        case UnknownEnum.Value_12:
        case UnknownEnum.Value_13:
            return "Withereds";
        
        case UnknownEnum.Value_6:
        case UnknownEnum.Value_7:
        case UnknownEnum.Value_8:
        case UnknownEnum.Value_9:
            return "Toys";
        
        case UnknownEnum.Value_14:
        case UnknownEnum.Value_15:
        case UnknownEnum.Value_51:
            return "Balloon Children";
        
        case UnknownEnum.Value_4:
        case UnknownEnum.Value_5:
        case UnknownEnum.Value_17:
        case UnknownEnum.Value_18:
        case UnknownEnum.Value_43:
            return "Easter Eggs";
        
        case UnknownEnum.Value_19:
        case UnknownEnum.Value_20:
            return "FNaF3";
        
        case UnknownEnum.Value_21:
        case UnknownEnum.Value_22:
        case UnknownEnum.Value_49:
        case UnknownEnum.Value_23:
        case UnknownEnum.Value_24:
            return "Nightmares";
        
        case UnknownEnum.Value_26:
        case UnknownEnum.Value_27:
        case UnknownEnum.Value_28:
        case UnknownEnum.Value_29:
            return "Funtimes";
        
        case UnknownEnum.Value_53:
        case UnknownEnum.Value_83:
            return "Michael's Living Room";
        
        case UnknownEnum.Value_25:
        case UnknownEnum.Value_54:
        case UnknownEnum.Value_55:
        case UnknownEnum.Value_56:
            return "SL Custom Night";
        
        case UnknownEnum.Value_34:
        case UnknownEnum.Value_35:
        case UnknownEnum.Value_63:
        case UnknownEnum.Value_33:
            return "Scrap Pack";
        
        case UnknownEnum.Value_59:
        case UnknownEnum.Value_32:
        case UnknownEnum.Value_60:
        case UnknownEnum.Value_61:
        case UnknownEnum.Value_62:
            return "Mediocre Melodies";
        
        case UnknownEnum.Value_30:
        case UnknownEnum.Value_58:
        case UnknownEnum.Value_31:
            return "Pizza Simulator Misfits";
        
        case UnknownEnum.Value_37:
        case UnknownEnum.Value_38:
        case UnknownEnum.Value_64:
            return "Virtual Experience";
        
        case UnknownEnum.Value_66:
        case UnknownEnum.Value_69:
        case UnknownEnum.Value_67:
        case UnknownEnum.Value_68:
            return "Glamrocks";
        
        case UnknownEnum.Value_70:
        case UnknownEnum.Value_71:
            return "Pizzaplex Misfits";
        
        case UnknownEnum.Value_73:
        case UnknownEnum.Value_74:
        case UnknownEnum.Value_75:
        case UnknownEnum.Value_77:
        case UnknownEnum.Value_78:
            return "MCM";
        
        case UnknownEnum.Value_36:
        case UnknownEnum.Value_72:
            return "Books";
        
        case UnknownEnum.Value_79:
        case UnknownEnum.Value_40:
        case UnknownEnum.Value_41:
        case UnknownEnum.Value_42:
            return "ScottGames";
        
        case UnknownEnum.Value_44:
        case UnknownEnum.Value_80:
        case UnknownEnum.Value_45:
        case UnknownEnum.Value_81:
            return "Fanverse";
        
        case UnknownEnum.Value_50:
        case UnknownEnum.Value_52:
        case UnknownEnum.Value_65:
        case UnknownEnum.Value_39:
            return "Spinoffs";
        
        default:
            return "None";
    }
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
    Value_39,
    Value_40,
    Value_41,
    Value_42,
    Value_43,
    Value_44,
    Value_45,
    Value_46,
    Value_47,
    Value_48,
    Value_49,
    Value_50,
    Value_51,
    Value_52,
    Value_53,
    Value_54,
    Value_55,
    Value_56,
    Value_57,
    Value_58,
    Value_59,
    Value_60,
    Value_61,
    Value_62,
    Value_63,
    Value_64,
    Value_65,
    Value_66,
    Value_67,
    Value_68,
    Value_69,
    Value_70,
    Value_71,
    Value_72,
    Value_73,
    Value_74,
    Value_75,
    Value_76,
    Value_77,
    Value_78,
    Value_79,
    Value_80,
    Value_81,
    Value_82,
    Value_83,
    Value_84,
    Value_85,
    Value_86,
    Value_118 = 118,
    Value_119,
    Value_120,
    Value_121,
    Value_122,
    Value_123,
    Value_124,
    Value_125,
    Value_126,
    Value_127,
    Value_128,
    Value_129,
    Value_130,
    Value_131,
    Value_132,
    Value_133,
    Value_134,
    Value_135,
    Value_136,
    Value_137,
    Value_138,
    Value_139,
    Value_140,
    Value_141,
    Value_142,
    Value_143,
    Value_154 = 154,
    Value_155,
    Value_156,
    Value_157,
    Value_158,
    Value_159,
    Value_160,
    Value_161,
    Value_162,
    Value_163,
    Value_164,
    Value_165,
    Value_166,
    Value_167,
    Value_168,
    Value_169,
    Value_170,
    Value_171,
    Value_172,
    Value_173,
    Value_174,
    Value_175,
    Value_176,
    Value_177,
    Value_178,
    Value_179,
    Value_200 = 200,
    Value_201
}
