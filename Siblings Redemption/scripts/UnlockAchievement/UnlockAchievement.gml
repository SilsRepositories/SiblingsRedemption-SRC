// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function UnlockAchievement(_ach){
	ini_open("file0");
	ini_write_real("achievements", "ach" + string(_ach), 1);
	ini_close();
}