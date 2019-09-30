function measurement = getMeasurement(lane)
%GETMEASUREMENT Extracts measurement vector from lane structure

x1 = linspace(min(lane.r),max(lane.r));
f1 = polyval(lane.p,x1);

measurement = [lane.p';f1(1);min(lane.r);f1(end);max(lane.r)];
end

