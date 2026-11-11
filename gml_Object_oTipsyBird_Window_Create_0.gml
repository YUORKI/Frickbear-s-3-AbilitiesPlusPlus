TipsySurf = -1;
VoiceLineID = -1;
GuardX = -32;
GuardY = 72;
GuardDirection = 1;
WalkFrame = 0;
YTarget = 72;
YSpeed = 0;
SelectedSeat = -1;
Sitting = false;
Frame = 0;
Patrons = [];

for (var i = 0; i < global.GuardAmount; i++)
{
    if (i < 21 && !(global.UnlockedGuards[i] || i == UnknownEnum.Value_6))
        continue;
    
    if (i == UnknownEnum.Value_20 && !global.UnlockedAnimatronics[UnknownEnum.Value_179])
        continue;
    
    if (!array_contains(global.Lives, i) && !(i >= 21 && irandom(3) > 0))
        array_push(Patrons, i);
}

Patrons = array_shuffle(Patrons);

if (global.Guard == UnknownEnum.Value_20 && global.EndlessGuardStickers[UnknownEnum.Value_20] == -1)
    Patrons = [];

TalkingChar = -1;
Leaving = false;
GuardSprite = import_sprites("minigame.png", sHD_Guard, 4, 8, 8);
PageOffset = 360;
PageOffsetSpeed = 0;
PageUp = false;
TextOrder = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~ ¡¿áéíóú™";
CostFont = font_add_sprite_ext(sSalvageSheet_Font, TextOrder, true, 0);
BackgroundDarkness = 0;
DescUpdated = false;

enum UnknownEnum
{
    Value_6 = 6,
    Value_20 = 20,
    Value_179 = 179
}
