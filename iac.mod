var Cu, Cc, Lu, Lc, R, bc, Hu, Hc, q, Wu, Wc, dp, Y, C, x, J, A, pi_wu pi_wc wc_gap wu_gap wu_real wc_real; 

varexo e, u, n_inf, e_prod;

parameters siggma varphi phi_pi phi_y theta_p rho_nu rho_z rho_a alppha epsilon_p epsilon_w theta_w BETA, T_BETA, j, m, GAMMA, X, ETA, RHO, PHIP, PHIY, OMEGA, KTILDE, J_ss, PP, KAPPAw;
BETA=0.99;
T_BETA=0.98;
J_ss=0.1;
X=1.2;
KTILDE=0.0858;
ETA=1.01;
m=0.95;
GAMMA=0.64;
X=1.2;
THETA=0.75;
RHO=0.8;
PHIP=0.5;
PHIY=0.5;
STDERR_AE=0.0029;
RHOG=0.8;
PP=0.95;

siggma = 1;
varphi=5;
phi_pi = 1.5;
phi_y  = 0.125;
theta_p=3/4;
rho_nu =0.5;
rho_z  = 0.5;
rho_a  = 0.9;
eta  =3.77; %footnote 11, p. 115
alppha=1/4;
epsilon_p=9;
epsilon_w=4.5;
theta_w=3/4;

model;

//Composite parameters
#Omega=(1-alppha)/(1-alppha+alppha*epsilon_p);              %defined on page 166
#psi_n_ya=(1+varphi)/(siggma*(1-alppha)+varphi+alppha);     %defined on page 171
#psi_n_wa=(1-alppha*psi_n_ya)/(1-alppha);                   %defined on page 171
#lambda_p=(1-theta_p)*(1-BETA*theta_p)/theta_p*Omega;      %defined on page 166
#aleph_p=alppha*lambda_p/(1-alppha);                         %defined on page 172
#lambda_w=(1-theta_w)*(1-BETA*theta_w)/(theta_w*(1+epsilon_w*varphi));      %defined on page 170
#aleph_w=lambda_w*(siggma+varphi/(1-alppha));               %defined on page 172



%%%%%%%%%%%
%% Savers - Unconstrained Households
%%%%%%%%%%%

%% EQ 1) FOC for consumption:
1/exp(Cu) = BETA * exp(R) / (exp(dp(+1)) * exp(Cu(+1)));

%% EQ 2) FOC for wages:
exp(Wu)=((exp(Lu))^(ETA-1))*exp(Cu);

%% EQ 3) FOC for housing:
J/exp(Hu) = exp(q)/exp(Cu) - (BETA*exp(q(+1)))/exp(Cu(+1));
 
%%%%%%%%%%%
%% Borrowers - Constrained Households
%%%%%%%%%%%

%% EQ 4) Consumption Flow
exp(Cc)= exp(Wc)*exp(Lc)+exp(bc)+exp(q)*(exp(Hc(-1))-exp(Hc))-(exp(R(-1))*exp(bc(-1)))/exp(dp);

%% EQ 5) FOC for wage
exp(Wc)=exp(Lc)^(ETA-1)*exp(Cc);

%% EQ 6) FOC for housing
J/exp(Hc) = (1/exp(Cc))*(exp(q)-(m*exp(q(+1))*exp(dp(+1)))/exp(R))- T_BETA*(1-m)*(exp(q(+1))/exp(Cc(+1)));

J=PP*J_ss + e;

% EQ 7) Collateral Contraint
exp(bc)=(m*exp(Hc)/exp(R))*exp(q(+1))*exp(dp(+1));
 
%%%%%%%%%%%
%% Firms
%%%%%%%%%%%


%% EQ 8) Production Function
exp(Y)=  exp(A) * ((exp(Lu))^GAMMA * exp(Lc)^(1-GAMMA));
 
%% EQ 9) FOC 1
% exp(Wu)=GAMMA*exp(-A)*(exp(Lu))^(GAMMA-1)*(exp(Lc))^(1-GAMMA)*(1/exp(x));

%% EQ 10) FOC 2
% exp(Wc)=(GAMMA)*exp(-A)*((exp(Lu))^GAMMA)*((exp(Lc))^(-GAMMA))*(1/exp(x));

A = 0.8 * A(-1) + e_prod;


%%%%%%%%%%%
%% Monetary Policy
%%%%%%%%%%%

%% EQ 11) NKPC
dp = BETA * dp(+1) - KTILDE*(x-log(X)) + n_inf; 

%% EQ 12) Taylor Rule
R = RHO*R(-1)+(1-RHO)*(1+PHIP)*dp+(1-RHO)*PHIY*Y +(1-RHO)*log(1/BETA) * u;
  
%%%%%%%%%%%
%% Market Clearing
%%%%%%%%%%%

%% EQ 13) Output
exp(Y)=exp(Cu)+exp(Cc);

%% EQ 16) Consumption
exp(C)=exp(Cu)+exp(Cc);

%% EQ 15) Housing
exp(Hu)+exp(Hc)=1;


pi_wu=BETA*pi_wu(+1)+aleph_w*(Y - steady_state(Y))-lambda_w*wu_gap;
pi_wc=BETA*pi_wc(+1)+aleph_w*(Y - steady_state(Y))-lambda_w*wc_gap;


wu_gap=wu_gap(-1)+pi_wu-dp-(Wu-Wu(-1));
wc_gap=wc_gap(-1)+pi_wc-dp-(Wc-Wc(-1));

wc_real=wc-p;
wu_real=wc-p;

end;


initval;
Cu =0;
Cc=0;
Wu=0;
Wc=0;
bc=0;
Lu=0;
Lc=0;
Hu=0;
Hc=0;
dp=0;
R=0.01;
Y=0;
q=0;
x=0;
A=0;
J=0;
end;

steady;

shocks;
var e; stderr 100;
var u; stderr 0.0028;
var n_inf; stderr 1;
var e_prod; stderr 0.05;
end;

stoch_simul(order=1, irf=20) Y C dp;