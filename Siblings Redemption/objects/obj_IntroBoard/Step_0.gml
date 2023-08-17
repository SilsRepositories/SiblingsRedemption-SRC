if alarm[0] > 0 {
	FadingStage = (1 / 60);
	if image_alpha >= 1 {
		FadingStage = 0;
	}
}
if alarm[1] > 0 {
	FadingStage = (-1 / 60);
	if (alarm[1] == 1) {
		image_index += 1;
		alarm[0] = 61;
	}
}
if keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter) {
	Timer = 7339;
}
image_blend = make_color_hsv(0, 255, 255);
Timer += 1;
image_alpha += FadingStage;
if (Timer == 240) {
	if instance_exists(Dialogue) instance_destroy(Dialogue);
	Dialogue = instance_create_depth(64, 160, -1000000, obj_TextElement);
	Dialogue.TextToDraw = "@2Long ago, two races&ruled over Earth,&HUMANS and MONSTERS.";
	Dialogue.CanAdvance = false;
	Dialogue.Unskippable = true;
	Dialogue.Talker = "Battle";
	alarm[3] = 440;
}
if (Timer == 820) {
	if instance_exists(Dialogue) instance_destroy(Dialogue);
	Dialogue = instance_create_depth(64, 160, -1000000, obj_TextElement);
	Dialogue.TextToDraw = "@2After the great war,&the monsters were&sealed underground.";
	Dialogue.CanAdvance = false;
	Dialogue.Unskippable = true;
	Dialogue.Talker = "Battle";
	alarm[3] = 440;
}
if (Timer == 1420) {
	if instance_exists(Dialogue) instance_destroy(Dialogue);
	Dialogue = instance_create_depth(64, 160, -1000000, obj_TextElement);
	Dialogue.TextToDraw = "@2Over the years,&the monsters became&frightened of humanity.";
	Dialogue.CanAdvance = false;
	Dialogue.Unskippable = true;
	Dialogue.Talker = "Battle";
	alarm[3] = 480;
}
if (Timer == 2020) {
	if instance_exists(Dialogue) instance_destroy(Dialogue);
	Dialogue = instance_create_depth(64, 150, -1000000, obj_TextElement);
	Dialogue.TextToDraw = "@2Bloodthirsty, a human&was determined to&eradicate them for&good.";
	Dialogue.CanAdvance = false;
	Dialogue.Unskippable = true;
	Dialogue.Talker = "Battle";
	alarm[3] = 600;
}
if (Timer == 2620) {
	if instance_exists(Dialogue) instance_destroy(Dialogue);
	Dialogue = instance_create_depth(64, 100, -1000000, obj_TextElement);
	Dialogue.TextToDraw = "@2The monsters gave it their&all, yet they eventually&succumbed to the&human's massacre.";
	Dialogue.CanAdvance = false;
	Dialogue.Unskippable = true;
	Dialogue.Talker = "Battle";
	alarm[3] = 480;
}
if (Timer == 3120) {
	if instance_exists(Dialogue) instance_destroy(Dialogue);
	Dialogue = instance_create_depth(64, 150, -1000000, obj_TextElement);
	Dialogue.TextToDraw = "@2ASGORE became afraid,&and decided he&wasn't going down&easily.";
	Dialogue.CanAdvance = false;
	Dialogue.Unskippable = true;
	Dialogue.Talker = "Battle";
}
if (Timer == 3620) {
	if instance_exists(Dialogue) instance_destroy(Dialogue);
	Dialogue = instance_create_depth(64, 160, -1000000, obj_TextElement);
	Dialogue.TextToDraw = "@2The human struggled,&but eventually&reigned victorious.";
	Dialogue.CanAdvance = false;
	Dialogue.Unskippable = true;
	Dialogue.Talker = "Battle";
	audio_play_sound(intro_noise, 0, false);
	alarm[3] = 480;
}
if (Timer == 4120) {
	if instance_exists(Dialogue) instance_destroy(Dialogue);
	Dialogue = instance_create_depth(64, 150, -1000000, obj_TextElement);
	Dialogue.TextToDraw = "@2Lurking in the shadows,&ASRIEL watched everything&in his flowery form.";
	Dialogue.CanAdvance = false;
	Dialogue.Unskippable = true;
	Dialogue.Talker = "Battle";
	alarm[3] = 480;
}
if (Timer == 4620) {
	if instance_exists(Dialogue) instance_destroy(Dialogue);
	Dialogue = instance_create_depth(64, 150, -1000000, obj_TextElement);
	Dialogue.TextToDraw = "@2He knew Chara had binded to&the human, and this endless&slaughter would give them&life once more.";
	Dialogue.CanAdvance = false;
	Dialogue.Unskippable = true;
	Dialogue.Talker = "Battle";
	alarm[3] = 540;
}
if (Timer == 5200) {
	if instance_exists(Dialogue) instance_destroy(Dialogue);
	Dialogue = instance_create_depth(64, 160, -1000000, obj_TextElement);
	Dialogue.TextToDraw = "@2So he set a plan into&motion, to obliterate the&human once and for all.";
	Dialogue.CanAdvance = false;
	Dialogue.Unskippable = true;
	Dialogue.Talker = "Battle";
	alarm[3] = 480;
}
if (Timer == 5720) {
	if instance_exists(Dialogue) instance_destroy(Dialogue);
	Dialogue = instance_create_depth(64, 160, -1000000, obj_TextElement);
	Dialogue.TextToDraw = "@2With Chara by his side,&they could finally bring&peace to the underground.";
	Dialogue.CanAdvance = false;
	Dialogue.Unskippable = true;
	Dialogue.Talker = "Battle";
	alarm[3] = 480;
}
if (Timer == 6320) {
	if instance_exists(Dialogue) instance_destroy(Dialogue);
	Dialogue = instance_create_depth(80, 150, -1000000, obj_TextElement);
	Dialogue.TextToDraw = "@4With the two siblings&reunited...&They shall achieve&    ~R REDEMPTION.";
	Dialogue.CanAdvance = false;
	Dialogue.Unskippable = true;
	Dialogue.Talker = "Battle";
	alarm[3] = 960;
}
if (Timer == 7340) {
	audio_stop_all();
	room_goto(Room_Name);
}