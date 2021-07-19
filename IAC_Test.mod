var y x cu cc c hu hc lu lc l wu wc bc r dp q;
varexo eps_e;

parameters BETATILDE BETA J ETA K GAMMA XSS KTILDE RHO PHIP PHIY;

BETA = 0.99;
BETATILDE = 0.98;
J = .1;
ETA = 1.01;
K = 0.9;
GAMMA = 0.64;
XSS = 1.2;
KTILDE = 0.0858;
RHO = 0.8;
PHIP = 0.5;
PHIY = 0.0;
STDERR_AE = 0.0029;

model;
1/exp(cu) = BETA*exp(r-dp(+1)-cu(+1)) ;
wu = (ETA-1)*lu + cu ;
J/exp(hu) = exp(q-cu) - BETA*exp(q(+1)-cu(+1)) ;
exp(cc) = exp(wc+lc) + exp(bc) + exp(q)*(exp(hc(-1))-exp(hc))
- exp(r(-1)+bc(-1)-dp) ;
bc = log(K) + q(+1) + hc + dp(+1) - r;
wc = (ETA-1)*lc + cc ;
J/exp(hc) = exp(q-cc) - K*exp(q(+1)+dp(+1)-r-cc) -
BETATILDE*(1-K)*exp(q(+1)-cc(+1)) ;
exp(c) = exp(cc) + exp(cu) ;
exp(l) = exp(lc) + exp(lu) ;
1 = exp(hu) + exp(hc) ;
y = GAMMA*lu + (1-GAMMA)*lc ;
wu = log(GAMMA) + y - x - lu ;
wc = log(1-GAMMA) + y - x - lc ;
dp = BETA*dp(+1) - KTILDE*(x-log(XSS)) ;
r = RHO*r(-1) + (1-RHO)*(1+PHIP)*dp +
(1-RHO)*PHIY*(y-y(-1)) + (1-RHO)*log(1/BETA) + eps_e ;
exp(y) = exp(cu) + exp(cc) ;
end ;

initval;
y = 0 ;
x = 0 ;
cu = 0 ;
cc = 0 ;
c = 0 ;
hu = 0 ;
hc = 0 ;
lu = 0 ;
lc = 0 ;
l = 0 ;
wu = 0 ;
wc = 0 ;
bc = 0 ;
r = 0.01 ;
dp = 0 ;
q = 0 ;
end;
steady ;

shocks;
var eps_e; stderr 100*STDERR_AE;
end;

stoch_simul(dr_algo=0,order=1,irf=10) y dp r cu cc q bc hu hc wu wc;