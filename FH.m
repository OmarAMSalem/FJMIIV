function [H] = FH(sim, measure)
% FH function is used to calculate the fuzzy entropy which is based on this paper: P. Luukka, (2011) Feature Selection Using Fuzzy Entropy Measures with  Similarity Classifier, Expert Systems with Applications, 38, pp.4600-4607
% We reused the source code of the original work Pasi Luukka (2021). Feature selection using fuzzy entropy measures and similarity (https://www.mathworks.com/matlabcentral/fileexchange/31366-feature-selection-using-fuzzy-entropy-measures-and-similarity), MATLAB Central File Exchange. Retrieved August 23, 2021.
if nargin<2
    measure='luca';
end
if measure=='luca'
    delta=1E-10;
    sim(find(sim==0))=delta;
    sim(find(sim==1))=1-delta;
    H=sum(-sim.*log(sim)-(1-sim).*log(1-sim));

elseif measure=='park'
    H=sum(sin(pi/2*sim)+sin(pi/2*(1-sim))-1);  
end
end

