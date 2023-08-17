if instance_exists(obj_Phase4_FightButton) {
	instance_destroy(obj_Phase4_FightButton);
	alarm[2] = 1;
}
if Phase4Timer < 12000 || Phase4Timer > 17000 {
	instance_create_depth(265, 240, -1, obj_Phase4_FightButton);
	alarm[2] = 200;
}