function result = prtTestPreProcMinMaxRows

% Copyright (c) 2013 New Folder Consulting
%
% Permission is hereby granted, free of charge, to any person obtaining a
% copy of this software and associated documentation files (the
% "Software"), to deal in the Software without restriction, including
% without limitation the rights to use, copy, modify, merge, publish,
% distribute, sublicense, and/or sell copies of the Software, and to permit
% persons to whom the Software is furnished to do so, subject to the
% following conditions:
%
% The above copyright notice and this permission notice shall be included
% in all copies or substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
% OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
% MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN
% NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
% DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
% OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
% USE OR OTHER DEALINGS IN THE SOFTWARE.
result = true;


try
    dataSet = prtDataGenIris;              % Load a data set
    dataSet = dataSet.retainFeatures(1:3); % Use only the first 3 features
    zmr = prtPreProcMinMaxRows;          % Create a
    %  prtPreProcMinMaxRows object
    zmr = zmr.train(dataSet);              % Train
    dataSetNew = zmr.run(dataSet);         % Run
catch
    disp('pre proc mix max rows fail');
    result = false;
end

% check that the rows are zero mean

% check that the columns are zero mean
if  any(min(dataSetNew.getX) ~= [1 0 0 ])
    disp('pre proc mix max rows mean not 0')
    result = false;
end
