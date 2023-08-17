image_xscale = 2;
image_index = Emotion;
ShowHealthBar = (MyHP > 0.5);
if MyHP <= 0.0002 {
	if MyHP > 0.0001
		MyHP = 0.0002;
	else
		MyHP = 0.0001;
	Siner = 0;
	image_index = 10;
}
image_yscale = 2 + (abs(sin(Siner)) / 8);
draw_self();