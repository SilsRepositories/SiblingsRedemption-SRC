if (current_width < global.BorderWidth) {
	current_width += ((global.BorderWidth - current_width) / 2);
}
if (current_width > global.BorderWidth) {
	current_width -= ((current_width - global.BorderWidth) / 2);
}
if (current_height < global.BorderHeight) {
	current_height += ((global.BorderHeight - current_height) / 2);
}
if (current_height > global.BorderHeight) {
	current_height -= ((current_height - global.BorderHeight) / 2);
}
if global.SoulSpeed > 0 {
	if (obj_Soul.y > (BattleUI - 10) && BattleUIAlpha > 0.3) {
		BattleUIAlpha -= 0.025;
	}
	else if !Show {
		BattleUIAlpha += 0.025;
		if (BattleUIAlpha > 1)
			BattleUIAlpha = 1;
	}
}
if Show {
	BattleUIAlpha += 0.025;
	if (BattleUIAlpha > 1)
		BattleUIAlpha = 1;
}

//if keyboard_check_pressed(ord("H")) {
//	devmode = !devmode;
//}