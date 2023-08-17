if !dontRestrict && !instance_exists(obj_Phase6_CamHandler)
	camera_set_view_pos(view_camera[0], random_range(-ShakeEffect, ShakeEffect), random_range(-ShakeEffect, ShakeEffect));
ShakeEffect *= 0.9;
if global.EnemyGroup == 3
	global.Karma = -999;