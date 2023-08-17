global.BorderHeight = 120;
global.BorderWidth = 180;
obj_Soul.x = 320;
obj_Soul.y = 384 - (global.BorderHeight / 2);
obj_Soul.visible = true;
instance_destroy(obj_TargetField);
instance_destroy(obj_TargetBar);
	
if !Checked && global.Damage > 0 {
	Turn += 1;
	MySpeechBubble = instance_create_depth(x + 40, y - 130, -10000, obj_SpeechBubble);
	MySpeechBubble._ref = self;
	MySpeechBubble.TextToSend = "...";
	MySpeechBubble.Talker = "Stranger";
	if (Turn > 10) {
		MySpeechBubble.Talker = "Normal";
		if MoveOn {
			instance_destroy(MySpeechBubble);
			Turn = 11;
		}
		else
			Turn = 12;
	}
	switch Turn {
		case 1:
			MySpeechBubble.TextToSend = "Naive as always,&aren't you, Partner...";
			MySpeechBubble.TextToStore[0] = "I'll always be&determined.";
			MySpeechBubble.TextToStore[1] = "Slash me once,&slash me twice.&It's never enough.";
			MySpeechBubble.TextToStore[2] = "I've dragged you&down here with&me, and I'll never&let you go.";
			break;
		case 2:
			MySpeechBubble.TextToSend = "Turns out, coming&back from the dead&wasn't as complicated&as I thought.";
			MySpeechBubble.TextToStore[0] = "All I had to&do, was wait&until you saved.";
			MySpeechBubble.TextToStore[1] = "Foolish actions&have dire&consequences.";
			break;
		case 3:
			MySpeechBubble.TextToSend = "I'd like to give&you my gratitude,&Partner.";
			MySpeechBubble.TextToStore[0] = "If you weren't&committing to your&unholy deeds...";
			MySpeechBubble.TextToStore[1] = "I wouldn't be&standing here&at all.";
			MySpeechBubble.TextToStore[2] = "I have achieved&reincarnation, all&thanks to you ~R=)";
			break;
		case 4:
			MySpeechBubble.TextToSend = "You've come a&long way, Partner.";
			MySpeechBubble.TextToStore[0] = "From your humble&beginnings in that&modest cave...";
			MySpeechBubble.TextToStore[1] = "To rotting here&with me in the&darkest depths of&the void.";
			MySpeechBubble.TextToStore[2] = "Was it truly worth&it, Partner?";
			break;
		case 5:
			MySpeechBubble.TextToSend = "So determined to&achieve your goal...";
			MySpeechBubble.TextToStore[0] = "That you'd pounce on&any opportunity that&dare wander your&way...";
			MySpeechBubble.TextToStore[1] = "Even if it lead&you into more&danger.";
			MySpeechBubble.TextToStore[2] = "How courageous... or&should I say...&imprudent...";
			break;
		case 6:
			MySpeechBubble.TextToSend = "Since you're so&desperate for&opportunity...";
			MySpeechBubble.TextToStore[0] = "Why don't you keep&going?";
			MySpeechBubble.TextToStore[1] = "After all, we both know&you're persistent.";
			break;
		case 7:
			MySpeechBubble.TextToSend = "How interesting.";
			MySpeechBubble.TextToStore[0] = "You're still grasping&at any chance&you get.";
			MySpeechBubble.TextToStore[1] = "Why is this, Partner?";
			MySpeechBubble.TextToStore[2] = "Oh well.&It matters not.";
			break;
		case 8:
			MySpeechBubble.TextToSend = "Keep going, Partner.";
			MySpeechBubble.TextToStore[0] = "See where this&takes you.";
			MySpeechBubble.TextToStore[1] = "Can't imagine this&is going to end&well for you.";
			MySpeechBubble.TextToStore[2] = "After all, I have&yet to use my&final strategy...";
			break;
		case 9:
			MySpeechBubble.TextToSend = "This is where I'd&normally warn you&of what's to&come...";
			MySpeechBubble.TextToStore[0] = "But we both know&you're not turning&back.";
			MySpeechBubble.TextToStore[1] = "So instead, I'll&offer you an&invitation.";
			MySpeechBubble.TextToStore[2] = "Survive this attack.";
			MySpeechBubble.TextToStore[3] = "Then you'll see&what happens next.";
			break;
		case 10:
			MySpeechBubble.TextToSend = "...";
			MySpeechBubble.TextToStore[0] = "It appears you&haven't changed a&bit.";
			MySpeechBubble.TextToStore[1] = "How disappointing.";
			MySpeechBubble.TextToStore[2] = "There is no light&at the end of your&tunnel.&After all...";
			MySpeechBubble.TextToStore[3] = "@SYOUR FAILURE IS&IMMINENT.";
			break;
	}
}
Checked = false;
global.Damage = 0;
	
// DON'T TOUCH, this is for when the speech bubble appears, it delays the attack until it is gone
alarm[4] = 3;