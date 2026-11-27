event_inherited();
Frame = 0;
SlotSpeed = 60;
CurrentImage = 0;
var Killables = [];
PossibleItems = [];

for (var i = 0; i <= 90; i++)
{
    if (!character_active(i) && instance_exists(get_animatronic_object(i)))
        array_push(PossibleItems, i);
}

repeat (max(0, array_length(PossibleItems) - 11))
    array_delete(PossibleItems, irandom(array_length(PossibleItems) - 1), 1);

array_shuffle(PossibleItems);
ItemChosen = irandom(array_length(PossibleItems) - 1);
AnimatronicToSummon = PossibleItems[ItemChosen];
CurrentImage = ItemChosen + 6;
audio_play_sound(sfxRoulette, 10, false);
show_debug_message($"PICKED: {AnimatronicToSummon} CHARS: {PossibleItems}");
