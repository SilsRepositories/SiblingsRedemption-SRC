var border_l = (320 + current_offsetx) - (current_width / 2);
var border_r = (320 + current_offsetx) + (current_width / 2);
var border_u = (384 + current_offsety) - current_height;
var border_d = (384 + current_offsety);

global.LeftEdge = border_l;
global.RightEdge = border_r;

// Sets the floor for Blue Soul jumping
global.BoardFloor = border_d;
if obj_Soul.image_angle == 90 global.BoardFloor = border_r;
if obj_Soul.image_angle == 180 global.BoardFloor = border_u;
if obj_Soul.image_angle == -90 global.BoardFloor = border_l;

if (current_width == 570 && current_height == 120) {
	// Set up the text writer
	if instance_exists(Dialogue) {
		Dialogue.visible = false;
		Fight.visible = false;
		Act.visible = false;
		
		ActML.visible = false;
		ActMR.visible = false;
		
		ItemL.visible = false;
		ItemR.visible = false;
		Mercy.visible = false;
	}
	switch global.BattleMenu {
		case -1:
			// Create the instance responsible for drawing text
			// GetStatusText() will fetch the text depending on your encounter
			Dialogue = instance_create_depth(border_l + 30, border_u + 15, 0, obj_TextElement);
			Dialogue.TextToDraw = GetEnemyStatus();
			Dialogue.CanAdvance = false;
			Dialogue.Talker = "Battle";
			if instance_exists(obj_CharaMonster_Phase1) {
				if obj_CharaMonster_Phase1.MercyTries > 0
					Dialogue.Talker = "FloweyB";
			}
			if Dialogue.TextToDraw == "* YOU WILL REGRET THIS." {
				Dialogue.Talker = "DON'T";
			}
		
			// Fight Menu
			Fight = instance_create_depth(border_l + 50, border_u + 15, 0, obj_TextElement);
			for (var i = 0; i < array_length(global.Monster); i++) {
				if instance_exists(global.Monster[i]) {
					if global.Monster[i].MyHP <= 0.5 {
						Fight.TextToDraw += "~R";
					}
					Fight.TextToDraw += "* " + global.Monster[i].MyName + (global.Monster[i].MyHP <= 0.5 ? " (Down)~W&" : "~W&");
				}
				else
					Fight.TextToDraw += "  &";
			}
			Fight.TextLength = string_length(Fight.TextToDraw);
			Fight.CanAdvance = false;
			Fight.visible = false;
			Fight.Talker = "Silent";
		
			// ACT Menu, it's the same as FIGHT but it leads to the monster ACT commands
			Act = instance_create_depth(border_l + 50, border_u + 15, 0, obj_TextElement);
			for (var i = 0; i < array_length(global.Monster); i++) {
				if instance_exists(global.Monster[i]) {
					if global.Monster[i].MyHP <= 0.5 {
						Act.TextToDraw += "~R";
					}
					Act.TextToDraw += "* " + global.Monster[i].MyName + (global.Monster[i].MyHP <= 0.5 ? " (Down)~W&" : "~W&");
				}
				else
					Act.TextToDraw += "  &";
			}
			Act.TextLength = string_length(Act.TextToDraw);
			Act.CanAdvance = false;
			Act.visible = false;
			Act.Talker = "Silent";
		
			// Up to 6 commands can fit in the same menu using this method
			ActML = instance_create_depth(border_l + 50, border_u + 15, 0, obj_TextElement);
			ActML.visible = false;
			ActMR = instance_create_depth(border_l + 300, border_u + 15, 0, obj_TextElement);
			ActMR.visible = false;
			ActML.Talker = "Silent";
			ActMR.Talker = "Silent";
		
			// Item Menu, this is also in two halves
			ItemL = instance_create_depth(border_l + 50, border_u + 15, 0, obj_TextElement);
			for (var i = 0; i < array_length(global.Item); i += 2) {
				if (global.Item[i] != "")
					ItemL.TextToDraw += "* " + global.Item[i] + "&";
			}
			ItemL.TextLength = string_length(ItemL.TextToDraw);
			ItemL.CanAdvance = false;
			ItemL.visible = false;
			ItemL.Talker = "Silent";
		
			ItemR = instance_create_depth(border_l + 300, border_u + 15, 0, obj_TextElement);
			for (var i = 1; i < array_length(global.Item); i += 2) {
				if (global.Item[i] != "")
					ItemR.TextToDraw += "* " + global.Item[i] + "&";
			}
			ItemR.TextLength = string_length(ItemR.TextToDraw);
			ItemR.CanAdvance = false;
			ItemR.visible = false;
			ItemR.Talker = "Silent";
		
			// MERCY Menu
			Mercy = instance_create_depth(border_l + 50, border_u + 15, 0, obj_TextElement);
			for (var i = 0; i < array_length(global.Monster); i++) {
				if instance_exists(global.Monster[i]) {
					if global.Monster[i].CanSpare {
						Mercy.TextToDraw += "~Y";
						break;
					}
				}
			}
			Mercy.TextToDraw += "* Spare~D&* Flee";
			if !global.CanFlee
				Mercy.TextToDraw = "* Spare";
			Mercy.TextLength = string_length(Mercy.TextToDraw);
			Mercy.CanAdvance = false;
			Mercy.visible = false;
			Mercy.Talker = "Silent";
		
			// Sets the menu state to enable menu navigation
			// Also gets us out of this loop so that you don't create infinite writers, which would cause a memory leak and crash the game
			global.BattleMenu = 0;
			break;
		case 0:
			Dialogue.visible = true;
			break;
		case 1:
			Fight.visible = true;
			break;
		case 2:
			Act.visible = true;
			break;
		case 2.5:
			ActML.visible = true;
			ActMR.visible = true;
			ActML.TextToDraw = "";
			for (var j = 0; j < array_length(global.Monster[global.MRN].Act); j += 2) {
				ActML.TextToDraw += "* " + global.Monster[global.MRN].Act[j] + "&";
			}
			ActML.TextLength = string_length(ActML.TextToDraw);
			ActML.CanAdvance = false;
		
			ActMR.TextToDraw = "";
			for (var j = 1; j < array_length(global.Monster[global.MRN].Act); j += 2) {
				ActMR.TextToDraw += "* " + global.Monster[global.MRN].Act[j] + "&";
			}
			ActMR.TextLength = string_length(ActMR.TextToDraw);
			ActMR.CanAdvance = false;
			break;
		case 3:
			if (global.UISelectionMenu < 6) {
				ItemL.TextToDraw = "";
				ItemR.TextToDraw = "";
				for (var i = 0; i < array_length(global.Item); i += 2) {
					if (i > 5) break;
					if (global.Item[i] != "")
						ItemL.TextToDraw += "* " + global.Item[i] + "&";
				}
				for (var i = 1; i < array_length(global.Item); i += 2) {
					if (i > 5) break;
					if (global.Item[i] != "")
						ItemR.TextToDraw += "* " + global.Item[i] + "&";
				}
				ItemL.TextLength = string_length(ItemL.TextToDraw);
				ItemR.TextLength = string_length(ItemR.TextToDraw);
			}
			else {
				ItemL.TextToDraw = "";
				ItemR.TextToDraw = "";
				for (var i = 2; i < array_length(global.Item); i += 2) {
					if (global.Item[i] != "")
						ItemL.TextToDraw += "* " + global.Item[i] + "&";
				}
				for (var i = 3; i < array_length(global.Item); i += 2) {
					if (global.Item[i] != "")
						ItemR.TextToDraw += "* " + global.Item[i] + "&";
				}
				ItemL.TextLength = string_length(ItemL.TextToDraw);
				ItemR.TextLength = string_length(ItemR.TextToDraw);
			}
			ItemL.visible = true;
			ItemR.visible = true;
			break;
		case 4:
			Mercy.visible = true;
			break;
	}
}

// Restricts the SOUL to the Bullet Board boundaries
if !global.FreeMoving && Show {
	obj_Soul.x = clamp(obj_Soul.x, border_l + 8, border_r - 8);
	obj_Soul.y = clamp(obj_Soul.y, border_u + 8, border_d - 8);
}
else {
	obj_Soul.x = clamp(obj_Soul.x, 8, 632);
	obj_Soul.y = clamp(obj_Soul.y, 8, 472);
}
draw_set_color(c_red);
if instance_exists(obj_CharaMonster_Phase3) || global.EnemyGroup > 2
	draw_set_color(c_gray);
	
// Show the border based on encounter
if Show {
	draw_rectangle(border_l - 2, border_u - 4, border_r + 2, border_d + 4, false);
	draw_rectangle(border_l - 3, border_u - 3, border_r + 3, border_d + 3, false);
	draw_rectangle(border_l - 4, border_u - 2, border_r + 4, border_d + 2, false);
	draw_set_color(BackCol);
	draw_rectangle(border_l, border_u, border_r, border_d, false);
}

if devmode {
	global.Karma = global.PlayerMaxHP;
	global.PlayerHP = global.PlayerMaxHP;
}

if global.PlayerHP > global.PlayerMaxHP {
	global.PlayerHP = global.PlayerMaxHP;
	global.Karma = global.PlayerMaxHP;
}

if global.EnemyGroup < 6 {
	// HP bar, LV and Name display
	var hp_barwidth = global.PlayerMaxHP;
	var hp_barwidth_fill = global.PlayerHP;
	var hp_barwidth_karma = global.Karma;
	draw_set_font(font_battleui_hp);
	draw_set_color(c_white);
	draw_set_alpha(BattleUIAlpha);
	if global.EnemyGroup == 5
		draw_set_color(c_black);
	if global._b >= 4 && global.EnemyGroup < 5 && global.GoldSoul
		draw_set_color(0x00BBFF);
	draw_text(30, BattleUI, global.Name + "    LV " + string(global.PlayerLV));
	if !global.KARMA_ENABLED
		draw_text(320 + hp_barwidth, BattleUI, string(global.PlayerHP) + " / " + string(global.PlayerMaxHP));
	else {
		if global.Karma > global.PlayerHP {
			BLT += 1;
			if BLT >= 100 {
				global.PlayerHP -= 1;
				if global.PlayerHP < 1
					global.PlayerHP = 1;
				BLT = 0;
			}
			KarmaTimer += 0.2;
			if global.Karma < 7 && KarmaTimer > 6 {
				KarmaTimer = 0;
				global.Karma -= 1;
			}
			if global.Karma >= 7 && global.Karma < 16 && KarmaTimer > 14 {
				KarmaTimer = 0;
				global.Karma -= 1;
			}
			if global.Karma >= 16 && global.Karma < 25 && KarmaTimer > 10 {
				KarmaTimer = 0;
				global.Karma -= 1;
			}
			if global.Karma >= 25 && global.Karma < 35 && KarmaTimer > 6 {
				KarmaTimer = 0;
				global.Karma -= 1;
			}
			if global.Karma >= 35 && KarmaTimer > 2 {
				KarmaTimer = 0;
				global.Karma -= 1;
			}
			draw_set_color(c_maroon);
			if global._b >= 4 && global.EnemyGroup < 5 && global.GoldSoul
				draw_set_color(0x0066BB);
		}
		else {
			global.Karma = global.PlayerHP;
		}
		draw_text(370 + hp_barwidth, BattleUI, string(global.Karma) + " / " + string(global.PlayerMaxHP));
	}

	draw_set_color(c_white);
	if global.EnemyGroup == 5
		draw_set_color(c_black);
	if global._b >= 4 && global.EnemyGroup < 5 && global.GoldSoul
		draw_set_color(0x00BBFF);
	draw_set_font(font_battleui_widgets);
	draw_text(255, BattleUI, "HP");
	if global.KARMA_ENABLED {
		draw_text(320 + hp_barwidth, BattleUI, "BL");
	}

	draw_set_color(c_red);
	if global.EnemyGroup == 5
		draw_set_color(c_black);
	if global._b >= 4 && global.EnemyGroup < 5 && global.GoldSoul
		draw_set_color(0x00BBFF);
	draw_rectangle(300, BattleUI, 300 + hp_barwidth, BattleUI + 18, false);
	draw_set_color(c_maroon);
	if global._b >= 4 && global.EnemyGroup < 5 && global.GoldSoul
		draw_set_color(0x0066BB);
	if global.KARMA_ENABLED {
		draw_rectangle(300, BattleUI, 300 + hp_barwidth_karma, BattleUI + 18, false);
	}
	draw_set_color(c_yellow);
	draw_rectangle(300, BattleUI, 300 + hp_barwidth_fill, BattleUI + 18, false);
	draw_set_alpha(1);
}

if devmode {
	draw_set_font(font_battle_dialogue);
	draw_text(10, 10, "DEBUG");
	global.Turn = 404;
	global.CHP = 0;
	global.MonsterF[0, 0] = "Unknown";
	global.MonsterF[0, 1] = 0;
	with obj_BaseMonsterParams {
		if keyboard_check_pressed(ord("O")) {
			event_user(14);
		}
		if keyboard_check_pressed(ord("P")) {
			event_user(15);
		}
		if MyHP > 0 {
			global.MonsterF[global.CHP, 0] = MyName + " HP: ";
			global.MonsterF[global.CHP, 1] = string(MyHP) + "/" + string(MyMaxHP);
			global.CHP += 1;
		}
		global.Turn = Turn;
	}
	draw_text(10, 35, "Turn: " + string(global.Turn));
	draw_text(10, 60, "Hits: " + string(global.FG_Hits));
	draw_text(10, 85, "Starting phase: " + string(global.FG_Start));
	draw_text(10, 110, "Heals: " + string(global.FG_Heals));
	for (var i = 0; i < global.CHP; i++) {
		draw_text(10, 135 + (25 * i), global.MonsterF[i, 0] + global.MonsterF[i, 1]);
	}
}

// Drawing all attacks that are based on a surface
// If they do NOT appear, try setting their "depth" to 1
draw_set_color(c_white);
draw_surface_part_ext(global.BORDER_SURFACE, border_l, border_u, global.BorderWidth, global.BorderHeight, border_l, border_u, 1, 1, c_white, 1)