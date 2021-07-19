var Cu, Cc, Lu, Lc, R, bc, Hu, Hc, q, Wu, Wc, dp, Y, C, x, J, A pi_w1 pi_w2 w_gap1 w_gap2 w_nat1 w_nat2  y_gap y_nat r_real;
varexo eps_nu, n_inf, eps_a;

parameters siggma varphi PHIW theta_p rho_nu epsilon_w rho_z rho_a theta_w1 theta_w2 eta alppha epsilon_p BETA, T_BETA, m, GAMMA, X, ETA, RHO, PHIP, PHIY, KTILDE, J_ss, PP;

BETA=0.99;
T_BETA=0.98;
J_ss=0.1;
X=1.2;
KTILDE=0.0858;
ETA=1.01;
m=0.98;
GAMMA=0.64;
X=1.2;
THETA=0.75;
RHO=0.8;

PHIP=1.40444;
PHIW=0;
PHIY=0.51261;


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
1/exp(Cu) = BETA*exp(R-dp(+1)-Cu(+1));


%% EQ 2) FOC for wages:
%exp(Wu)=((exp(Lu))^(ETA-1))*exp(Cu);
Wu = (ETA-1)*Lu + Cu ;

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
J= J_ss;

% EQ 7) Collateral Contraint
exp(bc)=(m*exp(Hc)/exp(R))*exp(q(+1))*exp(dp(+1));
 
%%%%%%%%%%%
%% Firms
%%%%%%%%%%%

%% EQ 8) Production Function
exp(Y)=  exp(A) * ((exp(Lu))^GAMMA*(exp(Lc))^(1-GAMMA));
 
%% EQ 9) FOC 1
%exp(Wu)=GAMMA*(exp(Lu))^(GAMMA-1)*(exp(Lc))^(1-GAMMA)*(1/exp(x));
Wu = log(GAMMA) + Y - x - Lu ;

%% EQ 10) FOC 2
exp(Wc)=GAMMA*((exp(Lu))^GAMMA)*((exp(Lc))^(-GAMMA))*(1/exp(x));


A = 0.8 * A(-1) + eps_a;


%%%%%%%%%%%
%% Monetary Policy
%%%%%%%%%%%

%% EQ 11) NKPC
dp = BETA * dp(+1) - KTILDE*(x-log(X)) + lambda_p * w_gap1 + lambda_p * w_gap2  + n_inf; 

%% EQ 12) Taylor Rule
R = RHO*R(-1)+(1-RHO)*(1+PHIP)*dp+(1-RHO)*PHIY*(Y-Y(-1)) +(1-RHO)*log(1/BETA) + (1-RHO)*(PHIW * (pi_w1 + pi_w2)/2) + eps_nu;
%R = RHO*R(-1)+(1-RHO)*(1+PHIP)*dp+(1-RHO)*PHIY*(Y-Y(-1)) +(1-RHO)*log(1/BETA) - eps_nu;


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
pi_w2 = T_BETA * pi_w2(+1) + aleph_w2 * y_gap - lambda_w2 * w_gap2;

w_gap1=w_gap1(-1)+pi_w1-dp-(w_nat1-w_nat1(-1));
w_gap2=w_gap2(-1)+pi_w2-dp-(w_nat2-w_nat2(-1));


y_gap=Y-y_nat;
y_nat=psi_n_ya*A;


w_nat1 = 1 - alppha + psi_n_wa * A;
w_nat2 = 1 - alppha + psi_n_wa * A;

r_real = R - dp;

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



shocks;
var eps_nu = 0.25^2; 
var n_inf; stderr 1;
var eps_a; stderr 1;
end;

stoch_simul(order = 1,irf=15,nograph,noprint) r_real Cu, Cc, Lu, Lc, R, bc, Hu, Hc, q, Wu, Wc, dp, Y, C, x, J, A pi_w1 pi_w2 w_gap1 w_gap2 w_nat1 w_nat2  y_gap y_nat;
oo_baseline=oo_;


%sticky wage case
set_param_value('theta_w1',3/4)
set_param_value('theta_w2', 3/4)
set_param_value('theta_p',3/4)
stoch_simul(order = 1,irf=15,nograph,noprint) r_real Cu, Cc, Lu, Lc, R, bc, Hu, Hc, q, Wu, Wc, dp, Y, C, x, J, A pi_w1 pi_w2 w_gap1 w_gap2 w_nat1 w_nat2  y_gap y_nat;
oo_sticky_wages=oo_;

%flex wage case
set_param_value('theta_w1',0.00000001)
set_param_value('theta_w2',0.00000001)
set_param_value('theta_p',3/4)
stoch_simul(order = 1,irf=15) r_real Cu, Cc, Lu, Lc, R, bc, Hu, Hc, q, Wu, Wc, dp, Y, C, x, J, A pi_w1 pi_w2 w_gap1 w_gap2 w_nat1 w_nat2  y_gap y_nat;
oo_flexible_wages=oo_;


%sticky wage case
set_param_value('theta_w1',3/4)
set_param_value('theta_w2', 3/4)
set_param_value('theta_p',3/4)
set_param_value('PHIW', 1.5)
stoch_simul(order = 1,irf=15,nograph,noprint) r_real Cu, Cc, Lu, Lc, R, bc, Hu, Hc, q, Wu, Wc, dp, Y, C, x, J, A pi_w1 pi_w2 w_gap1 w_gap2 w_nat1 w_nat2  y_gap y_nat;
oo_wageTRs=oo_;



% One labour market is perfect and the other isnt
set_param_value('theta_w1',0.00000001)
set_param_value('theta_w2',3/4)
set_param_value('theta_p',3/4)
stoch_simul(order = 1,irf=15,nograph,noprint) r_real Cu, Cc, Lu, Lc, R, bc, Hu, Hc, q, Wu, Wc, dp, Y, C, x, J, A pi_w1 pi_w2 w_gap1 w_gap2 w_nat1 w_nat2  y_gap y_nat;
oo_partial_wages=oo_;

varlist = {'Cu', 'Cc', 'Lu', 'Lc', 'R', 'bc', 'Hu', 'Hc', 'q', 'Wu', 'Wc', 'dp', 'Y', 'C', 'x', 'pi_w1', 'pi_w2',  'y_gap', 'y_nat', 'r_real'};
labelList = {'Consumption (unconstrained)', 'Consumption (constrained)', 'Labour (unconstrained)', 'Labour (constrained)', 'Interest Rate', 'Borrowing', 'Housing (unconstrained)', 'Housing (constrained)', 'House Prices','Wages (unconstrained)', 'Wages (constrained)', 'Inflation', 'Output','Consumption', 'Wage Inflation (unconstrained)', 'Wage Inflation (constrained)', 'Wage Gap (unconstrained)', 'Wage Gap (constrained)', 'Output Gap','Real Interest Rate'};


figure('Name','Dynamic Responses to monetary policy shock')

x0=10;
y0=10;
width=1000;
height=1200
set(gcf,'position',[x0,y0,width,height])

for i = 1:length(varlist)
    subplot(7,4,i)
    plot(1:options_.irf, eval(['oo_sticky_wages.irfs.',varlist{i},'_eps_nu'])  ,'-d',1:options_.irf, eval(['oo_flexible_wages.irfs.', varlist{i},'_eps_nu']) ,'-s')
    title(labelList{i})
    if i == 1
        ll=legend('Sticky Wages','Flexible Wages');
        set(ll,'Location','NorthEast')
    end
end
exportgraphics(gcf,'irf_eps_nu.png','Resolution',300)



%%% Responses under different policy rules.

%% No Response to wage inflation
set_param_value('theta_w1',3/4)
set_param_value('theta_w2', 3/4)
set_param_value('theta_p',3/4)
set_param_value('PHIW', 0)
stoch_simul(order = 1,irf=15,nograph,noprint) r_real Cu, Cc, Lu, Lc, R, bc, Hu, Hc, q, Wu, Wc, dp, Y, C, x, J, A pi_w1 pi_w2 w_gap1 w_gap2 w_nat1 w_nat2  y_gap y_nat;
oo_nowageresponse=oo_;

%% Response to average wage inflation
set_param_value('theta_w1',3/4)
set_param_value('theta_w2', 3/4)
set_param_value('theta_p',3/4)
set_param_value('PHIW', 1.5)
stoch_simul(order = 1,irf=15,nograph,noprint) r_real Cu, Cc, Lu, Lc, R, bc, Hu, Hc, q, Wu, Wc, dp, Y, C, x, J, A pi_w1 pi_w2 w_gap1 w_gap2 w_nat1 w_nat2  y_gap y_nat;
oo_wageresponse=oo_;

figure('Name','Dynamic Responses with alternative Taylor Rules')
y0=10;
width=1000;
height=1200
set(gcf,'position',[x0,y0,width,height])

for i = 1:length(varlist)
    subplot(7,4,i)
    plot(1:options_.irf, eval(['oo_nowageresponse.irfs.',varlist{i},'_eps_nu'])  ,'-d',1:options_.irf, eval(['oo_wageresponse.irfs.', varlist{i},'_eps_nu']) ,'-sg')
    title(labelList{i})
    if i == 1
        ll=legend('No Wage Response','Wage Response');
        set(ll,'Location','NorthEast')
    end
end
exportgraphics(gcf,'TRirf_eps_nu.png','Resolution',300)
