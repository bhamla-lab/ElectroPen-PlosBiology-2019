(* ::Package:: *)

 function [voltage,timeconstant] = electropen(filename)
filename=['DS00' (filename) '.CSV'];
[num, ~, ~]=xlsread(filename);
n=17;
yvalues=abs(num(n:end,2));

if yvalues(17) < 0
voltage=max(abs(yvalues))- min(yvalues);
else 
voltage=max(abs(yvalues))-min(yvalues);    
end
yvalues=yvalues(1000:end);
mask = yvalues==min(yvalues);
yvalues=yvalues+abs(yvalues(17));
xvalues= num(n:end,1);
xvalues=xvalues(1000:end);
new=xvalues(mask);
yvalues=smooth(yvalues,'loess', 0.12);
timeconstant=new(end)-new(1);
plot(xvalues, yvalues);
end 
