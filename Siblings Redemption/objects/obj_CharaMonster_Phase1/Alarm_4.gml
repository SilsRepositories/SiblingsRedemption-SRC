BGen = instance_create_depth(x, y, 0, obj_BulletGenerator);
BGen.Turn = Turn - 1;
if !Fought && !obj_FloweyMonster_Phase1.Fought && !Disarmed && MercyTries <= 0 {
	BGen.Turn = -19;
	Turn -= 1;
	exit;
}
if (Turn >= 8) {
	BGen.Turn = choose(0, 1, 2, 3, 4, 6);
}
if Disarmed {
	BGen.Turn = -66;
}
switch Turn {
	case 1:
		BGen.alarm[1] = 420;
		break;
	case 2: 
		BGen.alarm[1] = 420;
		break;
	case 3: 
		BGen.alarm[1] = 800;
		break;
	case 4: 
		BGen.alarm[1] = 600;
		break;
	case 5: 
		BGen.alarm[1] = 660;
		break;
	case 6: 
		BGen.alarm[1] = 840;
		break;
	case 7: 
		BGen.alarm[1] = 600;
		break;
}
if MercyTries > 0 && !Disarmed {
	BGen.Turn = 999999;
	BGen.alarm[1] = 180;
}
if MercyTries == 6 {
	BGen.Turn = 727;
	BGen.alarm[1] = -1;
}
Fought = false;
obj_FloweyMonster_Phase1.Fought = false;