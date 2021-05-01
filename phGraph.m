  % each function works if you change the input values
function [] = acid
strongAcid = .5
strongAcidPh = -log10(strongAcid)
 end
 
 function [] = base
 strongBase = .25
 strongBasePh = -log10(strongBase)
 end

 function [] = weakBase
 weakBase = .05
 kb = 1.77E-5
syms x 'real' positive
S = solve (kb == x^2/(weakBase-x),x)
poh = -log10(S)
finalPh = 14 - poh
y = vpa(finalPh)
 end

 function [] = weakAcid
 weakAcid = .05 
 ka = 1.8E05
 syms x 'real' positive
 S = solve (ka == x^2/(weakAcid-x),x)
 ph = -log10(S)
 y = vpa(ph)
 end
