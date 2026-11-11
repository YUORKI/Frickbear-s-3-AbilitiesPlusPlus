Frame = 0;
ImageApplied = false;
CustomSprite = -1;
CustomHeight = -1;

function get_animatronic_height(arg0)
{
    if (CustomHeight)
        return CustomHeight;
    
    switch (arg0)
    {
        case UnknownEnum.Value_9:
        case UnknownEnum.Value_57:
        case UnknownEnum.Value_55:
            return 16;
        
        case UnknownEnum.Value_25:
        case UnknownEnum.Value_59:
            return 24;
        
        case UnknownEnum.Value_40:
        case UnknownEnum.Value_43:
        case UnknownEnum.Value_56:
        case UnknownEnum.Value_21:
        case UnknownEnum.Value_77:
            return 32;
        
        case UnknownEnum.Value_14:
        case UnknownEnum.Value_15:
        case UnknownEnum.Value_49:
        case UnknownEnum.Value_79:
        case UnknownEnum.Value_51:
        case UnknownEnum.Value_23:
        case UnknownEnum.Value_20:
        case UnknownEnum.Value_86:
            return 40;
        
        case UnknownEnum.Value_4:
        case UnknownEnum.Value_58:
        case UnknownEnum.Value_17:
        case UnknownEnum.Value_72:
        case UnknownEnum.Value_81:
        default:
            return 48;
        
        case UnknownEnum.Value_48:
        case UnknownEnum.Value_78:
            return 54;
        
        case UnknownEnum.Value_5:
        case UnknownEnum.Value_6:
        case UnknownEnum.Value_7:
        case UnknownEnum.Value_8:
        case UnknownEnum.Value_10:
        case UnknownEnum.Value_11:
        case UnknownEnum.Value_12:
        case UnknownEnum.Value_13:
        case UnknownEnum.Value_3:
        case UnknownEnum.Value_2:
        case UnknownEnum.Value_61:
        case UnknownEnum.Value_74:
        case UnknownEnum.Value_83:
            return 64;
        
        case UnknownEnum.Value_0:
        case UnknownEnum.Value_52:
        case UnknownEnum.Value_69:
        case UnknownEnum.Value_67:
        case UnknownEnum.Value_65:
        case UnknownEnum.Value_64:
        case UnknownEnum.Value_63:
        case UnknownEnum.Value_73:
        case UnknownEnum.Value_85:
        case UnknownEnum.Value_84:
            return 72;
        
        case UnknownEnum.Value_1:
        case UnknownEnum.Value_18:
        case UnknownEnum.Value_47:
        case UnknownEnum.Value_41:
        case UnknownEnum.Value_34:
        case UnknownEnum.Value_54:
        case UnknownEnum.Value_53:
        case UnknownEnum.Value_50:
        case UnknownEnum.Value_66:
        case UnknownEnum.Value_62:
        case UnknownEnum.Value_76:
        case UnknownEnum.Value_75:
            return 80;
        
        case UnknownEnum.Value_26:
        case UnknownEnum.Value_22:
        case UnknownEnum.Value_16:
        case UnknownEnum.Value_68:
        case UnknownEnum.Value_71:
        case UnknownEnum.Value_70:
        case UnknownEnum.Value_80:
            return 88;
        
        case UnknownEnum.Value_82:
            return 96;
        
        case UnknownEnum.Value_19:
            return 48;
            break;
        
        case UnknownEnum.Value_24:
            return 112;
            break;
        
        case UnknownEnum.Value_27:
            return 80;
            break;
        
        case UnknownEnum.Value_28:
            return 72;
            break;
        
        case UnknownEnum.Value_29:
            return 88;
            break;
        
        case UnknownEnum.Value_30:
            return 40;
            break;
        
        case UnknownEnum.Value_31:
            return 64;
            break;
        
        case UnknownEnum.Value_32:
            return 72;
            break;
        
        case UnknownEnum.Value_33:
            return 48;
            break;
        
        case UnknownEnum.Value_35:
            return 80;
            break;
        
        case UnknownEnum.Value_36:
            return 48;
            break;
        
        case UnknownEnum.Value_37:
            return 72;
            break;
        
        case UnknownEnum.Value_38:
            return 88;
            break;
        
        case UnknownEnum.Value_39:
            return 64;
            break;
        
        case UnknownEnum.Value_42:
            return 64;
            break;
        
        case UnknownEnum.Value_44:
            return 64;
            break;
        
        case UnknownEnum.Value_45:
            return 72;
            break;
        
        case UnknownEnum.Value_46:
            return 96;
            break;
        
        case 95:
            return 80;
            break;
        
        case 91:
            return 72;
            break;
        
        case 90:
            return 24;
            break;
    }
}

if (AnimatronicID == 49)
{
    AnimatronicID = 90;
}
else if (AnimatronicID == 48)
{
    AnimatronicID = 91;
}
else if (AnimatronicID == UnknownEnum.Value_14)
{
}
else
{
    if (global.ShuffleMode)
    {
        AnimatronicID = global.ShuffleData.Animatronics[AnimatronicID];
        Text = global.Descriptions[AnimatronicID][0];
    }
    
    Text = "Salvage";
}

Height = DepthOffset + get_animatronic_height(AnimatronicID);

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
    Value_61 = 61,
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
    Value_86
}
