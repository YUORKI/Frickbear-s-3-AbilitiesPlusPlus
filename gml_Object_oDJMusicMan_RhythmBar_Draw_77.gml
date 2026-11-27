set_target_to_ui();
var BarX = 320;
var BarY = 32 + BarOffset;
BarOffset += (((ShowBar ? 0 : -64) - BarOffset) / 5);
var StartX = 64;
var BarLength = 256;
var CurBeat = floor(time_to_beat(TrackPos));
var CurLine = CurBeat >= 4;
CurBeat = CurBeat % 4;
draw_sprite_ext(SPRITE_Bar, 0, BarX, BarY, 1, 1, 0, c_white, 0.75);

for (var i = 0; i < array_length(NotePositions); i++)
{
    if (NotePositions[i] <= BeatPos)
        draw_sprite_ext(SPRITE_Notes, Inputs[i] + 3, BarX + lerp(-128, 128, NotePositions[i] / 4), BarY, 1, 1, 0, c_white, (CurBeat >= 4) ? 0.5 : 1);
}

for (var i = 0; i < array_length(HitNotes); i++)
    draw_sprite(SPRITE_Notes, HitNotes[i], BarX + lerp(-128, 128, HitNotePositions[i] / 4), BarY);

draw_sprite(SPRITE_Notes, 2, BarX + lerp(-128, 128, (BeatPos % 4) / 4), BarY);
surface_reset_target();
