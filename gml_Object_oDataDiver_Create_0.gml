TabletUp = false;
TabletOffset = 400;
TabletOffsetSpeed = 0;
MimicSurf = -1;
Choice = -1;
var ID = UnknownEnum.Value_73;
SuitNames = skin_get_attribute(ID, "SuitNames", ["ELEPHANT", "MYCELIUM MAN", "SWING BEE", "SHARPAY", "JESTER", "HEDGEHOG HUDGIE", "CARTER CATERPILLAR", "PARTY TIME CHICA"]);
MessageMove = skin_get_attribute(ID, "MessageMove", "The Mimic has moved to a new suit!");
MessageDefeat = skin_get_attribute(ID, "MessageDefeat", "The Mimic has been subdued!");
UIColor = skin_get_attribute(ID, "UIColor", [105, 195, 65]);
Color = make_color_rgb(UIColor[0], UIColor[1], UIColor[2]);
Flags = array_create(8, false);
HoveredSuit = -1;

enum UnknownEnum
{
    Value_73 = 73
}
