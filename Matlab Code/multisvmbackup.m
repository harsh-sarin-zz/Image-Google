function [ output_args ] = multisvmbackup( input_args )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%Models a given training set with a corresponding group vector and 
%classifies a given test set using an SVM classifier according to a 
%one vs. all relation. 
%
%This code was written by Cody Neuburger cneuburg@fau.edu
%Florida Atlantic University, Florida USA
%This code was adapted and cleaned from Anand Mishra's multisvm function
%found at http://www.mathworks.com/matlabcentral/fileexchange/33170-multi-class-support-vector-machine/

u=unique(GroupTrain);
numClasses=length(u);
result = zeros(length(TestSet(:,1)),1);
%models = struct('csvmResult',{});
%models =  ClassificationSVM.empty();
%    res = fitcsvm(TrainingSet,GroupTrain);

%build models
for k=1:numClasses
%    Vectorized statement that binarizes Group
%    where 1 is the current class and 0 is all other classes
   G1vAll = (strcmp(GroupTrain,u(k)));
    models(k) = svmtrain(TrainingSet,G1vAll);
end
save('SVM','models','u');
%classify test cases
%  for j=1:size(TestSet,1)
%      for k=1:numClasses
%          if(svmclassify(models(k),TestSet(j,:))) 
%              break;
%          end
%      end
%      result(j) = k;
%  end 


% label(size(models,2)) = zeros;
%     Score(size(models,2),2) = zeros;
%   for j=1:size(TestSet,1)
%       for k=1:numClasses
%           [labelAns, scoreAns] = predict(models(k).csvmResult,TestSet(j,:));
%            label(k) = labelAns;
%            Score(k,:) = scoreAns;
%       end
%       result(j) = k;
%   end    


end

