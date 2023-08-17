// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ChangeSoulAngle(angle) {
	obj_Soul.Mode = 1;
	obj_Soul.image_angle = angle;
	obj_Soul.BLUE_Gravity = 12;
	obj_Soul.BLUE_Jumped = 1;
	audio_play_sound(Ping, 20, false);
}