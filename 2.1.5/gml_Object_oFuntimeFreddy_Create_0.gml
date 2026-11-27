ID = UnknownEnum.Value_27;
Side = -1;
ActualSide = -1;
Frame = 0;
Mode = "Waiting";
VoiceClip = -1;
RandomValue = random_range(0.8, 1.2);
SPRITE_Cameras = skin_sprite(sFuntimeFreddy, UnknownEnum.Value_27, get_sprite_filenames(1, 4));
SOUND_Appear = skin_sound_generate_array([voc_FuntimeFreddy_Laugh1, voc_FuntimeFreddy_CountTheWays, voc_FuntimeFreddy_OverHere], UnknownEnum.Value_27, "voc_appear");
SOUND_Attack = skin_sound_generate_array([voc_FuntimeFreddy_BlowOutTheCandles, voc_FuntimeFreddy_CheckThisOut, voc_FuntimeFreddy_SeeSomethingCool], UnknownEnum.Value_27, "voc_attack");
SOUND_AttackSameSide = skin_sound_generate_array([voc_FuntimeFreddy_BigHug, voc_FuntimeFreddy_HereICome], UnknownEnum.Value_27, "voc_attack_sameside");
SOUND_AttackOppositeSide = skin_sound_generate_array([voc_FuntimeFreddy_TakeItAway, voc_FuntimeFreddy_ASurprise], UnknownEnum.Value_27, "voc_attack_oppositeside");
SOUND_Blocked = skin_sound_generate_array([voc_FuntimeFreddy_Doh1, voc_FuntimeFreddy_Doh2, voc_FuntimeFreddy_ComeOn1, voc_FuntimeFreddy_ComeOn2, voc_FuntimeFreddy_Mumbling], UnknownEnum.Value_27, "voc_blocked");

enum UnknownEnum
{
    Value_27 = 27
}
