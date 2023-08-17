y -= yspd * sin(siner);
x += xspd * sin(siner);
siner += 0.05;
if fad
	image_alpha -= 0.01;
if image_alpha < 0.01 {
	instance_destroy();
}