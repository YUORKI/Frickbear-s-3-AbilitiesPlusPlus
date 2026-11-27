event_inherited();
application_surface_draw_enable(false);
global.HasGift = false;

with (instance_create_depth(0, 0, 10, oTextBox))
    game_text("Shop");

DisplayedEarnings = global.RunEarnings;
TransitionPercent = 1;
TransitioningOut = false;
TransitioningOutFrames = 0;
