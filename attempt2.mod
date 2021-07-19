var Cu, Cc, Lu, Lc, R, bc, Hu, Hc, q, Wu, Wc, dp, Y, C, x, J, A pi_w1 pi_w2 w_gap1 w_gap2 w_nat1 w_nat2  y_gap y_nat;
varexo e, eps_nu, n_inf, eps_a;

parameters siggma K varphi XSS  theta_p rho_nu epsilon_w rho_z rho_a theta_w1 theta_w2 eta alppha epsilon_p BETA, T_BETA, j, m, GAMMA, X, ETA, RHO, PHIP, PHIY, OMEGA, KTILDE, J_ss, PP;

BETA=0.99;
T_BETA=0.98;
J_ss=0.1;
K = 0.9;
X=1.2;
KTILDE=0.0858;
ETA=1.01;
m=0.8;
GAMMA=0.64;
X=1.2;
XSS = 1.2;
THETA=0.75;
RHO=0.8;
PHIP=1.5;
PHIY=0.124;
STDERR_AE=0.0029;
RHOG=0.8;
PP=0.95;
siggma = 1;
varphi=5;
theta_p=3/4;
rho_nu =0.5;
rho_z  = 0.5;
rho_a  = 0.9;
eta  =3.77; %footnote 11, p. 115
alppha=1/4;
epsilon_p=9;

epsilon_w=4.5;
theta_w1=3/4;
theta_w2=0.9;

model;

%% Composite parameters
#Omega=(1-alppha)/(1-alppha+alppha*epsilon_p);              %defined on page 166

#psi_n_ya=(1+varphi)/(siggma*(1-alppha)+varphi+alppha);     %defined on page 171

#psi_n_wa=(1-alppha*psi_n_ya)/(1-alppha);                   %defined on page 171

#lambda_p=(1-theta_p)*(1-BETA*theta_p)/theta_p*Omega;      %defined on page 166

#aleph_p=alppha*lambda_p/(1-alppha);                         %defined on page 172

#lambda_w1=(1-theta_w1)*(1-BETA*theta_w1)/(theta_w1*(1+epsilon_w*varphi));      %defined on page 170
#lambda_w2=(1-theta_w2)*(1-T_BETA*theta_w2)/(theta_w2*(1+epsilon_w*varphi));      %defined on page 170


#aleph_w1=lambda_w1*(siggma+varphi/(1-alppha));               %defined on page 172
#aleph_w2=lambda_w2*(siggma+varphi/(1-alppha));               %defined on page 172


%%%%%%%%%%%
%% Savers - Unconstrained Households
%%%%%%%%%%%

%% EQ 1) FOC for consumption:
1/exp(Cu) = BETA*exp(R-dp(+1)-Cu(+1)) ;

%% EQ 2) FOC for wages:
exp(Wu)=((exp(Lu))^(ETA-1))*exp(Cu);
%Wu = (ETA-1)*Lu + Cu ;

%% EQ 3) FOC for housing:
J/exp(Hu) = exp(q-Cu) - BETA*exp(q(+1)-Cu(+1)) ;

%%%%%%%%%%%
%% Borrowers - Constrained Households
%%%%%%%%%%%

%% EQ 4) Consumption Flow
exp(Cc) = exp(Wc+Lc) + exp(bc) + exp(q)*(exp(Hc(-1))-exp(Hc))- exp(R(-1)+bc(-1)-dp) ;
%% EQ 5) FOC for wage
Wc = (ETA-1)*Lc + Cc ;
%% EQ 6) FOC for housing
J/exp(Hc) = exp(q-Cc) - 0.9*exp(q(+1)+dp(+1)-R-Cc) - T_BETA*(1-0.9)*exp(q(+1)-Cc(+1)) ;

J=PP*J_ss + e;

% EQ 7) Collateral Contraint
exp(bc)=(m*exp(Hc)/exp(R))*exp(q(+1))*exp(dp(+1));
 

%%%%%%%%%%%
%% Firms
%%%%%%%%%%%

%% EQ 8) Production Function
Y = A *GAMMA*Lu + (1-GAMMA)*Lc ; % Added tech


%% EQ 9) FOC 1
exp(Wu)=GAMMA*(exp(Lu))^(GAMMA-1)*(exp(Lc))^(1-GAMMA)*(1/exp(x));
%Wu = log(GAMMA) + Y - x - Lu ;

%% EQ 10) FOC 2
Wc = log(1-GAMMA) + Y - x - Lc ;

A = 0.8 * A(-1) + eps_a;


%%%%%%%%%%%
%% Monetary Policy
%%%%%%%%%%%

%% EQ 11) NKPC
dp = BETA * dp(+1) - KTILDE*(x-log(X)) + lambda_p * w_gap1 + lambda_p * w_gap2  + n_inf; 

%dp = BETA*dp(+1) - KTILDE*(x-log(XSS)) + n_inf;

%% EQ 12) Taylor Rule
%R = RHO*R(-1)+(1-RHO)*(1+PHIP)*dp+(1-RHO)*PHIY*Y +(1-RHO)*log(1/BETA) * eps_nu;
R= RHO*R(-1) + (1-RHO)*(1+PHIP)*dp + (1-RHO)*PHIY*(Y-Y(-1)) + (1-RHO)*log(1/BETA) + eps_nu ; 

%%%%%%%%%%%
%% Market Clearing
%%%%%%%%%%%

%% EQ 13) Output
exp(Y)=exp(C);

%% EQ 16) Consumption
exp(C)=exp(Cu)+exp(Cc);

%% EQ 15) Housing
exp(Hu)+exp(Hc)=1;


pi_w1 = BETA * pi_w1(+1) + aleph_w1 * y_gap - lambda_w1 * w_gap1;
pi_w2 = T_BETA * pi_w2(+1) +aleph_w2 * y_gap -lambda_w2 * w_gap2;

w_gap1=w_gap1(-1)+pi_w1-dp-(w_nat1-w_nat1(-1));
w_gap2=w_gap2(-1)+pi_w2-dp-(w_nat2-w_nat2(-1));


y_gap=Y-y_nat;
y_nat=psi_n_ya*A;


w_nat1 = 1 - alppha + psi_n_wa * A;
w_nat2 = 1 - alppha + psi_n_wa * A;

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
end;

steady;

shocks;
var e; stderr 100;
var eps_nu = 0.25^2;% var eps_nu; stderr 0.0028;
var n_inf; stderr 1;
var eps_a; stderr 1;
end;

stoch_simul(order = 1,irf=15,nograph,noprint) y_gap Cc Cu C Wu Wc pi_w1 pi_w2 dp w_gap1 w_gap2 y_nat bc;
oo_baseline=oo_;


%sticky wage case
set_param_value('theta_w1',3/4)
set_param_value('theta_w2', 3/4)
set_param_value('theta_p',3/4)
stoch_simul(order = 1,irf=15,nograph,noprint) y_gap Cc Cu C Wu Wc pi_w1 pi_w2 dp w_gap1 w_gap2 y_nat bc;
oo_sticky_wages=oo_;

%flex wage case
set_param_value('theta_w1',0.00000001)
set_param_value('theta_w2',0.00000001)
set_param_value('theta_p',3/4)
stoch_simul(order = 1,irf=15,nograph,noprint) y_gap Cc Cu C Wu Wc pi_w1 pi_w2 dp w_gap1 w_gap2 y_nat bc;
oo_flexible_wages=oo_;



% One labour market is perfect and the other isnt
set_param_value('theta_w1',0.00000001)
set_param_value('theta_w2',3/4)
set_param_value('theta_p',3/4)
stoch_simul(order = 1,irf=15,nograph,noprint) y_gap Cc Cu C Wu Wc pi_w1 pi_w2 dp w_gap1 w_gap2 y_nat bc;
oo_partial_wages=oo_;

% figure('Name','Dynamic Responses to monetary policy shock')

% subplot(3,4,1)
% plot(1:options_.irf,oo_sticky_wages.irfs.y_gap_eps_nu,'-d',1:options_.irf,oo_flexible_wages.irfs.y_gap_eps_nu,'-s')
% title('Output gap')

% ll=legend('Sticky Wages','Flexible Wages');
% set(ll,'Location','SouthEast');

% subplot(3,4,2)
% plot(1:options_.irf,oo_sticky_wages.irfs.Cu_eps_nu,'-d',1:options_.irf,oo_flexible_wages.irfs.Cu_eps_nu,'-s')
% title('Cu')


% subplot(3,4,3)
% plot(1:options_.irf,oo_sticky_wages.irfs.Cc_eps_nu,'-d',1:options_.irf,oo_flexible_wages.irfs.Cc_eps_nu,'-s')
% title('Cc')

% subplot(3,4,4)
% plot(1:options_.irf,oo_sticky_wages.irfs.Wu_eps_nu,'-d',1:options_.irf,oo_flexible_wages.irfs.Wu_eps_nu,'-s')
% title('Wu')

% subplot(3,4,5)
% plot(1:options_.irf,oo_sticky_wages.irfs.Wc_eps_nu,'-d',1:options_.irf,oo_flexible_wages.irfs.Wc_eps_nu,'-s')
% title('Wc')

% subplot(3,4,6)
% plot(1:options_.irf,oo_sticky_wages.irfs.pi_w1_eps_nu,'-d',1:options_.irf,oo_flexible_wages.irfs.pi_w1_eps_nu,'-s')
% title('Patient Consumer Wage Inflation')

% subplot(3,4,7)
% plot(1:options_.irf,oo_sticky_wages.irfs.pi_w2_eps_nu,'-d',1:options_.irf,oo_flexible_wages.irfs.pi_w2_eps_nu,'-s')
% title('Impatient Consumer Wage Inflation')

% subplot(3,4,8)
% plot(1:options_.irf,oo_sticky_wages.irfs.dp_eps_nu,'-d',1:options_.irf,oo_flexible_wages.irfs.dp_eps_nu,'-s')
% title('Price Inflation')

% subplot(3,4,9)
% plot(1:options_.irf,oo_sticky_wages.irfs.w_gap2_eps_nu,'-d',1:options_.irf,oo_flexible_wages.irfs.w_gap2_eps_nu,'-s')
% title('Wage Gap (constrained)')

% subplot(3,4,10)
% plot(1:options_.irf,oo_sticky_wages.irfs.w_gap1_eps_nu,'-d',1:options_.irf,oo_flexible_wages.irfs.w_gap1_eps_nu,'-s')
% title('Wage Gap (unconstrained)')

% subplot(3,4,11)
% plot(1:options_.irf,oo_sticky_wages.irfs.y_nat_eps_nu,'-d',1:options_.irf,oo_flexible_wages.irfs.y_nat_eps_nu,'-s')
% title('Natural Output')


figure('Name','Dynamic Responses to monetary policy shock')

subplot(3,4,1)
plot(1:options_.irf,oo_sticky_wages.irfs.y_gap_eps_nu,'-d',1:options_.irf,oo_flexible_wages.irfs.y_gap_eps_nu,'-s',1:options_.irf,oo_partial_wages.irfs.y_gap_eps_nu,'-x')
title('Output gap')

ll=legend('Sticky Wages','Flexible Wages', 'Partial Wages');
set(ll,'Location','SouthEast');

subplot(3,4,2)
plot(1:options_.irf,oo_sticky_wages.irfs.Cu_eps_nu,'-d',1:options_.irf,oo_flexible_wages.irfs.Cu_eps_nu,'-s', 1:options_.irf,oo_partial_wages.irfs.Cu_eps_nu,'-x')
title('Cu')


subplot(3,4,3)
plot(1:options_.irf,oo_sticky_wages.irfs.Cc_eps_nu,'-d',1:options_.irf,oo_flexible_wages.irfs.Cc_eps_nu,'-s', 1:options_.irf,oo_partial_wages.irfs.Cc_eps_nu,'-x')
title('Cc')

subplot(3,4,4)
plot(1:options_.irf,oo_sticky_wages.irfs.Wu_eps_nu,'-d',1:options_.irf,oo_flexible_wages.irfs.Wu_eps_nu,'-s', 1:options_.irf,oo_partial_wages.irfs.Wu_eps_nu,'-x')
title('Wu')

subplot(3,4,5)
plot(1:options_.irf,oo_sticky_wages.irfs.Wc_eps_nu,'-d',1:options_.irf,oo_flexible_wages.irfs.Wc_eps_nu,'-s', 1:options_.irf,oo_partial_wages.irfs.Wc_eps_nu,'-x')
title('Wc')

subplot(3,4,6)
plot(1:options_.irf,oo_sticky_wages.irfs.pi_w1_eps_nu,'-d',1:options_.irf,oo_flexible_wages.irfs.pi_w1_eps_nu,'-s', 1:options_.irf,oo_partial_wages.irfs.pi_w1_eps_nu,'-x')
title('Patient Consumer Wage Inflation')

subplot(3,4,7)
plot(1:options_.irf,oo_sticky_wages.irfs.pi_w2_eps_nu,'-d',1:options_.irf,oo_flexible_wages.irfs.pi_w2_eps_nu,'-s',1:options_.irf,oo_partial_wages.irfs.pi_w2_eps_nu,'-x')
title('Impatient Consumer Wage Inflation')

subplot(3,4,8)
plot(1:options_.irf,oo_sticky_wages.irfs.dp_eps_nu,'-d',1:options_.irf,oo_flexible_wages.irfs.dp_eps_nu,'-s',1:options_.irf,oo_partial_wages.irfs.dp_eps_nu,'-x')
title('Price Inflation')

subplot(3,4,9)
plot(1:options_.irf,oo_sticky_wages.irfs.w_gap2_eps_nu,'-d',1:options_.irf,oo_flexible_wages.irfs.w_gap2_eps_nu,'-s',1:options_.irf,oo_partial_wages.irfs.w_gap1_eps_nu,'-x')
title('Wage Gap (constrained)')

subplot(3,4,10)
plot(1:options_.irf,oo_sticky_wages.irfs.w_gap1_eps_nu,'-d',1:options_.irf,oo_flexible_wages.irfs.w_gap1_eps_nu,'-s',1:options_.irf,oo_partial_wages.irfs.w_gap2_eps_nu,'-x')
title('Wage Gap (unconstrained)')

subplot(3,4,11)
plot(1:options_.irf,oo_sticky_wages.irfs.y_nat_eps_nu,'-d',1:options_.irf,oo_flexible_wages.irfs.y_nat_eps_nu,'-s',1:options_.irf,oo_partial_wages.irfs.y_nat_eps_nu,'-x')
title('Natural Output')

subplot(3,4,12)
plot(1:options_.irf,oo_sticky_wages.irfs.bc_eps_nu,'-d',1:options_.irf,oo_flexible_wages.irfs.bc_eps_nu,'-s',1:options_.irf,oo_partial_wages.irfs.bc_eps_nu,'-x')
title('Borrowing')


figure('Name','Dynamic Responses to productivity shock')
subplot(4,4,1)
plot(1:options_.irf,oo_sticky_wages.irfs.y_gap_eps_a,'-d',1:options_.irf,oo_flexible_wages.irfs.y_gap_eps_a,'-s')
title('Output gap')
ll=legend('Sticky Wages','Flexible Wages');
set(ll,'Location','SouthEast');

subplot(4,4,2)
plot(1:options_.irf,oo_sticky_wages.irfs.Cu_eps_a,'-d',1:options_.irf,oo_flexible_wages.irfs.Cu_eps_a,'-s')
title('Cu')


subplot(4,4,3)
plot(1:options_.irf,oo_sticky_wages.irfs.Cc_eps_a,'-d',1:options_.irf,oo_flexible_wages.irfs.Cc_eps_a,'-s')
title('Cc')

subplot(4,4,4)
plot(1:options_.irf,oo_sticky_wages.irfs.Wu_eps_a,'-d',1:options_.irf,oo_flexible_wages.irfs.Wu_eps_a,'-s')
title('Wu')

subplot(4,4,5)
plot(1:options_.irf,oo_sticky_wages.irfs.Wc_eps_a,'-d',1:options_.irf,oo_flexible_wages.irfs.Wc_eps_a,'-s')
title('Wc')

subplot(4,4,6)
plot(1:options_.irf,oo_sticky_wages.irfs.pi_w1_eps_a,'-d',1:options_.irf,oo_flexible_wages.irfs.pi_w1_eps_a,'-s')
title('Patient Consumer Wage Inflation')

subplot(4,4,7)
plot(1:options_.irf,oo_sticky_wages.irfs.pi_w2_eps_a,'-d',1:options_.irf,oo_flexible_wages.irfs.pi_w2_eps_a,'-s')
title('Impatient Consumer Wage Inflation')

subplot(4,4,8)
plot(1:options_.irf,oo_sticky_wages.irfs.dp_eps_a,'-d',1:options_.irf,oo_flexible_wages.irfs.dp_eps_a,'-s')
title('Price Inflation')
subplot(4,4,9)
plot(1:options_.irf,oo_sticky_wages.irfs.y_nat_eps_a,'-d',1:options_.irf,oo_flexible_wages.irfs.y_nat_eps_a,'-s')
title('Price Inflation')


write_latex_dynamic_model;
collect_latex_files; 