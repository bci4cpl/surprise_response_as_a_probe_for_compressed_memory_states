function TrigOut = convert_triggers(Trig)

TrigFix = Trig;

% Mapping to triggers 1:4
TrigFix(Trig==8) = 1;
TrigFix(Trig==10) = 1;
TrigFix(Trig==20) = 2;
TrigFix(Trig==28) = 3;
TrigFix(Trig==30) = 3;
TrigFix(Trig==40) = 4;

TrigOut = TrigFix;
unique(TrigOut)