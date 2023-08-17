timer += 1;
if (timer < 11) {
	alp += 0.1;
}
if (timer > 30) {
	alp -= 0.1;
	if alp <= 0
		instance_destroy();
}