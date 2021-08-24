function [ MI ] = FFMI2(f1,f2,HC,measure)
if nargin<5
    measure='luca';
end
if measure=='luca'
% moodifying zero and one values of the similarity values to work with 
% De Luca's entropy measure  
    H1 = FH(f1,measure);
    f12=min(f1,f2);
    H12 = FH(f12);
    MI=H1+HC-H12;
    
elseif measure=='park'
    H1 = FH(f1,measure);
    H2 = FH(f2,measure);
    f12=min(f1,f2);
    H12 = FH(f12,measure);
    MI=H1+H2-H12;
end
end

