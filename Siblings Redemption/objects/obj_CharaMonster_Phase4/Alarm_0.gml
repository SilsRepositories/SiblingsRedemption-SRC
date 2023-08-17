while (PreviousAttack == NewAttack) {
	if Phase4Timer < 3480
		NewAttack = choose(1, 4, 6, 7);
	else if Phase4Timer > 4956 && Phase4Timer < 6600
		NewAttack = choose(0, 2, 3, 5);
	else
		NewAttack = choose(0, 1, 2, 3, 4, 5, 6, 7);
}
if NewAttack == 0 Timer = 240;
if NewAttack == 1 Timer = 120;
if NewAttack == 2 Timer = 180;
if NewAttack == 3 Timer = 220;
if NewAttack == 4 Timer = 240;
if NewAttack == 5 Timer = 160;
if NewAttack == 6 Timer = 300;
if NewAttack == 7 Timer = 140;
PreviousAttack = NewAttack;