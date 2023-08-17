if (global.InvFrames <= 0) {
	if (image_blend == c_aqua && !(abs(obj_Soul.xprevious - obj_Soul.x) > 0 || abs(obj_Soul.yprevious - obj_Soul.y) > 0)) {
		exit;
	}
	if (image_blend == c_orange && (abs(obj_Soul.xprevious - obj_Soul.x) > 0 || abs(obj_Soul.yprevious - obj_Soul.y) > 0)) {
		exit;
	}
	audio_play_sound(Hurt, 1, false);
	global.InvFrames = 30;
	global.NoHit = false;
	global.FG_Hits += 1;
	var damage = 5;
	if (damage < 1)
		damage = 1;
	if instance_exists(obj_FloweyMonster_Phase1) {
		damage = obj_FloweyMonster_Phase1.Attack;
	}
	global.PlayerHP -= damage;
	if (global.PlayerHP < 1 && global.Karma > 1) {
		global.PlayerHP = 1;
		global.Karma -= damage;
	}
	if (global.PlayerHP <= 0) {
		global.PlayerHP = 0;
		room_goto(Room_GameOver);
	}
}
if (disocon) {
	instance_destroy();
}