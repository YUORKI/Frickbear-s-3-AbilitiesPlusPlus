var ID = UnknownEnum.Value_26;
var AI = global.AILevels[ID];

if (Initialize && AI > 0)
{
    var BidybabLocations = array_create(32, false);
    var BidybabAmount = AI;
    var Destination = irandom_range(0, array_length(BidybabLocations) - 1);
    
    repeat (BidybabAmount)
    {
        while (BidybabLocations[Destination])
            Destination = irandom_range(0, array_length(BidybabLocations) - 1);
        
        BidybabLocations[Destination] = true;
        
        with (instance_create_depth(0, 0, 1, oBidybab))
        {
            Camera = floor(Destination / 4) + 1;
            BabID = Destination % 4;
            sprite_index = other.SPRITE_Bidybabs;
        }
        
        BidybabsLeft++;
    }
    
    Initialize = false;
}

depth = 80;

enum UnknownEnum
{
    Value_26 = 26
}
