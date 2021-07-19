function T = static_resid_tt(T, y, x, params)
% function T = static_resid_tt(T, y, x, params)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%
% Output:
%   T         [#temp variables by 1]  double   vector of temporary terms
%

assert(length(T) >= 9);

T(1) = (1+params(3))/(params(13)+params(3)+(1-params(13))*params(1));
T(2) = (1-params(13))/(1-params(13)+params(13)*params(14))*(1-params(5))*(1-params(5)*params(15))/params(5);
T(3) = (1-params(10))*(1-params(15)*params(10))/(params(10)*(1+params(3)*params(7)));
T(4) = (1-params(11))*(1-params(11)*params(16))/((1+params(3)*params(7))*params(11));
T(5) = exp(y(1))*exp(y(3))^(params(21)-1);
T(6) = exp(y(9))*exp(y(8))*params(18)/exp(y(5))*exp(y(12));
T(7) = params(19)*exp(y(3))^(params(19)-1);
T(8) = exp(y(4))^(1-params(19));
T(9) = 1-params(13)+(1-params(13)*T(1))/(1-params(13))*y(17);

end
