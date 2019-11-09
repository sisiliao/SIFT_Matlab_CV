function [histog,interval]=FindHistogram(binNumber,value_vector,weight_vector)

histog = zeros(binNumber,1);

for i=1:length(value_vector)
    bin = floor(value_vector(i)/10)+19;
    histog(bin) = histog(bin) + weight_vector(i);
end
interval = 1:binNumber;
