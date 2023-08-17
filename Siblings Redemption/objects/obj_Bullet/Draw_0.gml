depth = -1;
if global.EnemyGroup > 4 {
	sprite_index = Knife_Black;
}
if (siner > 1) {
	if Inside {
		depth = 1;
		surface_set_target(global.BORDER_SURFACE);
		draw_self();
		surface_reset_target();
	}
	else {
		draw_self();
	}
}