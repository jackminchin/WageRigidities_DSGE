function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = attempt2.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(25, 1);
lhs = 1/exp(y(10));
rhs = params(15)*exp(y(14)-y(38)-y(35));
residual(1) = lhs - rhs;
lhs = exp(y(19));
rhs = T(4);
residual(2) = lhs - rhs;
lhs = y(25)/exp(y(16));
rhs = exp(y(18)-y(10))-params(15)*exp(y(37)-y(35));
residual(3) = lhs - rhs;
lhs = exp(y(11));
rhs = exp(y(20)+y(13))+exp(y(15))+exp(y(18))*(exp(y(3))-exp(y(17)))-exp(y(1)+y(2)-y(21));
residual(4) = lhs - rhs;
lhs = y(20);
rhs = y(11)+(params(21)-1)*y(13);
residual(5) = lhs - rhs;
lhs = y(25)/exp(y(17));
rhs = exp(y(18)-y(11))-0.9*exp(y(38)+y(37)-y(14)-y(11))-params(16)*0.09999999999999998*exp(y(37)-y(36));
residual(6) = lhs - rhs;
lhs = y(25);
rhs = params(28)*params(27)+x(it_, 1);
residual(7) = lhs - rhs;
lhs = exp(y(15));
rhs = T(5);
residual(8) = lhs - rhs;
lhs = y(22);
rhs = y(12)*y(26)*params(19)+y(13)*(1-params(19));
residual(9) = lhs - rhs;
lhs = exp(y(19));
rhs = T(6)*T(7)*1/exp(y(24));
residual(10) = lhs - rhs;
lhs = y(20);
rhs = y(22)+log(1-params(19))-y(24)-y(13);
residual(11) = lhs - rhs;
lhs = y(26);
rhs = 0.8*y(5)+x(it_, 4);
residual(12) = lhs - rhs;
lhs = y(21);
rhs = x(it_, 3)+params(15)*y(38)-params(26)*(y(24)-log(params(20)))+y(29)*T(8)+y(30)*T(8);
residual(13) = lhs - rhs;
lhs = y(14);
rhs = y(1)*params(22)+y(21)*(1-params(22))*(1+params(23))+(1-params(22))*params(24)*(y(22)-y(4))+(1-params(22))*(-log(params(15)))+x(it_, 2);
residual(14) = lhs - rhs;
lhs = exp(y(22));
rhs = exp(y(23));
residual(15) = lhs - rhs;
lhs = exp(y(23));
rhs = exp(y(10))+exp(y(11));
residual(16) = lhs - rhs;
lhs = exp(y(16))+exp(y(17));
rhs = 1;
residual(17) = lhs - rhs;
lhs = y(27);
rhs = params(15)*y(39)+y(33)*T(2)*(params(1)+params(3)/(1-params(13)))-T(2)*y(29);
residual(18) = lhs - rhs;
lhs = y(28);
rhs = params(16)*y(40)+y(33)*T(3)*(params(1)+params(3)/(1-params(13)))-T(3)*y(30);
residual(19) = lhs - rhs;
lhs = y(29);
rhs = y(27)+y(6)-y(21)-(y(31)-y(8));
residual(20) = lhs - rhs;
lhs = y(30);
rhs = y(28)+y(7)-y(21)-(y(32)-y(9));
residual(21) = lhs - rhs;
lhs = y(33);
rhs = y(22)-y(34);
residual(22) = lhs - rhs;
lhs = y(34);
rhs = T(1)*y(26);
residual(23) = lhs - rhs;
lhs = y(31);
rhs = T(9);
residual(24) = lhs - rhs;
lhs = y(32);
rhs = T(9);
residual(25) = lhs - rhs;

end
