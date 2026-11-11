shader_reset();

if (!surface_exists(global.SurfaceF))
    global.SurfaceF = surface_create(sprite_get_width(sOfficeWallFront) * WallScale, sprite_get_height(sOfficeWallFront) * WallScale);

if (!surface_exists(global.SurfaceL))
    global.SurfaceL = surface_create(sprite_get_width(sOfficeWallLeft) * WallScale, sprite_get_height(sOfficeWallLeft) * WallScale);

if (!surface_exists(global.SurfaceB))
    global.SurfaceB = surface_create(sprite_get_width(sOfficeWallBack) * WallScale, sprite_get_height(sOfficeWallBack) * WallScale);

if (!surface_exists(global.SurfaceR))
    global.SurfaceR = surface_create(sprite_get_width(sOfficeWallRight) * WallScale, sprite_get_height(sOfficeWallRight) * WallScale);
