check_reset();

if (Countdown > 0)
    exit;

var PhotoX = 180;
var PhotoTimings = [55.8, 68.3, 80.8, 93.3, 104.4, 117.3, 129.9, 143.1];
sequenced_sprite(sMyWay_1, 0, -80, 8, 256, 8, 6, 55.8, 3);

for (var i = 0; i < (array_length(PhotoTimings) - 1); i++)
    sequenced_sprite(sMyWay_Photos, i, PhotoX, 0, PhotoX, 0, PhotoTimings[i], PhotoTimings[i + 1], 2);

sequenced_sprite(sMyWay_2, 0, 224, 8, -128, 8, 143.1, 191.4, 5);
sequenced_sprite(sMyWay_3, 0, -64, 192, -64, 0, 191.4, 230.8, 5);
sequenced_sprite(sMyWay_4, 0, 0, 0, 0, 0, 225.8, 263.7, 5);

if (!audio_is_playing(Song))
{
    EndscreenFadein += ((Exiting ? -1 : 1) / 300);
    draw_sprite_ext(sMyWay_Endscreen, 0, 0, 0, 1, 1, 0, c_white, EndscreenFadein);
    
    if (!Exiting && input_check_pressed(UnknownEnum.Value_0))
    {
        Exiting = true;
        EndscreenFadein = min(1, EndscreenFadein);
    }
    
    if (Exiting && EndscreenFadein <= -0.2)
        room_goto(Extras);
}

show_debug_message(SongPosition);

enum UnknownEnum
{
    Value_0
}
