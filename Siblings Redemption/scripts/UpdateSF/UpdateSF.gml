// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function UpdateSF(_phase, _noheal, _nohit) {
	ini_open("file0");
	ini_write_real("phaseprogress", "phase" + string(_phase), 1);
	if _noheal && ini_read_real("noheal", "noheal" + string(_phase), 0) == 0
		ini_write_real("noheal", "noheal" + string(_phase), 1);
	if _nohit && ini_read_real("nohit", "nohit" + string(_phase), 0) == 0
		ini_write_real("nohit", "nohit" + string(_phase), 1);
	ini_close();
}