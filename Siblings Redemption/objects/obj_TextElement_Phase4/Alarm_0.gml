TextLength = 0;
TextDelay = 2;
CurrentDelay = 0;
		
// Checks if there is any text in the queue
if variable_instance_exists(id, "TextQueue") {
	// Checks if the queue is exhausted
	// Without this, your game will CRASH because it's trying to look in an unknown area of memory
	if (NumInQueue >= array_length(TextQueue)) {
		instance_destroy();
		exit;
	}
	TextToDraw = TextQueue[NumInQueue];
	CDL += 1;
}
else {
	// Sets the text to a signalling value to destroy the instance
	TextToDraw = "{end}";
}
		
IsWriting = true;
if (TextToDraw == "" || TextToDraw == "{end}") {
	instance_destroy();
}
NumInQueue += 1;