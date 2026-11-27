var ID = ModMode ? CurrentChar : oExtras_AnimatronicSelect.SorterArray[CurrentChar];
var Data = ExtrasDatabase[ID];
var Portrait = Data.Image;
var TargetSize = min(344 / sprite_get_height(Portrait), 404 / sprite_get_width(Portrait), 1);
ImageOffsetSize = clamp(ImageOffsetSize, 0, 1 - ImageSize);
var PortraitX = ImageX + ImageOffsetX;
var PortraitY = 180 + ImageOffsetY;
var PortraitSize = ImageSize + ImageOffsetSize;

if (!(ID == UnknownEnum.Value_126 && !DescriptionMode))
{
    draw_sprite_ext(PreviousImage, 0, 430, 180, PreviousImageSize, PreviousImageSize, AngleOffset, c_white, 1);
    draw_sprite_ext(Portrait, 0, PortraitX, PortraitY, PortraitSize, ImageSize + ImageOffsetSize, AngleOffset, c_white, 1);
}

draw_surface(OverGUISurf, 0, 0);

enum UnknownEnum
{
    Value_126 = 126
}
