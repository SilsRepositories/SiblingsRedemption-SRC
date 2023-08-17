var fa = draw_get_halign();
draw_set_halign(fa_center);
draw_set_font(font_overworld_mars);
if obj_Soul.visible {
	draw_text(obj_Soul.x, obj_Soul.y - 20, string(global.PlayerHP) + " / " + string(global.PlayerMaxHP));
	draw_set_color(c_red);
	draw_rectangle(obj_Soul.x - 16, obj_Soul.y + 15, obj_Soul.x + 16, obj_Soul.y + 20, false);
	draw_set_color(c_yellow);
	draw_rectangle(obj_Soul.x - 16, obj_Soul.y + 15, (obj_Soul.x - 16) + (32 * (global.PlayerHP / global.PlayerMaxHP)), obj_Soul.y + 20, false);
}
draw_set_halign(fa);