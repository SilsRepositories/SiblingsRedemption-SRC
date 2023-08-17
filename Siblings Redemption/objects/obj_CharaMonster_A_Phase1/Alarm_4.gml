BGen = instance_create_depth(x, y, 0, obj_BulletGenerator);
BGen.Turn = Turn + 29;
BGen.alarm[1] = 900;
switch Turn {
	case 3:
		BGen.alarm[1] = 750;
		break;
	case 4:
		BGen.alarm[1] = 900;
		SetSoulMode("BLUE");
		break;
	case 5:
		BGen.alarm[1] = 800;
		break;
	case 6:
		global.BorderWidth = 160;
		global.BorderHeight = 160;
		BGen.alarm[1] = 1200;
		break;
	case 7:
		SetSoulMode("RED");
		break;
	case 8:
		BGen.alarm[1] = 719;
		break;
	case 10:
		BGen.alarm[1] = 2400;
		global.BorderWidth = 400;
		global.BorderHeight = 160;
		audio_play_sound(asset_get_index("mus_dialup_" + string(choose(0,1,2,3,4))), 0, false);
		break;
	case 11:
		BGen.Turn = 999999;
		BGen.alarm[1] = 60;
		break;
	case 12:
		BGen.Turn = 40;
		BGen.alarm[1] = -1;
		break;
}

if Turn == 0 || Mutate {
	BGen.Turn = 999999;
	BGen.alarm[1] = 180;
}
if (MoveOn) {
	BGen.Turn = 49.5;
	BGen.alarm[1] = -1;
}