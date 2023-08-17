global.BorderWidth = 570;
global.BorderHeight = 120;

global.PlayerLV = 20;
global.PlayerAttack = 99;
global.PlayerDefense = 99;
global.InvFrames = 0;

global.PlayerMaxHP = 20 + ((global.PlayerLV - 1) * 4);
if (global.EnemyGroup < 4) {
	if global.FG_Heals == 0 && global.PlayerHP <= 0
		global.PlayerHP = 20 + ((global.PlayerLV - 1) * 4);
	
	if (global.PlayerLV == 20) {
		global.PlayerMaxHP = 99;
	
		if global.FG_Heals == 0 && global.PlayerHP <= 0
			global.PlayerHP = 99;
	}
}
else {
	global.PlayerLV = 21;
	global.PlayerMaxHP = 100;
	
	if global.FG_Heals == 0 && global.PlayerHP <= 0
		global.PlayerHP = 100;
}
if global.nohitmode {
	global.PlayerHP = 1;
	global.PlayerMaxHP = 1;
}

global.UISelectionMenu = 0;
global.BattleMenu = -1;
global.FreeMoving = false;

CreateEnemyGroup(global.EnemyGroup);
instance_create_depth(320, 384, 1, obj_BulletBoard);
obj_Soul.visible = false;