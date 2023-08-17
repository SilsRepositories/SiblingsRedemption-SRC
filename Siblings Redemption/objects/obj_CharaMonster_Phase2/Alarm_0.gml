global.BorderHeight = 120;
global.BorderWidth = 180;
obj_Soul.x = 320;
obj_Soul.y = 384 - (global.BorderHeight / 2);
obj_Soul.visible = true;
instance_destroy(obj_TargetField);
instance_destroy(obj_TargetBar);

if Fought {
	if Hits >= 40
		Hits -= 10;
	Turn += 1;
	if (Turn < 9 && Hits <= 0) {
		Turn = 9;
	}
	MySpeechBubble = instance_create_depth(x + 40, y - 130, -10000, obj_SpeechBubble);
	MySpeechBubble._ref = self;
	MySpeechBubble.TextToSend = "...";
	MySpeechBubble.Talker = "Stranger";
	if (Turn > 10) {
		MySpeechBubble.Talker = "Normal";
		if MyHP == 2160 {
			instance_destroy(MySpeechBubble);
			Turn = 11;
		}
		else
			Turn = 12;
	}
	switch Turn {
		case 1:
			MySpeechBubble.TextToSend = "Did you forget,&Partner?";
			MySpeechBubble.TextToStore[0] = "Humans are determined.";
			MySpeechBubble.TextToStore[1] = "As such, we can&sustain death.";
			MySpeechBubble.TextToStore[2] = "Just like you did&many times before.";
			break;
		case 2:
			MySpeechBubble.TextToSend = "I didn't know&why I couldn't&revive sooner.";
			MySpeechBubble.TextToStore[0] = "I was able to come&back after death.";
			MySpeechBubble.TextToStore[1] = "But now I know&why.";
			break;
		case 3:
			MySpeechBubble.TextToSend = "It was because&a certain someone&refused to let&me live.";
			MySpeechBubble.TextToStore[0] = "Meanwhile, as for&you...";
			MySpeechBubble.TextToStore[1] = "You have no master&except for&yourself.";
			MySpeechBubble.TextToStore[2] = "So you can return&whenever you like.";
			MySpeechBubble.TextToStore[3] = "While everyone else&succumbs to their&fates.";
			break;
		case 4:
			MySpeechBubble.TextToSend = "Even when you got&your 'ending'...";
			MySpeechBubble.TextToStore[0] = "You tried to kill&HIM of all people...";
			MySpeechBubble.TextToStore[1] = "But you couldn't.";
			MySpeechBubble.TextToStore[2] = "Because you were&not strong enough.";
			MySpeechBubble.TextToStore[3] = "HE had more power&than you.";
			break;
		case 5:
			MySpeechBubble.TextToSend = "Yep, that's right.";
			MySpeechBubble.TextToStore[0] = "I was talking about&the one you just&killed.";
			MySpeechBubble.TextToStore[1] = "And now I&absorbed his&power.";
			MySpeechBubble.TextToStore[2] = "It feels amazing&to have such&strength.";
			MySpeechBubble.TextToStore[3] = "Meanwhile, you are&like a hammer to a&large boulder.";
			MySpeechBubble.TextToStore[4] = "Even if you had the&time, you could&never match our&combined strength.";
			break;
		case 6:
			MySpeechBubble.TextToSend = "Your genocide.";
			MySpeechBubble.TextToStore[0] = "Was it really&worth it for you,&now that you look&back?";
			MySpeechBubble.TextToStore[1] = "To know that it&could be stopped...";
			MySpeechBubble.TextToStore[2] = "By someone who&WAS on your&level of power a&few minutes ago.";
			break;
		case 7:
			MySpeechBubble.TextToSend = "Quite poetic, isn't&it?";
			MySpeechBubble.TextToStore[0] = "Since you've come&all this way...";
			MySpeechBubble.TextToStore[1] = "You might as well&die the same way&everyone else did.";
			MySpeechBubble.TextToStore[2] = "Being battered&endlessly until your&inevitable defeat.";
			break;
		case 8:
			MySpeechBubble.TextToSend = "But knowing that&we both have the&same traits...";
			MySpeechBubble.TextToStore[0] = "A determined child&with the power to&bring themselves&back...";
			MySpeechBubble.TextToStore[1] = "Wouldn't this be&an infinite loop?";
			MySpeechBubble.TextToStore[2] = "Then again, you&killed someone else&who was capable&of this.";
			MySpeechBubble.TextToStore[3] = "Sans.";
			break;
		case 9:
			MySpeechBubble.TextToSend = "I'm surprised you&survived this long,&Partner.";
			MySpeechBubble.TextToStore[0] = "I thought you&would go down&faster.";
			MySpeechBubble.TextToStore[1] = "But it appears&that you didn't.";
			MySpeechBubble.TextToStore[2] = "Up to now, I've&only been using a&fraction of my&real power.";
			MySpeechBubble.TextToStore[3] = "Attack me once&more and you'll&see what I&mean.";
			MySpeechBubble.TextToStore[4] = "So give up, before&you regret it.";
			break;
		case 10:
			MySpeechBubble.TextToSend = "Very well.";
			MySpeechBubble.TextToStore[0] = "I gave you your&last chance.";
			MySpeechBubble.TextToStore[1] = "Get prepared,&Partner.";
			MySpeechBubble.TextToStore[2] = "Because from this&point onwards...";
			MySpeechBubble.TextToStore[3] = "@SWE'LL BE TOGETHER&FOREVER, WON'T WE?";
			break;
	}
}
	
// DON'T TOUCH, this is for when the speech bubble appears, it delays the attack until it is gone
alarm[4] = 3;