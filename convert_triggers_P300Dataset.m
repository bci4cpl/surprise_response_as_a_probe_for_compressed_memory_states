function TrigOut = convert_triggers_P300Dataset(Trig)

TrigFix = Trig;

% Mapping to triggers 1:4
TrigFix(Trig==8) = 1;
TrigFix(Trig==10) = 1;
TrigFix(Trig==20) = 2;
TrigFix(Trig==28) = 3;
TrigFix(Trig==30) = 3;
TrigFix(Trig==40) = 4;

TrigFix(Trig==514) = 0;

TrigInds = find(TrigFix>0);
TrigFix(TrigInds(1:2)) = 0;

TrigOut = TrigFix;
unique(TrigOut)