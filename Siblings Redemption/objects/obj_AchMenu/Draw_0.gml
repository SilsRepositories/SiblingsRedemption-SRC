draw_set_font(font_battle_dialogue);
ha = draw_get_halign();
draw_set_halign(fa_center);
if (image_xscale > (baseX + 0.02)) {
	draw_set_color(c_yellow);
	draw_text(320, 375, global.Achievement[achInd, 0]);
	draw_set_color(c_white);
	draw_text(320, 405, global.Achievement[achInd, 1]);
}
draw_set_halign(ha);
draw_set_alpha(1);
draw_self();