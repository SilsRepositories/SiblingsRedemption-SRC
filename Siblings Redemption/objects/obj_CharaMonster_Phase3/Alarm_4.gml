BGen = instance_create_depth(x, y, 0, obj_BulletGenerator);
var ignore = false;
if Turn > 7 {
	BGen.Turn = choose(19, 20, 21, 22, 23, 24, 25);
	BGen.alarm[1] = 700;
	Turn = 7.1;
	ignore = true;
}
if MyHP <= 160 {
	Turn = 8;
}
if !ignore || Turn == 8
	BGen.Turn = Turn + 18;
	
switch Turn {
	case 0:
		BGen.alarm[1] = 180;
		BGen.Turn = 99999;
		break;
	case 1:
		BGen.alarm[1] = 640;
		break;
	case 3:
		BGen.alarm[1] = 750;
		break;
	case 5:
		BGen.alarm[1] = 700;
		break;
	case 6:
		BGen.alarm[1] = 640;
		global.BorderWidth = 170;
		global.BorderHeight = 170;
		break;
	case 7:
		BGen.alarm[1] = 700;
		global.BorderWidth = 300;
		global.BorderHeight = 100;
		break;
	case 8:
		BGen.alarm[1] = -1;
		audio_stop_sound(global.BattleMusic);
		audio_play_sound(sr_phase3_final, 0, false);
		break;
}
if (EndingTime) {
	BGen.alarm[1] = -1;
	BGen.Turn = 6666;
}