PizzaMeter = 0.5;
Heating = false;
HeatMax = 1;
MeatMin = 0;

function jumpscare_at_6AM()
{
    if (instance_exists(oJumpscare))
        return false;
    
    if (PizzaMeter < HeatMin || PizzaMeter > HeatMax)
    {
        jumpscare(UnknownEnum.Value_69);
        return true;
    }
    
    return false;
}

enum UnknownEnum
{
    Value_69 = 69
}
