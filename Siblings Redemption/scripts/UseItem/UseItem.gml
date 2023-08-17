// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function UseItem(itemNum) {
	var StartingHP = global.PlayerHP;
	var Healed = false;
	var ItemKeep = false;
	var PrevArmor = "";
	var PrevWeapon = "";
	
	var border_l = 320 - (obj_BulletBoard.current_width / 2);
	var border_u = 384 - obj_BulletBoard.current_height;
	
	var j = 0;
	for (var i = 0; i < 3; i++) {
		if instance_exists(global.Monster[i]) {
			global.Monster[i].Dialogue = instance_create_depth(border_l + 30, border_u + 15, -1000000, obj_TextElement);
			global.Monster[i].Dialogue.CanAdvance = true;
			j = i;
			break;
		}
	}
	
	global.FG_Heals += 1;
	switch global.Item[itemNum] {
		case "Pie":
			global.PlayerHP += 99;
			global.Monster[j].Dialogue.TextToDraw = "* You ate the Butterscotch Pie.&";
			break;
		case "Steak":
			global.PlayerHP += 60;
			global.Monster[j].Dialogue.TextToDraw = "* You ate the Face Steak.&";
			break;
		case "S.Piece":
			global.PlayerHP += 45;
			global.Monster[j].Dialogue.TextToDraw = "* You ate the Snowman Piece.&";
			break;
		case "G.Burger":
			global.PlayerHP += 27;
			global.Monster[j].Dialogue.TextToDraw = "* You ate the Glamburger.&";
			break;
		case "Stick":
			global.Monster[j].Dialogue.TextToDraw = "* You threw the Stick.&* Then you picked it back up&  again.";
			break;
		case "L.Hero":
			global.PlayerHP += 40;
			global.PlayerAttack += 4;
			global.Monster[j].Dialogue.TextToDraw = "* You ate the Legendary Hero.&* ATTACK increased by 4!&";
			break;
		case "Coffee":
			global.SoulSpeed += 1;
			global.PlayerHP += 12;
			global.PlayerAttack *= 2;
			global.Monster[j].Dialogue.TextToDraw = "* You drank the Coffee!&* Your SPEED increased!&";
			audio_play_sound(snd_speedup, 0, false);
			break;
		default:
			global.Monster[j].Dialogue.TextToDraw = "* This item is unknown.&";
			global.PlayerHP += 10;
			break;
	}
		
	if (PrevArmor != "")
		global.Item[itemNum] = PrevArmor;
	if (PrevWeapon != "")
		global.Item[itemNum] = PrevWeapon;
	if (StartingHP < global.PlayerHP) {
		audio_play_sound(Heal, 1, false);
		global.NoHeal = false;
		if !ItemKeep {
			global.Item[itemNum] = "";
			Healed = true;
		}
		if (global.PlayerHP >= global.PlayerMaxHP) {
			global.Monster[j].Dialogue.TextToDraw += "* Your HP was maxed out!";
		}
		else {
			global.Monster[j].Dialogue.TextToDraw += "* You recovered " + string(global.PlayerHP - StartingHP) + " HP!";
		}
	}
	else {
		audio_play_sound(Item, 1, false);
	}
	global.PlayerHP = clamp(global.PlayerHP, 0, global.PlayerMaxHP);
	for (var i = 0; i < array_length(global.Item) - 1; i++) {
		if (global.Item[i] == "") {
			global.Item[i] = global.Item[i + 1];
			global.Item[i + 1] = "";
		}
	}
	if Healed
		array_resize(global.Item, array_length(global.Item) - 1);
}