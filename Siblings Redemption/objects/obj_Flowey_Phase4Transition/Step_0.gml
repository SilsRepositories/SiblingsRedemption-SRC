obj_BattleEffects.CMAB = 0;
if (con == 0) {
	image_index += 0.25;
	if image_index == 7 {
		con = 1;
		alarm[0] = 180;
	}
}
if (con == 2) {
	MySpeechBubble = instance_create_depth(x + 60, y - 25, -10000, obj_SpeechBubble);
	MySpeechBubble._ref = self;
	MySpeechBubble.TextToSend = "Oh.";
	MySpeechBubble.TextToStore[0] = "~F3You're still here?";
	MySpeechBubble.TextToStore[1] = "~F6Even after all that?";
	if instance_exists(obj_Chara_Phase3Ending) {
		MySpeechBubble.TextToSend = "Oh...";
		MySpeechBubble.TextToStore[0] = "~F7...Chara?";
		MySpeechBubble.TextToStore[1] = "~F7...You alive?";
	}
	MySpeechBubble.Talker = "FloweyA";
	con = 3;
}
if (con == 3 && !instance_exists(obj_SpeechBubble)) {
	con = 4;
	alarm[0] = 180;
}
if (con == 5) {
	MySpeechBubble = instance_create_depth(x + 60, y - 25, -10000, obj_SpeechBubble);
	MySpeechBubble._ref = self;
	MySpeechBubble.TextToSend = "~F1You tried to kill&me, didn't you?";
	MySpeechBubble.TextToStore[0] = "~F7Hee... hee...";
	MySpeechBubble.TextToStore[1] = "~F5You're less of a&friend...";
	MySpeechBubble.TextToStore[2] = "~F4And more of an&IDIOT at this&point.";
	MySpeechBubble.TextToStore[3] = "~F8Did you really&think you could&get rid of me&that easily?";
	MySpeechBubble.TextToStore[4] = "...";
	MySpeechBubble.TextToStore[5] = "~F9You REALLY are an&idiot.";
	MySpeechBubble.TextToStore[6] = "~F8While you were busy&playing with some&dude...";
	if instance_exists(obj_Chara_Phase3Ending) {
		MySpeechBubble.TextToSend = "~F3I...";
		MySpeechBubble.TextToStore[0] = "~F5I kinda knew this&would happen...";
		MySpeechBubble.TextToStore[1] = "~F5Oh, Chara...";
		MySpeechBubble.TextToStore[2] = "~F4How could I have&been so STUPID?";
		MySpeechBubble.TextToStore[3] = "~F1I did know this&was going to&happen.";
		MySpeechBubble.TextToStore[4] = "~F8Because I planned&this all out from the&start.";
		MySpeechBubble.TextToStore[5] = "~F9You IDIOT.";
		MySpeechBubble.TextToStore[6] = "~F8While you two were&quarrelling with&each other...";
	}
	MySpeechBubble.Talker = "FloweyA";
	con = 6;
}
if (con == 6 && !instance_exists(obj_SpeechBubble)) {
	con = 7;
	alarm[0] = 120;
}
if (con == 8) {
	MySpeechBubble = instance_create_depth(x + 60, y - 25, -10000, obj_SpeechBubble);
	MySpeechBubble._ref = self;
	MySpeechBubble.TextToSend = "~F9I found these!";
	MySpeechBubble.TextToStore[0] = "~F8I knew that&fighting you&alone wouldn't&work, so Chara&helped me.";
	MySpeechBubble.TextToStore[1] = "~F9With them by my&side, I thought we&would beat you.";
	MySpeechBubble.TextToStore[2] = "~F1But that didn't&work either...";
	MySpeechBubble.TextToStore[3] = "~F2So I had to&think of another&plan.";
	MySpeechBubble.TextToStore[4] = "~F8That's when I found&these.";
	MySpeechBubble.TextToStore[5] = "~F9The SOULs.";
	if instance_exists(obj_Chara_Phase3Ending) {
		MySpeechBubble.TextToStore[2] = "~F8But with that plan&out of the window...";
		MySpeechBubble.TextToStore[3] = "~F8I went hunting.";
	}
	MySpeechBubble.Talker = "FloweyA";
	con = 9;
}
if (con == 9 && !instance_exists(obj_SpeechBubble)) {
	con = 10;
	alarm[0] = 120;
}
if (con == 11) {
	MySpeechBubble = instance_create_depth(x + 60, y - 25, -10000, obj_SpeechBubble);
	MySpeechBubble._ref = self;
	MySpeechBubble.TextToSend = "~F0Oh, I almost&forgot one&important&detail.";
	MySpeechBubble.TextToStore[0] = "~F9While you were&falling, I met up&with Alphys.";
	MySpeechBubble.TextToStore[1] = "~F6Our confrontation&wasn't the most&friendly...";
	MySpeechBubble.TextToStore[2] = "~F8But she told me&something.";
	MySpeechBubble.TextToStore[3] = "~F8That if I were&to use these...";
	MySpeechBubble.TextToStore[4] = "~F8Not only could&I reload my&SAVE...";
	MySpeechBubble.TextToStore[5] = "~F9But I could ALSO&finish my goal&of defeating you.";
	MySpeechBubble.TextToStore[6] = "~F0...";
	MySpeechBubble.TextToStore[7] = "~F0What's that?";
	MySpeechBubble.TextToStore[8] = "~F8You want to know&HOW I got these?";
	MySpeechBubble.TextToStore[9] = "~F8That's none of your&business.";
	MySpeechBubble.TextToStore[10] = "~F9Get ready, human.";
	MySpeechBubble.TextToStore[11] = "@6Watch and learn.";
	if instance_exists(obj_Chara_Phase3Ending)
		MySpeechBubble.TextToStore[0] = "~F9I met up with&Alphys.";
	
	//MySpeechBubble.TextToStore[0] = "~F9QSV gave you an&unfinished&transition.";
	//MySpeechBubble.TextToStore[1] = "~F9LMAO";
	//MySpeechBubble.TextToStore[2] = "~F8Yeah, very&anticlimactic, I&know.";
	//MySpeechBubble.TextToStore[3] = "~F8Unfortunately for&you, there's&nothing you can&do.";
	//MySpeechBubble.TextToStore[4] = "~F8Except wait.";
	MySpeechBubble.Talker = "FloweyA";
	con = 12;
}
if (con == 12 && !instance_exists(obj_SpeechBubble)) {
	audio_play_sound(mus_create, 0, false);
	if global.SpeedrunMode == 1
		with (obj_SpeedrunTimer)
			Running = false;
	audio_play_sound(Gigatalk, 0, false);
	con = 13;
	alarm[0] = 240;
}
if (con == 14) {
	global.EnemyGroup = 4;
	room_restart();
}