if room == Room_Finale {
	if FinaleSoul != 2
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale + 0.05, image_yscale + 0.05, image_angle, (image_angle == 180 ? c_yellow : c_red), image_alpha);
	else
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale + 0.05, image_yscale + 0.05, image_angle, (image_angle == 180 ? c_yellow : c_white), image_alpha);
}
if instance_exists(obj_CharaMonster_A_Finale) {
	if obj_CharaMonster_A_Finale.Charge > 0 {
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale + 0.05, image_yscale + 0.05, image_angle, c_white, (abs(sin(siner * 17)) * obj_CharaMonster_A_Finale.Charge));
	}
}
if FinaleSoul == 2 {
	draw_sprite_ext(Crosshair, 0, mouse_x, mouse_y, 1, 1, 0, c_white, image_alpha);
}
draw_self();