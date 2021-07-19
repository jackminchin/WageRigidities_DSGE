%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'attempt2';
M_.dynare_version = '4.6.4';
oo_.dynare_version = '4.6.4';
options_.dynare_version = '4.6.4';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('attempt2.log');
M_.exo_names = cell(4,1);
M_.exo_names_tex = cell(4,1);
M_.exo_names_long = cell(4,1);
M_.exo_names(1) = {'e'};
M_.exo_names_tex(1) = {'e'};
M_.exo_names_long(1) = {'e'};
M_.exo_names(2) = {'eps_nu'};
M_.exo_names_tex(2) = {'eps\_nu'};
M_.exo_names_long(2) = {'eps_nu'};
M_.exo_names(3) = {'n_inf'};
M_.exo_names_tex(3) = {'n\_inf'};
M_.exo_names_long(3) = {'n_inf'};
M_.exo_names(4) = {'eps_a'};
M_.exo_names_tex(4) = {'eps\_a'};
M_.exo_names_long(4) = {'eps_a'};
M_.endo_names = cell(25,1);
M_.endo_names_tex = cell(25,1);
M_.endo_names_long = cell(25,1);
M_.endo_names(1) = {'Cu'};
M_.endo_names_tex(1) = {'Cu'};
M_.endo_names_long(1) = {'Cu'};
M_.endo_names(2) = {'Cc'};
M_.endo_names_tex(2) = {'Cc'};
M_.endo_names_long(2) = {'Cc'};
M_.endo_names(3) = {'Lu'};
M_.endo_names_tex(3) = {'Lu'};
M_.endo_names_long(3) = {'Lu'};
M_.endo_names(4) = {'Lc'};
M_.endo_names_tex(4) = {'Lc'};
M_.endo_names_long(4) = {'Lc'};
M_.endo_names(5) = {'R'};
M_.endo_names_tex(5) = {'R'};
M_.endo_names_long(5) = {'R'};
M_.endo_names(6) = {'bc'};
M_.endo_names_tex(6) = {'bc'};
M_.endo_names_long(6) = {'bc'};
M_.endo_names(7) = {'Hu'};
M_.endo_names_tex(7) = {'Hu'};
M_.endo_names_long(7) = {'Hu'};
M_.endo_names(8) = {'Hc'};
M_.endo_names_tex(8) = {'Hc'};
M_.endo_names_long(8) = {'Hc'};
M_.endo_names(9) = {'q'};
M_.endo_names_tex(9) = {'q'};
M_.endo_names_long(9) = {'q'};
M_.endo_names(10) = {'Wu'};
M_.endo_names_tex(10) = {'Wu'};
M_.endo_names_long(10) = {'Wu'};
M_.endo_names(11) = {'Wc'};
M_.endo_names_tex(11) = {'Wc'};
M_.endo_names_long(11) = {'Wc'};
M_.endo_names(12) = {'dp'};
M_.endo_names_tex(12) = {'dp'};
M_.endo_names_long(12) = {'dp'};
M_.endo_names(13) = {'Y'};
M_.endo_names_tex(13) = {'Y'};
M_.endo_names_long(13) = {'Y'};
M_.endo_names(14) = {'C'};
M_.endo_names_tex(14) = {'C'};
M_.endo_names_long(14) = {'C'};
M_.endo_names(15) = {'x'};
M_.endo_names_tex(15) = {'x'};
M_.endo_names_long(15) = {'x'};
M_.endo_names(16) = {'J'};
M_.endo_names_tex(16) = {'J'};
M_.endo_names_long(16) = {'J'};
M_.endo_names(17) = {'A'};
M_.endo_names_tex(17) = {'A'};
M_.endo_names_long(17) = {'A'};
M_.endo_names(18) = {'pi_w1'};
M_.endo_names_tex(18) = {'pi\_w1'};
M_.endo_names_long(18) = {'pi_w1'};
M_.endo_names(19) = {'pi_w2'};
M_.endo_names_tex(19) = {'pi\_w2'};
M_.endo_names_long(19) = {'pi_w2'};
M_.endo_names(20) = {'w_gap1'};
M_.endo_names_tex(20) = {'w\_gap1'};
M_.endo_names_long(20) = {'w_gap1'};
M_.endo_names(21) = {'w_gap2'};
M_.endo_names_tex(21) = {'w\_gap2'};
M_.endo_names_long(21) = {'w_gap2'};
M_.endo_names(22) = {'w_nat1'};
M_.endo_names_tex(22) = {'w\_nat1'};
M_.endo_names_long(22) = {'w_nat1'};
M_.endo_names(23) = {'w_nat2'};
M_.endo_names_tex(23) = {'w\_nat2'};
M_.endo_names_long(23) = {'w_nat2'};
M_.endo_names(24) = {'y_gap'};
M_.endo_names_tex(24) = {'y\_gap'};
M_.endo_names_long(24) = {'y_gap'};
M_.endo_names(25) = {'y_nat'};
M_.endo_names_tex(25) = {'y\_nat'};
M_.endo_names_long(25) = {'y_nat'};
M_.endo_partitions = struct();
M_.param_names = cell(28,1);
M_.param_names_tex = cell(28,1);
M_.param_names_long = cell(28,1);
M_.param_names(1) = {'siggma'};
M_.param_names_tex(1) = {'siggma'};
M_.param_names_long(1) = {'siggma'};
M_.param_names(2) = {'K'};
M_.param_names_tex(2) = {'K'};
M_.param_names_long(2) = {'K'};
M_.param_names(3) = {'varphi'};
M_.param_names_tex(3) = {'varphi'};
M_.param_names_long(3) = {'varphi'};
M_.param_names(4) = {'XSS'};
M_.param_names_tex(4) = {'XSS'};
M_.param_names_long(4) = {'XSS'};
M_.param_names(5) = {'theta_p'};
M_.param_names_tex(5) = {'theta\_p'};
M_.param_names_long(5) = {'theta_p'};
M_.param_names(6) = {'rho_nu'};
M_.param_names_tex(6) = {'rho\_nu'};
M_.param_names_long(6) = {'rho_nu'};
M_.param_names(7) = {'epsilon_w'};
M_.param_names_tex(7) = {'epsilon\_w'};
M_.param_names_long(7) = {'epsilon_w'};
M_.param_names(8) = {'rho_z'};
M_.param_names_tex(8) = {'rho\_z'};
M_.param_names_long(8) = {'rho_z'};
M_.param_names(9) = {'rho_a'};
M_.param_names_tex(9) = {'rho\_a'};
M_.param_names_long(9) = {'rho_a'};
M_.param_names(10) = {'theta_w1'};
M_.param_names_tex(10) = {'theta\_w1'};
M_.param_names_long(10) = {'theta_w1'};
M_.param_names(11) = {'theta_w2'};
M_.param_names_tex(11) = {'theta\_w2'};
M_.param_names_long(11) = {'theta_w2'};
M_.param_names(12) = {'eta'};
M_.param_names_tex(12) = {'eta'};
M_.param_names_long(12) = {'eta'};
M_.param_names(13) = {'alppha'};
M_.param_names_tex(13) = {'alppha'};
M_.param_names_long(13) = {'alppha'};
M_.param_names(14) = {'epsilon_p'};
M_.param_names_tex(14) = {'epsilon\_p'};
M_.param_names_long(14) = {'epsilon_p'};
M_.param_names(15) = {'BETA'};
M_.param_names_tex(15) = {'BETA'};
M_.param_names_long(15) = {'BETA'};
M_.param_names(16) = {'T_BETA'};
M_.param_names_tex(16) = {'T\_BETA'};
M_.param_names_long(16) = {'T_BETA'};
M_.param_names(17) = {'j'};
M_.param_names_tex(17) = {'j'};
M_.param_names_long(17) = {'j'};
M_.param_names(18) = {'m'};
M_.param_names_tex(18) = {'m'};
M_.param_names_long(18) = {'m'};
M_.param_names(19) = {'GAMMA'};
M_.param_names_tex(19) = {'GAMMA'};
M_.param_names_long(19) = {'GAMMA'};
M_.param_names(20) = {'X'};
M_.param_names_tex(20) = {'X'};
M_.param_names_long(20) = {'X'};
M_.param_names(21) = {'ETA'};
M_.param_names_tex(21) = {'ETA'};
M_.param_names_long(21) = {'ETA'};
M_.param_names(22) = {'RHO'};
M_.param_names_tex(22) = {'RHO'};
M_.param_names_long(22) = {'RHO'};
M_.param_names(23) = {'PHIP'};
M_.param_names_tex(23) = {'PHIP'};
M_.param_names_long(23) = {'PHIP'};
M_.param_names(24) = {'PHIY'};
M_.param_names_tex(24) = {'PHIY'};
M_.param_names_long(24) = {'PHIY'};
M_.param_names(25) = {'OMEGA'};
M_.param_names_tex(25) = {'OMEGA'};
M_.param_names_long(25) = {'OMEGA'};
M_.param_names(26) = {'KTILDE'};
M_.param_names_tex(26) = {'KTILDE'};
M_.param_names_long(26) = {'KTILDE'};
M_.param_names(27) = {'J_ss'};
M_.param_names_tex(27) = {'J\_ss'};
M_.param_names_long(27) = {'J_ss'};
M_.param_names(28) = {'PP'};
M_.param_names_tex(28) = {'PP'};
M_.param_names_long(28) = {'PP'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 4;
M_.endo_nbr = 25;
M_.param_nbr = 28;
M_.orig_endo_nbr = 25;
M_.aux_vars = [];
M_.Sigma_e = zeros(4, 4);
M_.Correlation_matrix = eye(4, 4);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.linear_decomposition = false;
M_.orig_eq_nbr = 25;
M_.eq_nbr = 25;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 0 10 35;
 0 11 36;
 0 12 0;
 0 13 0;
 1 14 0;
 2 15 0;
 0 16 0;
 3 17 0;
 0 18 37;
 0 19 0;
 0 20 0;
 0 21 38;
 4 22 0;
 0 23 0;
 0 24 0;
 0 25 0;
 5 26 0;
 0 27 39;
 0 28 40;
 6 29 0;
 7 30 0;
 8 31 0;
 9 32 0;
 0 33 0;
 0 34 0;]';
M_.nstatic = 10;
M_.nfwrd   = 6;
M_.npred   = 9;
M_.nboth   = 0;
M_.nsfwrd   = 6;
M_.nspred   = 9;
M_.ndynamic   = 15;
M_.dynamic_tmp_nbr = [9; 0; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , '1' ;
  2 , 'name' , '2' ;
  3 , 'name' , '3' ;
  4 , 'name' , '4' ;
  5 , 'name' , 'Wc' ;
  6 , 'name' , '6' ;
  7 , 'name' , 'J' ;
  8 , 'name' , '8' ;
  9 , 'name' , 'Y' ;
  10 , 'name' , '10' ;
  11 , 'name' , '11' ;
  12 , 'name' , 'A' ;
  13 , 'name' , 'dp' ;
  14 , 'name' , 'R' ;
  15 , 'name' , '15' ;
  16 , 'name' , '16' ;
  17 , 'name' , '17' ;
  18 , 'name' , 'pi_w1' ;
  19 , 'name' , 'pi_w2' ;
  20 , 'name' , 'w_gap1' ;
  21 , 'name' , 'w_gap2' ;
  22 , 'name' , 'y_gap' ;
  23 , 'name' , 'y_nat' ;
  24 , 'name' , 'w_nat1' ;
  25 , 'name' , 'w_nat2' ;
};
M_.mapping.Cu.eqidx = [1 2 3 16 ];
M_.mapping.Cc.eqidx = [4 5 6 16 ];
M_.mapping.Lu.eqidx = [2 9 10 ];
M_.mapping.Lc.eqidx = [4 5 9 10 11 ];
M_.mapping.R.eqidx = [1 4 6 8 14 ];
M_.mapping.bc.eqidx = [4 8 ];
M_.mapping.Hu.eqidx = [3 17 ];
M_.mapping.Hc.eqidx = [4 6 8 17 ];
M_.mapping.q.eqidx = [3 4 6 8 ];
M_.mapping.Wu.eqidx = [2 10 ];
M_.mapping.Wc.eqidx = [4 5 11 ];
M_.mapping.dp.eqidx = [1 4 6 8 13 14 20 21 ];
M_.mapping.Y.eqidx = [9 11 14 15 22 ];
M_.mapping.C.eqidx = [15 16 ];
M_.mapping.x.eqidx = [10 11 13 ];
M_.mapping.J.eqidx = [3 6 7 ];
M_.mapping.A.eqidx = [9 12 23 24 25 ];
M_.mapping.pi_w1.eqidx = [18 20 ];
M_.mapping.pi_w2.eqidx = [19 21 ];
M_.mapping.w_gap1.eqidx = [13 18 20 ];
M_.mapping.w_gap2.eqidx = [13 19 21 ];
M_.mapping.w_nat1.eqidx = [20 24 ];
M_.mapping.w_nat2.eqidx = [21 25 ];
M_.mapping.y_gap.eqidx = [18 19 22 ];
M_.mapping.y_nat.eqidx = [22 23 ];
M_.mapping.e.eqidx = [7 ];
M_.mapping.eps_nu.eqidx = [14 ];
M_.mapping.n_inf.eqidx = [13 ];
M_.mapping.eps_a.eqidx = [12 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [5 6 8 13 17 20 21 22 23 ];
M_.exo_names_orig_ord = [1:4];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(25, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(4, 1);
M_.params = NaN(28, 1);
M_.endo_trends = struct('deflator', cell(25, 1), 'log_deflator', cell(25, 1), 'growth_factor', cell(25, 1), 'log_growth_factor', cell(25, 1));
M_.NNZDerivatives = [104; -1; -1; ];
M_.static_tmp_nbr = [9; 0; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
M_.params(15) = 0.99;
BETA = M_.params(15);
M_.params(16) = 0.98;
T_BETA = M_.params(16);
M_.params(27) = 0.1;
J_ss = M_.params(27);
M_.params(2) = 0.9;
K = M_.params(2);
M_.params(20) = 1.2;
X = M_.params(20);
M_.params(26) = 0.0858;
KTILDE = M_.params(26);
M_.params(21) = 1.01;
ETA = M_.params(21);
M_.params(18) = 0.8;
m = M_.params(18);
M_.params(19) = 0.64;
GAMMA = M_.params(19);
M_.params(20) = 1.2;
X = M_.params(20);
M_.params(4) = 1.2;
XSS = M_.params(4);
THETA=0.75;
M_.params(22) = 0.8;
RHO = M_.params(22);
M_.params(23) = 1.5;
PHIP = M_.params(23);
M_.params(24) = 0.124;
PHIY = M_.params(24);
STDERR_AE=0.0029;
RHOG=0.8;
M_.params(28) = 0.95;
PP = M_.params(28);
M_.params(1) = 1;
siggma = M_.params(1);
M_.params(3) = 5;
varphi = M_.params(3);
M_.params(5) = 0.75;
theta_p = M_.params(5);
M_.params(6) = 0.5;
rho_nu = M_.params(6);
M_.params(8) = 0.5;
rho_z = M_.params(8);
M_.params(9) = 0.9;
rho_a = M_.params(9);
M_.params(12) = 3.77;
eta = M_.params(12);
M_.params(13) = 0.25;
alppha = M_.params(13);
M_.params(14) = 9;
epsilon_p = M_.params(14);
M_.params(7) = 4.5;
epsilon_w = M_.params(7);
M_.params(10) = 0.75;
theta_w1 = M_.params(10);
M_.params(11) = 0.9;
theta_w2 = M_.params(11);
%
% INITVAL instructions
%
options_.initval_file = false;
oo_.steady_state(1) = 0;
oo_.steady_state(2) = 0;
oo_.steady_state(10) = 0;
oo_.steady_state(11) = 0;
oo_.steady_state(6) = 0;
oo_.steady_state(3) = 0;
oo_.steady_state(4) = 0;
oo_.steady_state(7) = 0;
oo_.steady_state(8) = 0;
oo_.steady_state(12) = 0;
oo_.steady_state(5) = 0.01;
oo_.steady_state(13) = 0;
oo_.steady_state(9) = 0;
oo_.steady_state(15) = 0;
oo_.steady_state(17) = 0;
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
steady;
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(2, 2) = 0.0625;
M_.Sigma_e(1, 1) = (100)^2;
M_.Sigma_e(3, 3) = (1)^2;
M_.Sigma_e(4, 4) = (1)^2;
options_.irf = 15;
options_.nograph = true;
options_.noprint = true;
options_.order = 1;
var_list_ = {'y_gap';'Cc';'Cu';'C';'Wu';'Wc';'pi_w1';'pi_w2';'dp';'w_gap1';'w_gap2';'y_nat';'bc'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
oo_baseline=oo_;
set_param_value('theta_w1',3/4)
set_param_value('theta_w2', 3/4)
set_param_value('theta_p',3/4)
options_.irf = 15;
options_.nograph = true;
options_.noprint = true;
options_.order = 1;
var_list_ = {'y_gap';'Cc';'Cu';'C';'Wu';'Wc';'pi_w1';'pi_w2';'dp';'w_gap1';'w_gap2';'y_nat';'bc'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
oo_sticky_wages=oo_;
set_param_value('theta_w1',0.00000001)
set_param_value('theta_w2',0.00000001)
set_param_value('theta_p',3/4)
options_.irf = 15;
options_.nograph = true;
options_.noprint = true;
options_.order = 1;
var_list_ = {'y_gap';'Cc';'Cu';'C';'Wu';'Wc';'pi_w1';'pi_w2';'dp';'w_gap1';'w_gap2';'y_nat';'bc'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
oo_flexible_wages=oo_;
set_param_value('theta_w1',0.00000001)
set_param_value('theta_w2',3/4)
set_param_value('theta_p',3/4)
options_.irf = 15;
options_.nograph = true;
options_.noprint = true;
options_.order = 1;
var_list_ = {'y_gap';'Cc';'Cu';'C';'Wu';'Wc';'pi_w1';'pi_w2';'dp';'w_gap1';'w_gap2';'y_nat';'bc'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
oo_partial_wages=oo_;
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
collect_latex_files; 
save('attempt2_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('attempt2_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('attempt2_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('attempt2_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('attempt2_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('attempt2_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('attempt2_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
