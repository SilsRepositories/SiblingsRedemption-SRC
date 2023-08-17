// Draw every button sprite with the "Unselected" form
var buttons = 4;
if global.EnemyGroup == 3 || global.GA {
	buttons = 2;
}
var Index = 0;
if global.EnemyGroup > 2 || instance_exists(obj_CharaMonster_Phase3)
	Index = 2;
for (var i = 0; i < buttons; i++) {
	draw_sprite(ButtonSprites[i], Index, ButtonPositions_X[i], 430);
}

// To make sure that our menu is navigatable, we set the UISelectionMenu variable to -1 when we don't want it
// I.E. during attacks or cutscenes
if (global.UISelectionMenu > -1 && global.BattleMenu >= 0) {
	
	// Main menu
	if (global.BattleMenu == 0) {
		if keyboard_check_pressed(vk_left) {
			global.UISelectionMenu -= 1;
			audio_play_sound(MenuMove, 1, false);
			if global.UISelectionMenu < 0 {
				global.UISelectionMenu = (buttons - 1);
			}
		}
		if keyboard_check_pressed(vk_right) {
			global.UISelectionMenu += 1;
			audio_play_sound(MenuMove, 1, false);
			if global.UISelectionMenu > (buttons - 1) {
				global.UISelectionMenu = 0;
			}
		}
			
		global.UISelectionMenu = clamp(global.UISelectionMenu, 0, buttons - 1);
		var SoulSprite = Soul;
		if global._b >= 4 && global.EnemyGroup < 5 && global.GoldSoul
			SoulSprite = Soul_Gold;
		for (var i = 0; i < buttons; i++) {
			draw_sprite(ButtonSprites[i], ((global.UISelectionMenu == i && !instance_exists(obj_BulletGenerator)) ? 1 : Index), ButtonPositions_X[i], 430);
			if !instance_exists(obj_BulletGenerator)
				draw_sprite(SoulSprite, 0, ButtonPositions_X[global.UISelectionMenu] + 16, 452);  
		}
	}
	
	// This forces the selection variable to stay within a certain range to prevent crashes and other weird oddities
	// Fight and ACT selection menu
	if (global.BattleMenu == 1 || global.BattleMenu == 2) {
		var Monsters = 0;
		for (var n = 0; n < 3; n++) {
			if global.Monster[n] != noone {
				Monsters += 1;
			}
		}
		if global.Monsters == 0
			global.Monsters = Monsters;
		global.UISelectionMenu = clamp(global.UISelectionMenu, 0, global.Monsters);
		
		// Draws the health bar of the monsters, unless the monster doesn't want the health bar shown: "ShowHealthBar"
		for (var i = 0; i < array_length(global.Monster); i++) {
			if instance_exists(global.Monster[i]) {
				if (global.Monster[i].ShowHealthBar) {
					var percent = (global.Monster[i].MyHP / global.Monster[i].MyMaxHP) * 100;
					draw_set_color(c_red);
					draw_rectangle(470, 287 + (30 * i), 570, 304 + (30 * i), false);
					draw_set_color(c_lime);
					draw_rectangle(470, 287 + (30 * i), 470 + percent, 304 + (30 * i), false);
				}
			}
		}
	}
	
	var SoulSprite = Soul;
	if global._b >= 4 && global.EnemyGroup < 5 && global.GoldSoul
		SoulSprite = Soul_Gold;
	// Vertical movement, "else" is for grid menus like ITEM and ACT commands
	if (global.BattleMenu == 1 || global.BattleMenu == 2 || global.BattleMenu == 4)
		draw_sprite(SoulSprite, 0, 63, 295 + (30 * clamp(global.UISelectionMenu, 0, 5)));
	else if (global.BattleMenu > 0)
		draw_sprite(SoulSprite, 0, 63 + (250 * (global.UISelectionMenu % 2)), 295 + (30 * floor(clamp(global.UISelectionMenu, 0, 5) / 2)));
		
	// Back out of a menu
	if (keyboard_check_pressed(ord("X")) || keyboard_check_pressed(vk_rshift)) && global.BattleMenu > 0 {
		global.BattleMenu = 0;
		global.UISelectionMenu = BelowUIReferenceNum;
	}
	
	// Navigation controls
	if global.BattleMenu != 0 && global.BattleMenu != 2.5 && global.BattleMenu != 3 {
		if keyboard_check_pressed(vk_up) {
			global.UISelectionMenu -= 1;
			Dir -= 1;
			audio_play_sound(MenuMove, 1, false);
		}
		if keyboard_check_pressed(vk_down) {
			global.UISelectionMenu += 1;
			Dir += 1;
			audio_play_sound(MenuMove, 1, false);
		}
		
		if (global.UISelectionMenu < 0) {
			global.UISelectionMenu = 0;
		}
	}
	else if (global.BattleMenu > 2) {
		if (global.UISelectionMenu < 0) {
			global.UISelectionMenu = 0;
		}
		var Items = 0;
		if global.BattleMenu == 2.5
			Items = array_length(global.Monster[MonsterReferenceNum].Act);
		if global.BattleMenu == 3 {
			for (var n = 0; n < array_length(global.Item); n++) {
				if global.Item[n] != "" {
					Items += 1;
				}
			}
		}
		if keyboard_check_pressed(vk_up) && global.UISelectionMenu > 1 {
			global.UISelectionMenu -= 2;
			Dir -= 2;
			audio_play_sound(MenuMove, 1, false);
		}
		if keyboard_check_pressed(vk_down) && global.UISelectionMenu < Items - 2 {
			global.UISelectionMenu += 2;
			Dir += 2;
			audio_play_sound(MenuMove, 1, false);
		}
		if keyboard_check_pressed(vk_left) && global.UISelectionMenu % 2 == 1 {
			global.UISelectionMenu -= 1;
			Dir -= 1;
			audio_play_sound(MenuMove, 1, false);
		}
		if keyboard_check_pressed(vk_right) && global.UISelectionMenu % 2 == 0 {
			global.UISelectionMenu += 1;
			Dir += 1;
			audio_play_sound(MenuMove, 1, false);
		}
	}
	if (global.BattleMenu == 1 || global.BattleMenu == 2) {
		if Dir != 0 {
			var noMons1 = (global.Monster[1] == noone);
			var noMons2 = (global.Monster[2] == noone);
			if noMons1 || noMons2 {
				while (global.Monster[global.UISelectionMenu] == noone) {
					global.UISelectionMenu += Dir;
				
					if (global.UISelectionMenu < 0)
						global.UISelectionMenu = array_length(global.Monster) - 1;
				
					if (global.UISelectionMenu >= array_length(global.Monster) - 1)
						global.UISelectionMenu = 0;
				}
			}
			else {
				if (global.UISelectionMenu < 0)
					global.UISelectionMenu = 0;
				if (global.UISelectionMenu > 2)
					global.UISelectionMenu = 2;
			}
			Dir = 0;
		}
	}
	
	// Monster ACT menu
	if (global.BattleMenu == 2.5)
		global.UISelectionMenu = clamp(global.UISelectionMenu, 0, array_length(global.Monster[MonsterReferenceNum].Act) - 1);
		
	// Item menu
	if (global.BattleMenu == 3) {
		var Items = 0;
		for (var n = 0; n < array_length(global.Item); n++) {
			if global.Item[n] != "" {
				Items += 1;
			}
		}
		global.UISelectionMenu = clamp(global.UISelectionMenu, 0, Items - 1);
		if (Items == 0) {
			global.BattleMenu = 0;
			global.UISelectionMenu = 2;
		}
	}
		
	if (global.BattleMenu == 4)
		global.UISelectionMenu = clamp(global.UISelectionMenu, 0, global.CanFlee);
	
	// Confirm an input
	if keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter) {
		// A better way of writing "if (so and so)" repeatedly, useful for infinite cases
		audio_play_sound(Select, 1, false);
		switch global.BattleMenu {
			case 0:
				// FIGHT, ACT, ITEM, MERCY
				global.BattleMenu = (global.UISelectionMenu + 1);
				if (global.BattleMenu == 3 && array_length(global.Item) == 0) {
					global.BattleMenu = 0;
					exit;
				}
				
				// Keeps your original option in mind on the four buttons at the bottom
				BelowUIReferenceNum = global.UISelectionMenu;
				
				// Sets your input action back to the first option
				global.UISelectionMenu = 0;
				if (global.BattleMenu == 1 || global.BattleMenu == 2) {
					for (var i = 0; i < 3; i++) {
						if instance_exists(global.Monster[i]) {
							global.UISelectionMenu = i;
							break;
						}
					}
				}
				
				// You MUST include this to get out of the loop, otherwise your action will not work
				break;
			case 1:
				// Target bar menu
				MonsterReferenceNum = global.UISelectionMenu;
				if (global.Monster[MonsterReferenceNum].MyHP <= 0.5) {
					global.BattleMenu = 0;
					global.UISelectionMenu = BelowUIReferenceNum;
					with obj_BulletBoard {
						Dialogue.TextLength = 0;
						Dialogue.CurrentDelay = 0;
						Dialogue.IsWriting = true;
						Dialogue.TextToDraw = "~R* He's learned HIS lesson.&* Deal with the other one.";
						Dialogue.CanAdvance = false;
						Dialogue.Talker = "FloweyB";	
					}
					exit;
				}
				global.MRN = MonsterReferenceNum;
				CreateTarget();
				global.BattleMenu = 1.5;
				global.UISelectionMenu = -1;
				break;
			case 2:
				// ACT menu
				MonsterReferenceNum = global.UISelectionMenu;
				if (global.Monster[MonsterReferenceNum].MyHP <= 0.5) {
					global.BattleMenu = 0;
					global.UISelectionMenu = BelowUIReferenceNum;
					with obj_BulletBoard {
						Dialogue.TextLength = 0;
						Dialogue.CurrentDelay = 0;
						Dialogue.IsWriting = true;
						Dialogue.TextToDraw = "~R* Don't cry for him.&* He's already dead.";
						Dialogue.CanAdvance = false;
						Dialogue.Talker = "FloweyB";	
					}
					exit;
				}
				global.MRN = MonsterReferenceNum;
				global.BattleMenu = 2.5;
				global.UISelectionMenu = 0;
				break;
			case 2.5:
				// ACT commands
				with (global.Monster[global.MRN]) {
					event_user(global.UISelectionMenu);
				}
				global.BattleMenu = -2;
				global.UISelectionMenu = -1;
				break;
			case 3:
				// Item menu
				UseItem(global.UISelectionMenu);
				global.BattleMenu = -2;
				global.UISelectionMenu = -1;
				break;
			case 4:
				var border_l = 320 - (obj_BulletBoard.current_width / 2);
				var border_u = 384 - obj_BulletBoard.current_height;
				// Spare or Flee from a monster
				if (global.UISelectionMenu == 0) {
					var Spares = 0;
					for (var i = 0; i < 3; i++) {
						if instance_exists(global.Monster[i]) {
							if (global.Monster[i].CanSpare) {
								with (global.Monster[i])
									alarm[3] = 1;
								Spares += 1;
							}
						}
					}
					global.BattleMenu = -9999;
					global.UISelectionMenu = -1;
					for (var i = 0; i < 3; i++) {
						if instance_exists(global.Monster[i]) {
							global.Monster[i].ReadyForBattle = true;
						}
					}
				}
				global.UISelectionMenu = 0;
				break;
		}
	}
}
var deadMonsters = 0;
for (var i = 0; i < array_length(global.Monster); i++) {
	if (global.Monster[i] == noone) {
		deadMonsters++;
	}
	if (deadMonsters >= array_length(global.Monster)) {
		if WinText == noone && !BattleWon {
			var AccumulatedEXP = (global.PlayerEXP - CurrentEXP);
			var AccumulatedGOL = (global.PlayerGOL - CurrentGOL);
		
			var border_l = 320 - (obj_BulletBoard.current_width / 2);
			var border_u = 384 - obj_BulletBoard.current_height;
							
			global.BattleMenu = -9999;
			global.UISelectionMenu = -1;
			WinText = instance_create_depth(border_l + 30, border_u + 15, 0, obj_TextElement);
			WinText.TextToDraw = "* YOU WON!&* You got " + string(AccumulatedEXP) + " EXP and&  " + string(AccumulatedGOL) + " GOLD!";
			var CurrentLV = global.PlayerLV;
			LevelUpEXP(global.PlayerEXP);
			if (CurrentLV != global.PlayerLV) {
				audio_play_sound(LV, 20, false);
				WinText.TextToDraw += " LEVEL UP!";
			}
			WinText.CanAdvance = true;
			BattleWon = true;
			audio_stop_sound(global.BattleMusic);
		}
	}
}