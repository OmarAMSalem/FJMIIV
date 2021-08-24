function [ MI3 ] = FMI3(f1,f2,f3,HC,ICX, measure)
if nargin<6
    measure='luca';
end
if measure=='luca'
% moodifying zero and one values of the similarity values to work with 
% De Luca's entropy measure  
    H1 = FH(f1,measure);
    H2 = FH(f2,measure);
    f12=min(f1,f2);
    f13=min(f1,f3);
    f23=min(f2,f3);
   f123=min(f12,f3);
   
    H12 = FH(f12,measure);
    H13 = FH(f13,measure);
    H23 = FH(f23,measure);
    H123 = FH(f123,measure);
    
     MI3=(ICX+H2+H123)-(H12+H23);

elseif measure=='park'
       H1 = FH(f1,measure);
    H2 = FH(f2,measure);
    H3 = FH(f3,measure);
    f12=min(f1,f2);
    f13=min(f1,f3);
    f23=min(f2,f3);
   f123=min(f12,f3);
   
    H12 = FH(f12,measure);
    H13 = FH(f13,measure);
    H23 = FH(f23,measure);
    H123 = FH(f123,measure);
    
    MI3=(H1+H2+H3+H123)-(H12+H23+H13);
end

end

