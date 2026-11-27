YOffset = 360;
DeathAmount = 0;

for (var i = 0; i < array_length(global.Deaths); i++)
    DeathAmount += global.Deaths[i];

EarningAmount = string_format(global.RunEarningsTotal, 1, 2);
TimeAmount = format_as_timer(global.SavedTime, false);
FaceSprites = import_sprites("icon.png", sCustomNightGuardFaces);
