var DoorSpeed = 30;

if (instance_exists(oFredbearAttack_Claw))
{
    if (oFredbearAttack_Claw.Active && DoorNum == sign_to_binary(oFredbearAttack_Claw.Side))
    {
        global.Doors[DoorNum] = true;
        y = (BaseY - sprite_height) + oFredbearAttack_Claw.YOffset;
        exit;
    }
    else if (DoorNum == sign_to_binary(oFredbearAttack_Claw.Side))
    {
        y += ((BaseY - y) / 5);
        exit;
    }
}

if ((instance_exists(oBigTop) && oBigTop.Active && DoorNum == sign_to_binary(oBigTop.Side)) || (instance_exists(oDJMusicMan) && oDJMusicMan.Prying))
{
    if (instance_exists(oBigTop) && oBigTop.Prying)
    {
        global.Doors[DoorNum] = false;
        y = (BaseY - sprite_height) + oBigTop.YOffset;
        exit;
    }
    else if (instance_exists(oDJMusicMan) && oDJMusicMan.Prying)
    {
        global.Doors[DoorNum] = false;
        y = (BaseY - sprite_height) + oDJMusicMan.YOffset;
        exit;
    }
    else if (instance_exists(oBigTop) && oBigTop.HandAnimStage == "Attacking")
    {
        y += ((BaseY - y) / 5);
        exit;
    }
}

if (global.Doors[DoorNum] == true && !instance_exists(oLaserDoor))
{
    y = min(BaseY, y + DoorSpeed);
    
    if (Bounce && y > ((BaseY - sprite_height) + BounceFloor))
    {
        global.Doors[DoorNum] = false;
        BounceFrames = 30;
        
        with (oSalvageHead)
            slam();
        
        if (character_active(UnknownEnum.Value_66) && oGlamrockFreddy.LeaningIn)
        {
            with (oGlamrockFreddy)
                slam(other.DoorNum);
        }
    }
}
else if (BounceFrames > 0)
{
    y += ((BaseY - sprite_height - y) / 10);
    BounceFrames--;
}
else
{
    y = max(BaseY - sprite_height, y - DoorSpeed);
}

enum UnknownEnum
{
    Value_66 = 66
}
