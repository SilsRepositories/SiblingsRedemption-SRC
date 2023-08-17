BGen = instance_create_depth(x, y, 0, obj_BulletGenerator);
BGen.Turn = Turn + 8;
switch Turn {
	case 1: 
		BGen.alarm[1] = 640;
		break;
	case 2: 
		BGen.alarm[1] = 1100;
		break;
	case 3: 
		BGen.alarm[1] = 750;
		break;
	case 5: 
		BGen.alarm[1] = 800;
		break;
	case 6:
		global.BorderWidth = 160;
		global.BorderHeight = 160;
		break;
	case 9:
		BGen.Turn = choose(10, 11, 12, 13, 15, 16);
		break;
	case 10:
		MyHP = 2160;
		BGen.alarm[1] = 7200;
		audio_stop_sound(global.BattleMusic);
		audio_play_sound(sr_phase2_final, 0, false);
		break;
	case 11:
		BGen.Turn = 999999;
		BGen.alarm[1] = 180;
		break;
	case 12:
		BGen.Turn = -67;
		BGen.alarm[1] = -1;
		break;
}
if !Fought && Turn < 11 {
	BGen.Turn = -20;
	BGen.alarm[1] = 445;
}
SetSoulMode(Fought ? "YELLOW" : "RED");
Fought = false;