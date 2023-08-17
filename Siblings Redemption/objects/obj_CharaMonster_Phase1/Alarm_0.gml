if (MyHP > 0) {
	global.BorderHeight = 120;
	global.BorderWidth = 180;
	obj_Soul.x = 320;
	obj_Soul.y = 384 - (global.BorderHeight / 2);
	obj_Soul.visible = true;
	instance_destroy(obj_TargetField);
	instance_destroy(obj_TargetBar);
	
	Turn += 1;
	
	if Fought || obj_FloweyMonster_Phase1.Fought {
		MySpeechBubble = instance_create_depth(x + 40, y - 130, -10000, obj_SpeechBubble);
		MySpeechBubble._ref = self;
		MySpeechBubble.TextToSend = "~M19...";
		if (Turn >= 7 || Disarmed) {
			instance_destroy(MySpeechBubble);
		}
	}
	if !Disarmed && (Fought || obj_FloweyMonster_Phase1.Fought) {
		if !Mercy {
			if (obj_FloweyMonster_Phase1.MyHP > 0.0001 && obj_CharaMonster_Phase1.MyHP > 0) {
				switch Turn {
					case 1:
						MySpeechBubble.TextToSend = "~F1Heh heh heh.";
						MySpeechBubble.TextToStore[0] = "~F2Did you really think&it would be THAT&easy, Partner?";
						MySpeechBubble.TextToStore[1] = "~F8That's funny.";
						MySpeechBubble.TextToStore[2] = "~F0You and I are the&same, are we not?";
						MySpeechBubble.TextToStore[3] = "~M04Chara, what are you&talking about?";
						MySpeechBubble.TextToStore[4] = "~M14Don't worry, Asriel.";
						MySpeechBubble.TextToStore[5] = "~F8I'LL EXPLAIN THIS&LATER.";
						break;
					case 2:
						MySpeechBubble.TextToSend = "~M04Chara, this is&dangerous!";
						MySpeechBubble.TextToStore[0] = "~M17I know.";
						MySpeechBubble.TextToStore[1] = "~M05You could die!";
						MySpeechBubble.TextToStore[2] = "~M14I know, Asriel!";
						MySpeechBubble.TextToStore[3] = "~M19I've been through&this before.";
						break;
					case 3:
						MySpeechBubble.TextToSend = "~M06But Chara, don't&you remember?";
						MySpeechBubble.TextToStore[0] = "~M03You took your&life so I could&cross the barrier!";
						MySpeechBubble.TextToStore[1] = "~M14Didn't Dad do the&same thing?";
						MySpeechBubble.TextToStore[2] = "~M08No! We almost&killed him!";
						break;
					case 4:
						MySpeechBubble.TextToSend = "~M10It was an accident,&though. He didn't&die.";
						MySpeechBubble.TextToStore[0] = "~M12He just became very&ill.";
						MySpeechBubble.TextToStore[1] = "~M04But it nearly&killed him!";
						MySpeechBubble.TextToStore[2] = "~M15Whatever.";
						MySpeechBubble.TextToStore[3] = "~M18That doesn't matter&now, does it?";
						break;
					case 5:
						MySpeechBubble.TextToSend = "~M07I cannot bear&to see you&die again!";
						MySpeechBubble.TextToStore[0] = "~M03And I don't want&to die either!";
						MySpeechBubble.TextToStore[1] = "~M17Asriel, keep it&together! We have a&job to finish!";
						MySpeechBubble.TextToStore[2] = "~M02...I suppose so.";
						MySpeechBubble.TextToStore[3] = "~M00Human, monster...&Whatever you are.";
						MySpeechBubble.TextToStore[4] = "~M09We will NOT&hesitate to stop&you!";
						break;
					case 6:
						MySpeechBubble.TextToSend = "~M17Is that the best&you can do?";
						MySpeechBubble.TextToStore[0] = "~M05Chara, I'm&freaking nervous!&They have a&knife!";
						MySpeechBubble.TextToStore[1] = "~M17So do I. You're&not afraid of&that, are you?";
						MySpeechBubble.TextToStore[2] = "~M07I can't do this!";
						MySpeechBubble.TextToStore[3] = "~M15Asriel, listen.";
						MySpeechBubble.TextToStore[4] = "~M17They WANT us to&give up.";
						MySpeechBubble.TextToStore[5] = "~M19So why don't you&turn that fear&into energy?";
						MySpeechBubble.TextToStore[6] = "~M08...I'll try.";
						break;
				}
			}
			else {
				if !instance_exists(MySpeechBubble) {
					MySpeechBubble = instance_create_depth(x + 40, y - 130, -10000, obj_SpeechBubble);
					MySpeechBubble._ref = self;
				}
				if obj_FloweyMonster_Phase1.MyHP == 0.0001 {
					MySpeechBubble.TextToSend = "~M19You're such a...&Disappointment.";
					obj_FloweyMonster_Phase1.MyHP = 0.0002;
					CanSpare = true;
				}
			}
		}
		else {
			MySpeechBubble = instance_create_depth(x + 40, y - 130, -10000, obj_SpeechBubble);
			MySpeechBubble._ref = self;
			switch MercyTries {
				case 0:
					audio_stop_sound(global.BattleMusic);
					MySpeechBubble.TextToSend = "~M17...What?";
					MySpeechBubble.TextToStore[0] = "~M15You're seriously&trying to SPARE&me?";
					array_resize(Act, 1);
					break;
				case 1:
					MySpeechBubble.TextToSend = "~M15After killing my&brother?";
					MySpeechBubble.TextToStore[0] = "~M18That's just&precious.";	
					break;
				case 2:
					MySpeechBubble.TextToSend = "~M13...";
					MySpeechBubble.TextToStore[0] = "~M14No.";
					break;
				case 3:
					MySpeechBubble.TextToSend = "~M12Really?";
					MySpeechBubble.TextToStore[0] = "~M15You think you&deserve it?";
					MySpeechBubble.TextToStore[1] = "~M19After all the&trouble you&caused everyone?";
					break;
				case 4:
					MySpeechBubble.TextToSend = "~M17I'll tell you&what.";
					MySpeechBubble.TextToStore[0] = "~M15I'll make you a&deal.";
					MySpeechBubble.TextToStore[1] = "~M12If you give me&your SOUL...";
					MySpeechBubble.TextToStore[2] = "~M10I will let you&SPARE me.";
					break;
				case 5:
					MySpeechBubble.TextToSend = "~M12Marvellous.";
					MySpeechBubble.TextToStore[0] = "~M18So it's settled&then.";
					break;
			}
			Mercy = false;
			MercyTries += 1;
		}
	}
	
	// DON'T TOUCH, this is for when the speech bubble appears, it delays the attack until it is gone
	alarm[4] = 3;
}
else {
	alarm[2] = 1;
	instance_destroy(obj_TargetField);
	instance_destroy(obj_TargetBar);
}
