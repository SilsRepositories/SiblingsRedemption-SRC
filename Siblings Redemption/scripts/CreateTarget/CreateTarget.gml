// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CreateTarget() {
	var border_u = 384 - (obj_BulletBoard.current_height - 3);
	instance_create_depth(320, border_u, -1, obj_TargetField);
	var Bars_X = choose(-20, 660);
	
	global.PriorityBar = 0;
	global.BarCount = 1;
	
	if (global.PlayerAttack == 0)
		global.PlayerAttack = 99 + (2 * global.PlayerLV);
	
	bar = instance_create_depth(Bars_X, 384 - (global.BorderHeight / 2), -2, obj_TargetBar);
	bar.hspeed = ((Bars_X < 320) ? 6 : -6);
	bar.priority = 0;
}