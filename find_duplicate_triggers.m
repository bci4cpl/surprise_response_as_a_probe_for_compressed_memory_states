function duplicateTrigInds = find_duplicate_triggers(Trig)

TrigInd = find(Trig>0);
diffTrigInd = [0 diff(TrigInd)];

duplicateTrigInds = TrigInd(diffTrigInd==1);