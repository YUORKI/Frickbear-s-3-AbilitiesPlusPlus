depth = -10;
var AI = global.AILevels[ID];
var SurfX = 280;
var SurfY = (YOffset + 360) - 96;
var PlayerCooldown = lerp(30, 45, AI / 20);
var EnemyAttackRate = lerp(240, 120, AI / 20);
var EncounterRate = 60 * lerp(24, 8, AI / 20);
TicksTilFight = min(TicksTilFight, EncounterRate);
EnemyAttackTimer = min(EnemyAttackTimer, EnemyAttackRate);

if (AI <= 0)
    exit;

if (!surface_exists(RPGSurface))
    RPGSurface = surface_create(80, 80);

surface_set_target(RPGSurface);
draw_clear_alpha(c_white, 0);

if (DeathFrames > 0)
{
    draw_sprite(SPRITE_Menus, 3 + ((DeathFrames > 60) ? (floor(DeathFrames / 4) % 2) : 0), 0, 0);
    DeathFrames--;
    
    if (DeathFrames == 0)
        jumpscare(ID);
}
else
{
    draw_sprite_tiled(SPRITE_Background, 0, FreddyProgress * -1, 0);
    draw_sprite(SPRITE_Freddy, floor(FreddyProgress / 16) % 2, 24, 24);
    
    if (BattleMode)
    {
        var TransitionOut = EnemyHP <= 0 && HurtFrames == 0;
        BattleWindowSize += (sign(!TransitionOut - BattleWindowSize) / 12);
        
        if (BattleWindowSize == 0 && EnemyHP <= 0)
        {
            BattleMode = false;
            TicksTilFight = EncounterRate * random_range(0.9, 1.1);
        }
        
        var WindowDegree = round((1 - BattleWindowSize) * 4) / 4;
        
        if (BattleWindowSize == 1)
        {
            var WindowOffset = round(dsin(BattleWindowShake * 90)) * ceil(BattleWindowShake / 5);
            draw_sprite(SPRITE_Menus, 0, WindowOffset, 0);
            
            if (!(ceil(HurtFrames / ((EnemyHP > 0) ? 5 : 10)) % 2) && !(HurtFrames < 30 && EnemyHP <= 0))
                draw_sprite(SPRITE_Enemies, (floor(BattleFrame / 30) % 2) + (EnemyType * 2), 16 + WindowOffset, 3);
            
            draw_rectangle_color(12 + WindowOffset, 53, lerp(11, 73, FreddyHP) + WindowOffset, 57, c_white, c_white, c_white, c_white, false);
            
            if (ActionCooldown <= 0 && EnemyHP > 0)
            {
                draw_sprite(SPRITE_Menus, 1, 0, 0);
                
                if (HealsLeft)
                    draw_sprite(SPRITE_Menus, 2, 0, 0);
                
                if (CommandInput == 1)
                {
                    audio_play_sound(sfxBitCrunch, 5, false);
                    audio_play_sound(sfxBitPlace, 5, false);
                    HurtFrames = 22;
                    ActionCooldown = 60;
                    EnemyHP -= 0.5;
                    
                    if (EnemyHP <= 0)
                    {
                        HurtFrames = 90;
                        audio_play_sound(sfxBitExplosionAlt, 10, false);
                        audio_play_sound(sfxBitCollect, 10, false);
                        block_tokens();
                    }
                }
                
                if (CommandInput == 2)
                {
                    audio_play_sound(sfxBitBoost, 5, false);
                    FreddyHP = 1;
                    EnemyAttackTimer += 30;
                    ActionCooldown = PlayerCooldown;
                    HealsLeft--;
                }
            }
            
            ActionCooldown--;
            
            if (BattleWindowShake > 0)
                BattleWindowShake--;
            
            if (EnemyHP > 0)
                EnemyAttackTimer--;
            
            if (EnemyAttackTimer <= 0)
            {
                EnemyAttackTimer = EnemyAttackRate;
                BattleWindowShake = 25;
                FreddyHP -= 0.25;
                audio_play_sound(sfxBitPunish, 5, false);
                audio_play_sound(sfxBitCrunch, 5, false);
            }
            
            if (FreddyHP <= 0)
            {
                DeathFrames = 120;
                audio_play_sound(sfxBitExplosion, 50, false);
            }
            
            if (HurtFrames > 0)
                HurtFrames--;
            
            if (EnemyHP > 0)
                BattleFrame++;
        }
        else
        {
            draw_rectangle_color(3 + (38 * WindowDegree), 3 + (29 * WindowDegree), 76 - (38 * WindowDegree), 59 - (29 * WindowDegree), c_black, c_black, c_black, c_black, false);
            draw_rectangle_color(3 + (38 * WindowDegree), 3 + (29 * WindowDegree), 76 - (38 * WindowDegree), 59 - (29 * WindowDegree), c_white, c_white, c_white, c_white, true);
        }
    }
    else
    {
        FreddyProgress++;
        TicksTilFight--;
        
        if (TicksTilFight <= 0)
        {
            EnemyType = (EnemyType + irandom_range(1, 2)) % 3;
            BattleMode = true;
            ActionCooldown = 0;
            EnemyAttackTimer = max(EnemyAttackTimer, 30);
            EnemyHP = 1;
            HealsLeft = 1;
        }
    }
}

surface_reset_target();
set_target_to_ui();
draw_surface(RPGSurface, SurfX, SurfY);
draw_sprite(sNightmareMinigameMiniWindow, 0, SurfX, SurfY);
var OffsetTarg = 0;

if (mouse_in_zone(SurfX - 16, 248, 128, 128) && !BattleMode)
    OffsetTarg = 128;

YOffset += YOffsetSpeed;
YOffsetSpeed = lerp(YOffsetSpeed, (OffsetTarg - YOffset) * 0.2, 0.25);
surface_reset_target();
