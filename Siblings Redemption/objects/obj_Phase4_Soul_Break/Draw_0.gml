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
if MoveOn
	Whiter += 0.01;
else {
	draw_set_font(font_battleui_widgets);
	draw_set_color(c_gray);
	draw_text(20, 430, "PRESS Z TO RETRY\nPRESS X TO GO BACK TO MENU");
}
if Sel == 0 {
	if Whiter == 1 {
		room_goto(BattleRoom);
	}
	if Whiter == 1.01 {
		obj_CharaMonster_Phase4.Phase4Timer = 1005;
		obj_CharaMonster_Phase4.ySta = 30;
		Dialogue = instance_create_depth(163, 235, -1000000, obj_TextElement_Phase4);
		global.P4D += 1;
		if global.P4D >= 1 && global.P4D <= 3 {
			Dialogue.TextToDraw = "You're going to have&to try harder than&that to stop us.";
			Dialogue.TextQueue[0] = "So how about we continue&your eternity of&torment?";
		}
		if global.P4D >= 4 && global.P4D <= 6 {
			Dialogue.TextToDraw = "You're really struggling,&aren't you? That's just&precious.";
			Dialogue.TextQueue[0] = "We will NEVER get tired&of doing this!";
		}
		if global.P4D >= 7 && global.P4D <= 10 {
			Dialogue.TextToDraw = "Are you dying on purpose?&Or are you really that&bad at getting back?";
			Dialogue.TextQueue[0] = "No matter, let's just&continue.";
		}
		if global.P4D >= 11 {
			Dialogue.TextToDraw = "Perhaps you should reconsider&your life choices.";
			Dialogue.TextQueue[0] = "Because doing this is not cut&out for you.";
		}
		Dialogue.Talker = "Silent";
		instance_destroy();
	}
}
else {
	if Whiter == 1 {
		room_goto(Room_MainMenu);
		instance_destroy();
	}
}