function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = attempt2.static_resid_tt(T, y, x, params);
end
residual = zeros(25, 1);
lhs = 1/exp(y(1));
rhs = params(15)*exp(y(5)-y(12)-y(1));
residual(1) = lhs - rhs;
lhs = exp(y(10));
rhs = T(5);
residual(2) = lhs - rhs;
lhs = y(16)/exp(y(7));
rhs = exp(y(9)-y(1))-params(15)*exp(y(9)-y(1));
residual(3) = lhs - rhs;
lhs = exp(y(2));
rhs = exp(y(11)+y(4))+exp(y(6))-exp(y(5)+y(6)-y(12));
residual(4) = lhs - rhs;
lhs = y(11);
rhs = y(2)+(params(21)-1)*y(4);
residual(5) = lhs - rhs;
lhs = y(16)/exp(y(8));
rhs = exp(y(9)-y(2))-0.9*exp(y(12)+y(9)-y(5)-y(2))-exp(y(9)-y(2))*params(16)*0.09999999999999998;
residual(6) = lhs - rhs;
lhs = y(16);
rhs = params(28)*params(27)+x(1);
residual(7) = lhs - rhs;
lhs = exp(y(6));
rhs = T(6);
residual(8) = lhs - rhs;
lhs = y(13);
rhs = y(3)*y(17)*params(19)+y(4)*(1-params(19));
residual(9) = lhs - rhs;
lhs = exp(y(10));
rhs = T(7)*T(8)*1/exp(y(15));
residual(10) = lhs - rhs;
lhs = y(11);
rhs = y(13)+log(1-params(19))-y(15)-y(4);
residual(11) = lhs - rhs;
lhs = y(17);
rhs = y(17)*0.8+x(4);
residual(12) = lhs - rhs;
lhs = y(12);
rhs = x(3)+params(15)*y(12)-params(26)*(y(15)-log(params(20)))+T(2)*y(20)+T(2)*y(21);
residual(13) = lhs - rhs;
lhs = y(5);
rhs = y(5)*params(22)+y(12)*(1-params(22))*(1+params(23))+(1-params(22))*(-log(params(15)))+x(2);
residual(14) = lhs - rhs;
lhs = exp(y(13));
rhs = exp(y(14));
residual(15) = lhs - rhs;
lhs = exp(y(14));
rhs = exp(y(1))+exp(y(2));
residual(16) = lhs - rhs;
lhs = exp(y(7))+exp(y(8));
rhs = 1;
residual(17) = lhs - rhs;
lhs = y(18);
rhs = params(15)*y(18)+T(3)*(params(1)+params(3)/(1-params(13)))*y(24)-T(3)*y(20);
residual(18) = lhs - rhs;
lhs = y(19);
rhs = params(16)*y(19)+T(4)*(params(1)+params(3)/(1-params(13)))*y(24)-T(4)*y(21);
residual(19) = lhs - rhs;
lhs = y(20);
rhs = y(20)+y(18)-y(12);
residual(20) = lhs - rhs;
lhs = y(21);
rhs = y(21)+y(19)-y(12);
residual(21) = lhs - rhs;
lhs = y(24);
rhs = y(13)-y(25);
residual(22) = lhs - rhs;
lhs = y(25);
rhs = T(1)*y(17);
residual(23) = lhs - rhs;
lhs = y(22);
rhs = T(9);
residual(24) = lhs - rhs;
lhs = y(23);
rhs = T(9);
residual(25) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
