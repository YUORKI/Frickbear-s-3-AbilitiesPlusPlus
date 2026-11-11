AI = global.AILevels[ID];

if (AI <= 0)
    exit;

switch (Mode)
{
    case "Waiting":
        if (Frame > (lerp(60, 20, AI / 20) * RandomValue))
        {
            Frame = 0;
            Mode = "Hallway";
            Side = random_sign();
            ActualSide = random_sign();
            reverb_sound(choose_from_array(SOUND_Appear), 400 * Side, 0, false, 0.5);
            fuzz_up(UnknownEnum.Value_4 + sign_to_binary(Side));
        }
        
        break;
    
    case "Hallway":
        if (Frame > lerp(20, 8, AI / 20) && doorway_available(ActualSide))
        {
            Frame = 0;
            Mode = "Attacking";
            occupy_doorway(ID, ActualSide);
            var Sound = choose_from_array(array_concat(SOUND_Attack, (Side != ActualSide) ? SOUND_AttackOppositeSide : SOUND_AttackSameSide));
            VoiceClip = reverb_sound(Sound, 400 * Side, 0, false, 1);
        }
        
        break;
    
    case "Attacking":
        if (!audio_is_playing(VoiceClip))
        {
            if (global.Doors[sign_to_binary(ActualSide)])
            {
                if (!global.Doors[!sign_to_binary(ActualSide)] || instance_exists(oLaserDoor))
                {
                    simple_sound(sfxBlock, 400 * ActualSide, 0, false, 1);
                    var Sound = choose_from_array(SOUND_Blocked);
                    reverb_sound(Sound, 400 * Side, 0, false, 1);
                    block_tokens();
                    clear_doorway(ID, ActualSide);
                    Frame = 0;
                    Mode = "Waiting";
                    RandomValue = random_range(0.8, 1.2);
                    fuzz_up(UnknownEnum.Value_4 + sign_to_binary(Side));
                }
            }
            else
            {
                if (Side == ActualSide)
                    jumpscare(ID, ActualSide, 0);
                else
                    jumpscare(ID, ActualSide, 1);
                
                exit;
            }
        }
        
        break;
}

if (Side == -1)
    depth = 20;
else
    depth = 12;

Frame += 0.016666666666666666;

enum UnknownEnum
{
    Value_4 = 4
}
