global.Menu = 0;
MenuLength = 0;
PhaseOffset = 0;
window_set_size(640, 480);
surface_resize(application_surface, 640, 480);
global.Choice = -1;
global.P7Checkpoint = 0;
b1 = instance_create_depth(180, 680, 0, obj_Menu_Button);
b1.image_index = 0;
b2 = instance_create_depth(180, 725, 0, obj_Menu_Button);
b2.image_index = 1;
b3 = instance_create_depth(180, 770, 0, obj_Menu_Button);
b3.image_index = 2;
b4 = instance_create_depth(180, 815, 0, obj_Menu_Button);
b4.image_index = 3;
b4 = instance_create_depth(180, 860, 0, obj_Menu_Button);
b4.image_index = 4;
alpha = 1.5;
Unlock = 1;
siner = 0;
global._b = 0;
pa = 0;
showNotes = false;
audio_play_sound(mus_sfx_abreak, 0, false);
noheal[0] = false;
noheal[1] = false;
noheal[2] = false;
noheal[3] = false;
noheal[4] = false;
noheal[5] = false;
noheal[6] = false;
nohit[0] = false;
nohit[1] = false;
nohit[2] = false;
nohit[3] = false;
nohit[4] = false;
nohit[5] = false;
nohit[6] = false;
sure = 0;
ai = 0;
if !file_exists("file0") {
	ini_open("file0");
	ini_write_real("phaseprogress", "phase1", 0);
	ini_write_real("phaseprogress", "phase2", 0);
	ini_write_real("phaseprogress", "phase3", 0);
	ini_write_real("phaseprogress", "phase4", 0);
	ini_write_real("nohit", "nohit1", 0);
	ini_write_real("nohit", "nohit2", 0);
	ini_write_real("nohit", "nohit3", 0);
	ini_write_real("nohit", "nohit4", 0);
	ini_write_real("noheal", "noheal1", 0);
	ini_write_real("noheal", "noheal2", 0);
	ini_write_real("noheal", "noheal3", 0);
	ini_write_real("noheal", "noheal4", 0);
	ini_write_real("settings", "antiepilepsy", 0);
	ini_write_real("settings", "nohitmode", 0);
	ini_write_string("settings", "version", "1.2.0");
	ini_close();
	global.antiEpilepsy = false;
	global.nohitmode = false;
}
else {
	ini_open("file0");
	for (var i = 1; i < 8; i++) {
		Unlock += ini_read_real("phaseprogress", "phase" + string(i), 0);
		noheal[i - 1] = ini_read_real("noheal", "noheal" + string(i), 0);
		nohit[i - 1] = ini_read_real("nohit", "nohit" + string(i), 0);
		if i < 5 {
			var prevB = global._b;
			global._b += ini_read_real("nohit", "nohit" + string(i), 0);
			if prevB == global._b
				global._b += ini_read_real("noheal", "noheal" + string(i), 0) / 2;
		}
	}
	var k = 0;
	for (var j = 0; j < 8; j++) {
		if ini_read_real("achievements", "ach" + string(j), 0) == 1 {
			j += 1;
			k += 1;
		}
	}
	if (k == 8) {
		UnlockAchievement(8);
	}
	global.antiEpilepsy = ini_read_real("settings", "antiepilepsy", 0);
	global.nohitmode = ini_read_real("settings", "nohitmode", 0);
	vers = ini_read_string("settings", "version", "1.0.0");
	if vers != "1.2.0" {
		ini_write_string("settings", "version", "1.2.0");
		showNotes = true;
	}
	ini_close();
}
x = 260;
y = 100;
audio_play_sound(sr_menu, 0, true, 0.5);
audio_play_sound(sr_phase4_preview, 0, true);