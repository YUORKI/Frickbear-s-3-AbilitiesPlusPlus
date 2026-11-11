var SurfX = 280;
var SurfY = (YOffset + 360) - 96;
CommandInput = 0;

if (BattleMode && BattleWindowSize == 1)
{
    var CanAct = ActionCooldown <= 0 && EnemyHP > 0;
    
    if (clicked(SurfX + 2, SurfY + 63, 37, 15))
    {
        CommandInput = 1 * CanAct;
        mouse_clear(mb_left);
    }
    
    if (clicked(SurfX + 37, SurfY + 63, 37, 15) && HealsLeft)
    {
        CommandInput = 2 * CanAct;
        mouse_clear(mb_left);
    }
}
