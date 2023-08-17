// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MakeCSlash(pointX, pointY, pointDir) {
	slash = instance_create_depth(pointX, pointY, -9000, obj_CharaSlash);
	slash.Dir = pointDir;
}