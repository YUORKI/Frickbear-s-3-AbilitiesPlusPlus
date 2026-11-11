var textureFront = surfaceHandling(global.SurfaceF, SPRITE_WallFront, 0, 1088, 448, WallScale);
var textureLeft = surfaceHandling(global.SurfaceL, SPRITE_WallLeft, 0, 576, 448, WallScale);
var textureBack = surfaceHandling(global.SurfaceB, SPRITE_WallBack, 0, 1088, 960, WallScale);
var textureRight = surfaceHandling(global.SurfaceR, SPRITE_WallRight, 0, 1600, 448, WallScale);
shader_set(TransparencyShader);
draw_3d_square(x1, y1, x2, y2, x3, y3, x4, y4, depth, 0, 1, 1, textureFront, textureLeft, textureBack, textureRight);
shader_reset();
