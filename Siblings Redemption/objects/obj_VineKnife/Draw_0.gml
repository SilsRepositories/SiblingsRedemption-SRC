if Inside {
	depth = 1;
	surface_set_target(global.BORDER_SURFACE);
	draw_self();
	surface_reset_target();
}
else {
	draw_self();
}