ID = UnknownEnum.Value_90;
SPRITE_Body = skin_sprite(sEndoplush, ID, get_sprite_filenames(1, 9));
SOUND_Zapped = skin_sound_generate_array(get_misc_voicelines(ID, "Zapped"), ID, "voc_drain");
SOUND_Drain = skin_sound(sfxBitPunish, ID, "sq_drain");
RecordedPositions = [];
Delay = 90;
CurX = 320;
CurY = 180;
CircleCounter = 0;
DrainTimer = 0;

function record_position(arg0, arg1)
{
    arg0 = lerp(CurX, arg0, 0.2);
    arg1 = lerp(CurY, arg1, 0.2);
    array_push(RecordedPositions, [arg0, arg1, CircleCounter == 0]);
    
    if (array_length(RecordedPositions) > Delay)
        array_delete(RecordedPositions, 0, 1);
    
    CurX = arg0;
    CurY = arg1;
    
    if (CircleCounter == 0)
        CircleCounter = 1;
    else
        CircleCounter--;
}

WalkFrame = 0;
SpeedX = 0;
SpeedY = 0;
x = -96;
y = -96;
DiffScaler = 1;
ZapFrames = 0;
SpeedScaler = 0;
DowntimeCounter = 0;
Running = false;
ZapLinePlayed = false;

enum UnknownEnum
{
    Value_90 = 90
}
