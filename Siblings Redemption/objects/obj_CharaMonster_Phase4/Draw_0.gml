draw_sprite_ext(Menu_BG, 0, 0, 0, 1, 1, 0, c_grey, (Phase4Timer / 1620));
draw_set_color(c_white);
draw_set_alpha(WhiteFlash);
WhiteFlash -= 0.03;
if (MyHP > 0) {
	image_index = 0;
}
else {
	image_index = 3;
}
draw_rectangle(-100, -100, 740, 580, false);
draw_set_alpha(1);
draw_set_color(c_red);

for (var k = 0; k < 3; k++) {
	draw_sprite_ext(spr_vines_flowey_0, 2, 120 + (200 * k), -50 + (clamp(ySta, -800, 30) / 8), 1, 1 + (sin(siner / 4) / (9 - k)), 0, c_maroon, 1);
	draw_sprite_ext(spr_vines_flowey_0, 1, 120 + (200 * k), -50 + (clamp(ySta, -800, 30) / 4), 1, 1 + (sin(siner / 3) / (9 - k)), 0, c_maroon, 1);
	draw_sprite_ext(spr_vines_flowey_0, 0, 120 + (200 * k), -50 + (clamp(ySta, -800, 30) / 2), 1, 1 + (sin(siner / 2) / (9 - k)), 0, c_maroon, 1);
}

if Phase4Timer >= 655 && Phase4Timer < 1006 {	
	for (var i = 0; i < 20; i++) {
		for (var j = 0; j < 3; j++) {
			draw_sprite_ext(spr_pipepart_0, 0, 240 - (20 * i), (1300 - Phase4Timer) + (50 * j), 1 + abs(sin(siner + i) / 2), 1 + abs(sin(siner + i) / 2), sin(siner + i), c_black, 1);
			draw_sprite_ext(spr_pipepart_0, 0, 400 + (20 * i), (1300 - Phase4Timer) + (50 * j), 1 + abs(sin(siner + i) / 2), 1 + abs(sin(siner + i) / 2), sin(siner + i), c_black, 1);
		}
	}
	
	draw_sprite_ext(spr_sidestalk_0, Phase4Timer, 160, 1100 - Phase4Timer, -1, 1, (150 + sin(Phase4Timer / 80)) * 12, c_black, 1);
	draw_sprite_ext(spr_sidestalk_0, Phase4Timer, 480, 1100 - Phase4Timer, 1, 1, (150 + sin(Phase4Timer / 80)) * -12, c_black, 1);
	draw_sprite_ext(Phase4_Body, 0, 320, 1006 - Phase4Timer, 1, 1, 0, c_black, 1);
	draw_sprite_ext(Phase4_Overlay, 0, 320, 1006 - Phase4Timer, 1, 1, 0, c_black, 1);
}
if Phase4Timer >= 1006 {
	for (var i = 0; i < 20; i++) {
		for (var j = 0; j < 3; j++) {
			draw_sprite_ext(spr_pipepart_0, 0, 240 - (20 * i), 305 + (50 * j) + soa, 1 + abs(sin(siner + i) / 2), 1 + abs(sin(siner + i) / 2), sin(siner + i), c_dkgray, 1);
			draw_sprite_ext(spr_pipepart_0, 0, 400 + (20 * i), 305 + (50 * j) + soa, 1 + abs(sin(siner + i) / 2), 1 + abs(sin(siner + i) / 2), sin(siner + i), c_dkgray, 1);
		}
	}
	
	draw_sprite_ext(spr_sidestalk_0, Phase4Timer, 160, 105 + soa, -1, 1, (150 + sin(Phase4Timer / 80)) * 12, c_dkgray, 1);
	draw_sprite_ext(spr_sidestalk_0, Phase4Timer, 480, 105 + soa, 1, 1, (150 + sin(Phase4Timer / 80)) * -12, c_dkgray, 1);
	draw_sprite_ext(Phase4_Body, 0, 320, 5 + abs(sin(siner)) + soa, 1, 1, (soa / 20), c_dkgray, 1);
	draw_sprite_ext(Phase4_Overlay, 0, 320, 5 + abs((sin(siner / 2) * 8)) + soa, 1, 1, sin(siner) + (soa / 20), c_dkgray, 1);
	
	if ySta > 30 {
		soa += 0.3;
		draw_sprite_ext(spr_sidestalk_0, Phase4Timer, 160, 105 + soa, -1, 1, sin(Phase4Timer / 80) * 12, make_color_hsv(ySta, 255, 255), 1);
		draw_sprite_ext(spr_sidestalk_0, Phase4Timer, 480, 105 + soa, 1, 1, sin(Phase4Timer / 80) * -12, make_color_hsv(ySta, 255, 255), 1);
		draw_sprite_ext(Phase4_Body, 0, 320, 5 + abs(sin(siner)) + soa, 1, 1, soa / 30, make_color_hsv(ySta, 255, 255), 1);
		draw_sprite_ext(Phase4_Overlay, 0, 320, 5 + abs((sin(siner / 2) * 8)) + soa, 1, 1, sin(siner) + (soa / 30), make_color_hsv(ySta, 255, 255), 1);
	}
	draw_line(220, -10, x - 40, y);
	draw_line(250, -10, x - 30, y);
	draw_line(275, -10, x - 20, y);
	draw_line(300, -10, x - 10, y);
	draw_line(320, -10, x, y);
	draw_line(340, -10, x + 10, y);
	draw_line(365, -10, x + 20, y);
	draw_line(390, -10, x + 30, y);
	draw_line(420, -10, x + 40, y);
}

siner += 0.08;
var dir = -90 + (sin(siner) * (ShakeEffect * 3));
x = 320 + lengthdir_x(90, dir);
y = ySta + lengthdir_y(90, dir);
if ySta < 30 || MyHP <= 0 {
	ySta += 0.5;
	if ySta > 30 && ySta % 2 == 0 {
		var layer_fx = layer_get_fx("Effect_1");
		fx_set_parameter(layer_fx, "g_RGBNoiseIntensity", (30 - ySta) / 6);
		audio_play_sound(TVExplosion, 0, false);
		instance_create_depth(x - random_range(-90, 90), y - random_range(-70, 70), -10000, obj_Explosion_Phase4);
		repeat 2
			instance_create_depth(random(640), random(480), -10000, obj_Explosion_Phase4);
	}
}
draw_self();
if Phase4Timer >= 14580 && Phase4Timer < 17100 {
	draw_set_color(c_black);
	draw_set_alpha(1 - (Phase4Timer - 15600) / 1500);
	draw_rectangle(-100, -100, 740, 580, false);
	draw_set_alpha(1);
}
draw_set_color(c_black);
BAlp = lerp(BAlp, BGAlp, 0.04);
if BGAlp > 0.1 {
	alarm[2] = -1;
	if instance_exists(obj_Phase4_FightButton)
		instance_destroy(obj_Phase4_FightButton);
}
draw_set_alpha(BAlp);
draw_rectangle(-100, -100, 740, 580, false);
draw_set_alpha(1);
if global.PlayerHP < global.PlayerMaxHP {
	draw_set_color(c_maroon);
	draw_rectangle(280, 450, 360, 470, false);
	draw_set_color(c_yellow);
	draw_rectangle(280, 450, 280 + (80 * (global.PlayerHP / global.PlayerMaxHP)), 470, false);
}