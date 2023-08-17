if MyTextElement == noone {
	MyTextElement = instance_create_depth(x + (35 * image_xscale), y - 25, -100000, obj_TextElement);
	MyTextElement.TextToDraw = TextToSend;
	MyTextElement.TextQueue = TextToStore;
	MyTextElement.Talker = Talker;
	MyTextElement.DefaultColour = c_black;
	MyTextElement._ref = _ref;
}
else {
	if !instance_exists(MyTextElement) {
		instance_destroy();
	}
	else {
		if (image_xscale > 0) {
			MyTextElement.x = x + (35 * image_xscale);
			MyTextElement.y = y - 25;
		}
		else {
			MyTextElement.x = x - 210;
			MyTextElement.y = y - 25;
		}	
	}
}