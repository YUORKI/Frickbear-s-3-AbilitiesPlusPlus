var Convo = (Screen == 4) ? "4LD_OMC" : "4LD_GuardConversation";

with (instance_create_depth(0, 0, 0, oTextBox))
{
    game_text(Convo);
    TextBoxSprite = sNOTHING;
}
