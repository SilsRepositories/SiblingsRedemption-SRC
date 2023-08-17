if con == 0
	_y += 1;
if con == 2 {
	_y -= 1;
	if _y <= -70 {
		instance_destroy();
	}
}
if con >= 3 {
	_y -= 5;
	if _y <= -70 {
		instance_destroy();
	}
}
draw_set_alpha(1);
draw_sprite_ext(AchievementUnlocked, 0, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) + _y, 1, 1, 0, c_white, 1);
draw_sprite_ext(Achievement, ach, camera_get_view_x(view_camera[0]) + 35, camera_get_view_y(view_camera[0]) + _y + 35, 1, 1, 0, c_white, 1);
draw_set_color(c_yellow);
draw_set_font(font_achievement);
draw_text(camera_get_view_x(view_camera[0]) + 75, camera_get_view_y(view_camera[0]) + _y + 12, "ACHIEVEMENT UNLOCKED!");
draw_set_color(c_white);
draw_text(camera_get_view_x(view_camera[0]) + 75, camera_get_view_y(view_camera[0]) + _y + 32, global.Achievement[ach, 0]);