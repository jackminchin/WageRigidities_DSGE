/*
 * This file implements the New Keynesian model with price and wage rigidities 
 * of Jordi Galí (2015): Monetary Policy, Inflation, and the Business Cycle, Princeton 
 * University Press, Second Edition, Chapter 6
 *
 * THIS MOD-FILE REQUIRES DYNARE 4.5 OR HIGHER
 *
 * Notes:
 *  - all model variables are expressed in deviations from steady state, i.e. in contrast to
 *      to the chapter, the nominal interest rate, natural output, and the natural real wage are not in log-levels, but rather mean 0
 *  - in the LOM for the discount rate shock z the shock enters with a minus sign in this mod-file to generate the 
 *      IRF to a -0.5% shock
 *  - on p. 168 in the first-order condition for the optimal wage (the equation above equation (11)) 
 *      it should be a minus sign in the middle term, i.e. 
 *          -M_w*N^{phi}_{t+k|t}
 *      instead of 
 *          +M_w*N^{phi}_{t+k|t}
  *     Equation (11) is correct again.
 *
 * This implementation was written by Johannes Pfeifer. In case you spot mistakes,
 * email me at jpfeifer@gmx.de
 *
 * Please note that the following copyright notice only applies to this Dynare 
 * implementation of the model.
 */

/*
 * Copyright (C) 2016 Johannes Pfeifer
 *
 * This is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * It is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * For a copy of the GNU General Public License,
 * see <http://www.gnu.org/licenses/>.
 */

var pi_p        ${\pi^p}$               (long_name='price inflation')
    y_gap       ${\tilde y}$            (long_name='output gap')
    y_nat       ${y^{nat}}$             (long_name='natural output')      //(in contrast to the textbook defined in deviation from steady state)
    y           ${y}$                   (long_name='output')
    yhat        ${\hat y}$              (long_name='output deviation from steady state')
    r_nat       ${r^{nat}}$             (long_name='natural interest rate')
    r_real      ${r^r}$                 (long_name='real interest rate')     
    i           ${i}$                   (long_name='nominal interrst rate')
    n           ${n}$                   (long_name='hours worked')
    nu          ${\nu}$                 (long_name='AR(1) monetary policy shock process')    
    a           ${a}$                   (long_name='AR(1) technology shock process')
    z           ${z}$                   (long_name='AR(1) preference shock process')
    p           ${p}$                   (long_name='price level')
    w           ${w}$                   (long_name='nominal wage')
    c           ${c}$                   (long_name='consumption')
    w_real      $\omega$                (long_name='real wage')
    w_gap       ${\tilde \omega}$       (long_name='real wage gap')
    pi_w        ${\pi^w}$               (long_name='wage inflation')
    w_nat       ${w^{nat}}$             (long_name='natural real wage')
    mu_p        ${\mu^p}$               (long_name='markup')
    junk
;     

varexo  eps_a       ${\varepsilon_a}$   (long_name='technology shock')
        eps_nu      ${\varepsilon_\nu}$ (long_name='monetary policy shock')
        eps_z       ${\varepsilon_z}$   (long_name='preference shock innovation')
       ;

parameters alppha       ${\alpha}$     (long_name='capital share')
    betta               ${\beta}$       (long_name='discount factor')
    rho_a               ${\rho_a}$      (long_name='autocorrelation technology shock')
    rho_nu              ${\rho_{\nu}}$  (long_name='autocorrelation monetary policy shock')
    rho_z               ${\rho_{z}}$    (long_name='autocorrelation monetary demand shock')
    siggma              ${\sigma}$      (long_name='inverse EIS')
    varphi              ${\varphi}$     (long_name='inverse Frisch elasticity')
    phi_pi              ${\phi_{\pi}}$  (long_name='inflation feedback Taylor Rule')
    phi_y               ${\phi_{y}}$    (long_name='output feedback Taylor Rule')
    eta                 ${\eta}$        (long_name='semi-elasticity of money demand')
    epsilon_p           ${\epsilon_p}$  (long_name='demand elasticity goods')
    theta_p             ${\theta_p}$    (long_name='Calvo parameter prices')
    epsilon_w           ${\epsilon_w}$  (long_name='demand elasticity labor services')
    theta_w             ${\theta_w}$    (long_name='Calvo parameter wages')
    ;
%----------------------------------------------------------------
% Parametrization, p. 67  and p. 113-115
%----------------------------------------------------------------
siggma = 1;
varphi=5;
phi_pi = 1.5;
phi_y  = 0.125;
theta_p=3/4;
rho_nu =0.5;
rho_z  = 0.5;
rho_a  = 0.9;
betta  = 0.99;
eta  =3.77; %footnote 11, p. 115
alppha=1/4;
epsilon_p=9;

epsilon_w=4.5;
theta_w=3/4;
%----------------------------------------------------------------
% First Order Conditions
%----------------------------------------------------------------

model(linear); 
//Composite parameters
#Omega=(1-alppha)/(1-alppha+alppha*epsilon_p);              %defined on page 166
#psi_n_ya=(1+varphi)/(siggma*(1-alppha)+varphi+alppha);     %defined on page 171
#psi_n_wa=(1-alppha*psi_n_ya)/(1-alppha);                   %defined on page 171
#lambda_p=(1-theta_p)*(1-betta*theta_p)/theta_p*Omega;      %defined on page 166
#aleph_p=alppha*lambda_p/(1-alppha);                         %defined on page 172
#lambda_w=(1-theta_w)*(1-betta*theta_w)/(theta_w*(1+epsilon_w*varphi));      %defined on page 170
#aleph_w=lambda_w*(siggma+varphi/(1-alppha));               %defined on page 172


[name='New Keynesian Phillips Curve eq. (18)']
pi_p=betta*pi_p(+1)+aleph_p*y_gap+lambda_p*w_gap;
[name='New Keynesian Wage Phillips Curve eq. (22)']
pi_w=betta*pi_w(+1)+aleph_w*y_gap-lambda_w*w_gap;
[name='Dynamic IS Curve eq. (22)']
y_gap=-1/siggma*(i-pi_p(+1)-r_nat)+y_gap(+1);
[name='Interest Rate Rule eq. (26)']
i=phi_pi*pi_p+phi_y*yhat+nu;
[name='Definition natural rate of interest eq. (24)']
r_nat=-siggma*psi_n_ya*(1-rho_a)*a+(1-rho_z)*z;
[name='Definition wage gap, eq (21)']
w_gap=w_gap(-1)+pi_w-pi_p-(w_nat-w_nat(-1));
[name='Definition natural wage, eq (16)']
w_nat=psi_n_wa*a;
[name='Definition markup']
mu_p=-alppha/(1-alppha)*y_gap-w_gap;
[name='Definition real wage gap, p. 171']
w_gap=w_real-w_nat;
[name='Definition real interest rate']
r_real=i-pi_p(+1);
[name='Definition natural output, eq. (20)']
y_nat=psi_n_ya*a;
[name='Definition output gap']
y_gap=y-y_nat;
[name='Monetary policy shock']
nu=rho_nu*nu(-1)+eps_nu;
[name='TFP shock']
a=rho_a*a(-1)+eps_a;
[name='Production function, p. 171']
y=a+(1-alppha)*n;
[name='Preference shock, p. 54']
z     = rho_z*z(-1) - eps_z;

c = c(+1) - (1/siggma) * (i - pi_p(+1)) + (1/siggma) * (1 - rho_z) * z + junk;





[name='Output deviation from steady state']
yhat=y-steady_state(y);
[name='Definition price level']
pi_p=p-p(-1);
[name='resource constraint, eq. (12)']
y=c;
[name='definition real wage']
w_real=w-p;

end;


%----------------------------------------------------------------
%  define shock variances
%---------------------------------------------------------------


shocks;
    var eps_nu = 0.25^2; //1 standard deviation shock of 25 basis points, i.e. 1 percentage point annualized
end;

%----------------------------------------------------------------
%  steady states: all 0 due to linear model
%---------------------------------------------------------------
resid(1);
steady;
check;

%----------------------------------------------------------------
% generate IRFs for monetary policy shock, replicates Figures 6.2, p. 176
%----------------------------------------------------------------
stoch_simul(order = 1,irf=15,noprint,nograph) y_gap w_real c;

oo_baseline=oo_;

%flexible wage case
set_param_value('theta_w',0.0000000001)
set_param_value('theta_p',3/4)
stoch_simul(order = 1,irf=15,nograph,noprint) y_gap w_real c;
oo_flexible_wages=oo_;

%flexible price case
set_param_value('theta_w',3/4)
set_param_value('theta_p',0.000000001)
stoch_simul(order = 1,irf=15,nograph,noprint) y_gap w_real c;
oo_flexible_prices=oo_;

figure('Name','Dynamic Responses to monetary policy shock')
subplot(2,2,1)
plot(1:options_.irf,oo_baseline.irfs.y_gap_eps_nu,'-o',1:options_.irf,oo_flexible_wages.irfs.y_gap_eps_nu,'-d',1:options_.irf,oo_flexible_prices.irfs.y_gap_eps_nu,'-s')
title('Output gap')
ll=legend('baseline','flexible wages','flexible prices');
set(ll,'Location','SouthEast');
subplot(2,2,4)
plot(1:options_.irf,oo_baseline.irfs.w_real_eps_nu,'-o',1:options_.irf,oo_flexible_wages.irfs.w_real_eps_nu,'-d',1:options_.irf,oo_flexible_prices.irfs.w_real_eps_nu,'-s')
title('Real wage')
subplot(2,2,2)
plot(1:options_.irf,oo_baseline.irfs.c_eps_nu,'-o',1:options_.irf,oo_flexible_wages.irfs.c_eps_nu,'-d',1:options_.irf,oo_flexible_prices.irfs.c_eps_nu,'-s')
title('Consumption')

write_latex_dynamic_model;
collect_latex_files; 