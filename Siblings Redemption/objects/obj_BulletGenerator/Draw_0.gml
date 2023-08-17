if P2FT > 0 && P2FT < 3270 {
	depth = obj_BulletBoard.depth + 1;
	draw_set_alpha(P2FT / 300);
	draw_set_color(c_black);
	draw_rectangle(-10, -10, 650, 490, false);
	draw_set_alpha(1);
}
else if alarm[1] > 1872 && global.EnemyGroup < 3 {
	draw_sprite_ext(Shadow, 0, 320, 240, 1.1, 1.1, 0, c_white, abs(sin(alarm[1] / 40) / 1.2));
}
if (Turn == 727) {
	depth = -1000000;
	if Phase2Timer > 480 {
		draw_set_alpha((Phase2Timer - 480) / 600);
		draw_set_color(c_black);
		draw_rectangle(-10, -10, 650, 490, false);
		draw_set_alpha(1);
	}
}
if (P3FT > 740 && P3FT < 860) {
	draw_sprite_ext(GasterWarning, 0, 320, 240, 2, 2, 0, c_white, abs(sin(P3FT / 2)));
}
if (Phase2Timer > 2450 && Phase2Timer < 2689) {
	BLTimer -= 1.275;
	if BLTimer < 0
		BLTimer = 0;
	obj_CharaMonster_Phase1.image_blend = make_color_rgb(BLTimer, BLTimer, BLTimer);
	draw_set_color(c_white);
	draw_set_alpha((Phase2Timer - 2450) / 200);
	draw_rectangle(0, 0, 9999, 9999, false);
}
if (Phase2Timer >= 2689 && Phase2Timer < 2729) {
	draw_set_color(c_white);
	obj_BattleEffects.CMAB -= 0.1;
	draw_set_alpha((2729 - Phase2Timer) / 30);
	draw_rectangle(0, 0, 9999, 9999, false);
}
if Turn == -68 {
	draw_set_alpha(1 - (IntroTimer / 206));
	draw_set_color(c_black);
	draw_rectangle(-10, -10, 650, 490, false);
	draw_set_alpha(1);
}
if Turn == -65 || Turn == -66 || Turn == -67 || Turn == -68 {
	draw_set_alpha(0.5);
	draw_set_font(font_battleui_hp);
	draw_set_color(c_white);
	draw_text(camera_get_view_x(view_camera[0]) + 10, 10, "Press L to skip");
	draw_set_alpha(1);
}
if Phase2Timer == 2730 {
	draw_set_alpha(1);
}
if (P3FT > 2560 && P3FT < 3000) {
	obj_BulletBoard.BattleUIAlpha -= 0.01;
	global.SoulSpeed = 0;
	obj_Soul.y += 1;
	depth = -1000000;
	draw_set_color(c_white);
	draw_set_alpha((P3FT - 2560) / 150);
	draw_rectangle(0, 0, 9999, 9999, false);
}
if (P3FT >= 3000 && P3FT < 3150) {
	draw_set_color(c_white);
	draw_set_alpha(1 - ((P3FT - 3000) / 150));
	draw_rectangle(0, 0, 9999, 9999, false);
}
if (Turn == 49.5) {
	depth = -1000000;
	alarm[1] = -1;
	R3 += 1;
	if (R3 <= 100)
		draw_sprite_ext(_6Update, 0, 0, 0, 1, 1, 0, c_white, 1);
	if (R3 > 100 && R3 <= 250)
		draw_sprite_ext(_6Update, 1, 0, 0, 1, 1, 0, c_white, 1);
	if (R3 > 250 && R3 <= 300)
		draw_sprite_ext(_6Update, 2, 0, 0, 1, 1, 0, c_white, 1);
	if (R3 > 300 && R3 <= 350)
		draw_sprite_ext(_6Update, 3, 0, 0, 1, 1, 0, c_white, 1);
	if (R3 > 350 && R3 <= 400)
		draw_sprite_ext(_6Update, 4, 0, 0, 1, 1, 0, c_white, 1);
	if (R3 > 400 && R3 <= 550)
		draw_sprite_ext(_6Update, 5, 0, 0, 1, 1, 0, c_white, 1);
	if (R3 > 550 && R3 <= 950)
		draw_sprite_ext(_6Update, 6, 0, 0, 1, 1, 0, c_white, 1);
	if (R3 > 950 && R3 <= 1550)
		draw_sprite_ext(_6Update, 7, 0, 0, 1, 1, 0, c_white, 1);
	if (R3 > 1550 && R3 <= 1640) {
		if R3 == 1551 audio_play_sound(corruption0, 0, false);
		draw_sprite_ext(_6Update, 8, 0, 0, 1, 1, 0, c_white, 1);
	}
	if (R3 > 1640 && R3 <= 1780) {
		if R3 == 1641 audio_play_sound(corruption1, 0, false);
		draw_sprite_ext(_6Update, 9, 0, 0, 1, 1, 0, c_white, 1);
	}
	if (R3 > 1780 && R3 <= 2120) {
		if R3 == 1781 audio_play_sound(corruption2, 0, false);
		draw_sprite_ext(_6Update, 10, 0, 0, 1, 1, 0, c_white, 1);
	}
	if (R3 > 2120 && R3 <= 2340)
		draw_sprite_ext(_6Update, 11, 0, 0, 1, 1, 0, c_white, 1);
	if (R3 > 2340 && R3 <= 2700)
		draw_sprite_ext(_6Update, 12, 0, 0, 1, 1, 0, c_white, 1);
	if (R3 == 2700) {
		global.EnemyGroup = 6;
		room_restart();
	}
}
if (Turn == 50) {
	depth = -999999;
	if A2 > 10300 && A2 <= 10900 {
		draw_set_alpha((A2 - 10300) / 80);
		draw_set_color(c_white);
		draw_rectangle(-10, -10, 650, 490, false);
		draw_set_alpha(1);
	}
	if A2 > 10900 && A2 <= 11300 {
		draw_set_alpha(1 - ((A2 - 10900) / 400));
		draw_set_color(c_white);
		draw_rectangle(-10, -10, 650, 490, false);
		draw_set_alpha(1);
	}
	if A2 > 11702 && A2 < 12002 {
		draw_sprite_ext(savefile, 0, 150, 103, 2, 2, 0, c_white, (A2 - 11702) / 30);
		draw_set_alpha((A2 - 11702) / 30);
		draw_set_color(c_white);
		draw_set_font(font_savefile);
		draw_text(150, 97, global.Name);
		draw_set_alpha(1);
	}
	if A2 > 13012 && A2 < 13112 {
		draw_sprite_ext(FinaleBoard, 0, 0, 0, 2, 2, 0, c_red, (A2 - 13012) / 100);
		draw_set_alpha(1);
	}
	if A2 > 13112 && A2 < 13212 {
		draw_sprite_ext(FinaleBoard, 0, 0, 0, 2, 2, 0, c_red, 1 - ((A2 - 13112) / 100));
		draw_set_alpha(1);
	}
	if A2 > 13212 && A2 < 13312 {
		draw_sprite_ext(FinaleBoard, 1, 0, 0, 2, 2, 0, c_red, (A2 - 13212) / 100);
		draw_set_alpha(1);
	}
	if A2 > 13312 && A2 < 13412 {
		draw_sprite_ext(FinaleBoard, 1, 0, 0, 2, 2, 0, c_red, 1 - ((A2 - 13312) / 100));
		draw_set_alpha(1);
	}
	if A2 >= 11400 {
		draw_set_alpha(0.5);
		draw_set_font(font_battleui_hp);
		draw_text(camera_get_view_x(view_camera[0]) + 10, 10, "Press L to skip");
		draw_set_alpha(1);
	}
}