alarm[5] = 20;
if instance_exists(obj_BulletBoard) && !Disarmed && MercyTries == 0 {
	if obj_BulletBoard.visible {
		sL = instance_create_depth(-50, 480, 10, obj_Phase1_BGElement);
		sL.hspeed = 3;
		sL.friction = 0.02;
		sR = instance_create_depth(690, 480, 10, obj_Phase1_BGElement);
		sR.hspeed = -3;
		sR.friction = 0.02;
	}
}