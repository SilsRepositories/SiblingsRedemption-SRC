draw_self();
if Whiter < 1 {
	draw_set_color(c_black);
	draw_set_alpha(Whiter);
	draw_rectangle(-10, -10, 650, 490, false);
	draw_set_alpha(1);
}
if keyboard_check_pressed(ord("Z")) {
	Sel = 0;
	MoveOn = true;
}
if keyboard_check_pressed(ord("X")) {
	Sel = 1;
	MoveOn = true;
}
if MoveOn {
	Whiter += 0.01;
	alarm[0] = -1;
}
else if !global.nohitmode && global.SpeedrunMode == 0 {
	draw_set_font(font_battleui_widgets);
	draw_set_color(c_gray);
	draw_text(20, 430, "PRESS Z TO RETRY\nPRESS X TO GO BACK TO MENU");
	ha = draw_get_halign();
	draw_set_halign(fa_center);
	draw_set_color(c_red);
	draw_set_font(font_battle_dialogue);
	if WordStage == 1 draw_text(427, 30, "DO");
	if WordStage == 2 draw_text(427, 30, "DO NOT");
	if WordStage == 3 draw_text(427, 30, "DO NOT COME");
	if WordStage == 4 draw_text(427, 30, "DO NOT COME BACK.");
	draw_set_halign(ha);
}
if Sel == 0 {
	if Whiter == 1 {
		room_goto(Room_Finale);
		instance_destroy();
	}
}
else {
	if Whiter == 1 {
		room_goto(Room_MainMenu);
		global.coward = false;
		window_set_size(640, 480);
		surface_resize(application_surface, 640, 480);
		instance_destroy();
	}
}