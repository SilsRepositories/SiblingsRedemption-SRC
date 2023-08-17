if Mode == SoulModes.Green {
	draw_sprite(Soul_Shield_Surround, 0, x, y);
}
if Mode == SoulModes.Purple {
	draw_set_color(c_purple);
	PURPLE_Line1Height = global.BoardFloor - (global.BorderHeight - 10);
	PURPLE_Line2Height = global.BoardFloor - (global.BorderHeight / 2);
	PURPLE_Line3Height = global.BoardFloor - 10;
	
	if PURPLE_SpiderLine == 1 y = lerp(y, PURPLE_Line1Height, 0.4);
	if PURPLE_SpiderLine == 2 y = lerp(y, PURPLE_Line2Height, 0.4);
	if PURPLE_SpiderLine == 3 y = lerp(y, PURPLE_Line3Height, 0.4);
	
	draw_line((320 + obj_BulletBoard.current_offsetx) - ((global.BorderWidth / 2) - 12), PURPLE_Line1Height, (320 + obj_BulletBoard.current_offsetx) + ((global.BorderWidth / 2) - 12), PURPLE_Line1Height);
	draw_line((320 + obj_BulletBoard.current_offsetx) - ((global.BorderWidth / 2) - 12), PURPLE_Line2Height, (320 + obj_BulletBoard.current_offsetx) + ((global.BorderWidth / 2) - 12), PURPLE_Line2Height);
	draw_line((320 + obj_BulletBoard.current_offsetx) - ((global.BorderWidth / 2) - 12), PURPLE_Line3Height, (320 + obj_BulletBoard.current_offsetx) + ((global.BorderWidth / 2) - 12), PURPLE_Line3Height);
}
if global._b >= 4 && global.EnemyGroup < 5 && global.GoldSoul
	sprite_index = Soul_Gold;
draw_self();
if Mode == SoulModes.Yellow {
	draw_sprite_ext(Soul_Break_Flowey, 0, x, y, 1, 1, image_angle, c_white, Charge * abs(sin(Siner)));
	if Charge >= 1
		Siner += 0.3;
	else
		Siner = 1;
}