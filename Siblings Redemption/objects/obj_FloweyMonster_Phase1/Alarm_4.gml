if (MyHP > 0.0002) {
	if !Fought && !obj_CharaMonster_Phase1.Fought {
		Turn -= 1;
		exit;
	}
	BGen = instance_create_depth(x, y, 0, obj_BulletGenerator);
	BGen.Turn = Turn - 0.5;
	BGen.alarm[1] = 999;
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
	}
	
	if Turn > 3 {
		Nerve += 1;
		if Nerve > 5
			Nerve = 5;
		Defense -= 10;
	}
}