if (Head != -1)
    instance_destroy(Head);

if (Body != -1)
    instance_destroy(Body);

clear_window(UnknownEnum.Value_69);
audio_stop_sound(SOUND_Ambience);
surface_free(SpeechBubbleSurf);
instance_destroy(oGlamrockChica_AssemblyMenu);
instance_destroy(oGlamrockChica_FallingIngredient);
sprite_delete(SPRITE_Body);
sprite_delete(SPRITE_Head);
sprite_delete(SPRITE_PizzaBase);
sprite_delete(SPRITE_SpeechBubble);
sprite_delete(SPRITE_ToppingBinHolder);
sprite_delete(SPRITE_ToppingBins);
sprite_delete(SPRITE_Toppings);
skin_sound_delete_array([SOUND_Ambience, SOUND_Creak, SOUND_Look, SOUND_Complete, SOUND_PizzaPluck, SOUND_PizzaSplat]);
skin_sound_delete_array(SOUND_Appear);
skin_sound_delete_array(SOUND_Fed);

enum UnknownEnum
{
    Value_69 = 69
}
