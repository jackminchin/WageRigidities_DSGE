function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
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
%   g1
%

if T_flag
    T = attempt2.static_g1_tt(T, y, x, params);
end
g1 = zeros(25, 25);
g1(1,1)=(-exp(y(1)))/(exp(y(1))*exp(y(1)))-params(15)*(-exp(y(5)-y(12)-y(1)));
g1(1,5)=(-(params(15)*exp(y(5)-y(12)-y(1))));
g1(1,12)=(-(params(15)*(-exp(y(5)-y(12)-y(1)))));
g1(2,1)=(-T(5));
g1(2,3)=(-(exp(y(1))*exp(y(3))*getPowerDeriv(exp(y(3)),params(21)-1,1)));
g1(2,10)=exp(y(10));
g1(3,1)=(-((-exp(y(9)-y(1)))-params(15)*(-exp(y(9)-y(1)))));
g1(3,7)=(-(y(16)*exp(y(7))))/(exp(y(7))*exp(y(7)));
g1(3,9)=(-(exp(y(9)-y(1))-params(15)*exp(y(9)-y(1))));
g1(3,16)=1/exp(y(7));
g1(4,2)=exp(y(2));
g1(4,4)=(-exp(y(11)+y(4)));
g1(4,5)=exp(y(5)+y(6)-y(12));
g1(4,6)=(-(exp(y(6))-exp(y(5)+y(6)-y(12))));
g1(4,11)=(-exp(y(11)+y(4)));
g1(4,12)=(-exp(y(5)+y(6)-y(12)));
g1(5,2)=(-1);
g1(5,4)=(-(params(21)-1));
g1(5,11)=1;
g1(6,2)=(-((-exp(y(9)-y(2)))-0.9*(-exp(y(12)+y(9)-y(5)-y(2)))-params(16)*0.09999999999999998*(-exp(y(9)-y(2)))));
g1(6,5)=0.9*(-exp(y(12)+y(9)-y(5)-y(2)));
g1(6,8)=(-(y(16)*exp(y(8))))/(exp(y(8))*exp(y(8)));
g1(6,9)=(-(exp(y(9)-y(2))-0.9*exp(y(12)+y(9)-y(5)-y(2))-exp(y(9)-y(2))*params(16)*0.09999999999999998));
g1(6,12)=0.9*exp(y(12)+y(9)-y(5)-y(2));
g1(6,16)=1/exp(y(8));
g1(7,16)=1;
g1(8,5)=(-(exp(y(12))*exp(y(9))*(-(exp(y(8))*params(18)*exp(y(5))))/(exp(y(5))*exp(y(5)))));
g1(8,6)=exp(y(6));
g1(8,8)=(-T(6));
g1(8,9)=(-T(6));
g1(8,12)=(-T(6));
g1(9,3)=(-(y(17)*params(19)));
g1(9,4)=(-(1-params(19)));
g1(9,13)=1;
g1(9,17)=(-(y(3)*params(19)));
g1(10,3)=(-(1/exp(y(15))*T(8)*params(19)*exp(y(3))*getPowerDeriv(exp(y(3)),params(19)-1,1)));
g1(10,4)=(-(1/exp(y(15))*T(7)*exp(y(4))*getPowerDeriv(exp(y(4)),1-params(19),1)));
g1(10,10)=exp(y(10));
g1(10,15)=(-(T(7)*T(8)*(-exp(y(15)))/(exp(y(15))*exp(y(15)))));
g1(11,4)=1;
g1(11,11)=1;
g1(11,13)=(-1);
g1(11,15)=1;
g1(12,17)=0.2;
g1(13,12)=1-params(15);
g1(13,15)=params(26);
g1(13,20)=(-T(2));
g1(13,21)=(-T(2));
g1(14,5)=1-params(22);
g1(14,12)=(-((1-params(22))*(1+params(23))));
g1(15,13)=exp(y(13));
g1(15,14)=(-exp(y(14)));
g1(16,1)=(-exp(y(1)));
g1(16,2)=(-exp(y(2)));
g1(16,14)=exp(y(14));
g1(17,7)=exp(y(7));
g1(17,8)=exp(y(8));
g1(18,18)=1-params(15);
g1(18,20)=T(3);
g1(18,24)=(-(T(3)*(params(1)+params(3)/(1-params(13)))));
g1(19,19)=1-params(16);
g1(19,21)=T(4);
g1(19,24)=(-(T(4)*(params(1)+params(3)/(1-params(13)))));
g1(20,12)=1;
g1(20,18)=(-1);
g1(21,12)=1;
g1(21,19)=(-1);
g1(22,13)=(-1);
g1(22,24)=1;
g1(22,25)=1;
g1(23,17)=(-T(1));
g1(23,25)=1;
g1(24,17)=(-((1-params(13)*T(1))/(1-params(13))));
g1(24,22)=1;
g1(25,17)=(-((1-params(13)*T(1))/(1-params(13))));
g1(25,23)=1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
