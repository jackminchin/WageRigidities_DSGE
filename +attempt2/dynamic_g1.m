function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
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
%   g1
%

if T_flag
    T = attempt2.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(25, 44);
g1(1,10)=(-exp(y(10)))/(exp(y(10))*exp(y(10)));
g1(1,35)=(-(params(15)*(-exp(y(14)-y(38)-y(35)))));
g1(1,14)=(-(params(15)*exp(y(14)-y(38)-y(35))));
g1(1,38)=(-(params(15)*(-exp(y(14)-y(38)-y(35)))));
g1(2,10)=(-T(4));
g1(2,12)=(-(exp(y(10))*exp(y(12))*getPowerDeriv(exp(y(12)),params(21)-1,1)));
g1(2,19)=exp(y(19));
g1(3,10)=exp(y(18)-y(10));
g1(3,35)=params(15)*(-exp(y(37)-y(35)));
g1(3,16)=(-(y(25)*exp(y(16))))/(exp(y(16))*exp(y(16)));
g1(3,18)=(-exp(y(18)-y(10)));
g1(3,37)=params(15)*exp(y(37)-y(35));
g1(3,25)=1/exp(y(16));
g1(4,11)=exp(y(11));
g1(4,13)=(-exp(y(20)+y(13)));
g1(4,1)=exp(y(1)+y(2)-y(21));
g1(4,2)=exp(y(1)+y(2)-y(21));
g1(4,15)=(-exp(y(15)));
g1(4,3)=(-(exp(y(18))*exp(y(3))));
g1(4,17)=(-(exp(y(18))*(-exp(y(17)))));
g1(4,18)=(-(exp(y(18))*(exp(y(3))-exp(y(17)))));
g1(4,20)=(-exp(y(20)+y(13)));
g1(4,21)=(-exp(y(1)+y(2)-y(21)));
g1(5,11)=(-1);
g1(5,13)=(-(params(21)-1));
g1(5,20)=1;
g1(6,11)=(-((-exp(y(18)-y(11)))-0.9*(-exp(y(38)+y(37)-y(14)-y(11)))));
g1(6,36)=params(16)*0.09999999999999998*(-exp(y(37)-y(36)));
g1(6,14)=0.9*(-exp(y(38)+y(37)-y(14)-y(11)));
g1(6,17)=(-(y(25)*exp(y(17))))/(exp(y(17))*exp(y(17)));
g1(6,18)=(-exp(y(18)-y(11)));
g1(6,37)=(-((-(0.9*exp(y(38)+y(37)-y(14)-y(11))))-params(16)*0.09999999999999998*exp(y(37)-y(36))));
g1(6,38)=0.9*exp(y(38)+y(37)-y(14)-y(11));
g1(6,25)=1/exp(y(17));
g1(7,25)=1;
g1(7,41)=(-1);
g1(8,14)=(-(exp(y(38))*exp(y(37))*(-(exp(y(17))*params(18)*exp(y(14))))/(exp(y(14))*exp(y(14)))));
g1(8,15)=exp(y(15));
g1(8,17)=(-T(5));
g1(8,37)=(-T(5));
g1(8,38)=(-T(5));
g1(9,12)=(-(y(26)*params(19)));
g1(9,13)=(-(1-params(19)));
g1(9,22)=1;
g1(9,26)=(-(y(12)*params(19)));
g1(10,12)=(-(1/exp(y(24))*T(7)*params(19)*exp(y(12))*getPowerDeriv(exp(y(12)),params(19)-1,1)));
g1(10,13)=(-(1/exp(y(24))*T(6)*exp(y(13))*getPowerDeriv(exp(y(13)),1-params(19),1)));
g1(10,19)=exp(y(19));
g1(10,24)=(-(T(6)*T(7)*(-exp(y(24)))/(exp(y(24))*exp(y(24)))));
g1(11,13)=1;
g1(11,20)=1;
g1(11,22)=(-1);
g1(11,24)=1;
g1(12,5)=(-0.8);
g1(12,26)=1;
g1(12,44)=(-1);
g1(13,21)=1;
g1(13,38)=(-params(15));
g1(13,24)=params(26);
g1(13,29)=(-T(8));
g1(13,30)=(-T(8));
g1(13,43)=(-1);
g1(14,1)=(-params(22));
g1(14,14)=1;
g1(14,21)=(-((1-params(22))*(1+params(23))));
g1(14,4)=(1-params(22))*params(24);
g1(14,22)=(-((1-params(22))*params(24)));
g1(14,42)=(-1);
g1(15,22)=exp(y(22));
g1(15,23)=(-exp(y(23)));
g1(16,10)=(-exp(y(10)));
g1(16,11)=(-exp(y(11)));
g1(16,23)=exp(y(23));
g1(17,16)=exp(y(16));
g1(17,17)=exp(y(17));
g1(18,27)=1;
g1(18,39)=(-params(15));
g1(18,29)=T(2);
g1(18,33)=(-(T(2)*(params(1)+params(3)/(1-params(13)))));
g1(19,28)=1;
g1(19,40)=(-params(16));
g1(19,30)=T(3);
g1(19,33)=(-(T(3)*(params(1)+params(3)/(1-params(13)))));
g1(20,21)=1;
g1(20,27)=(-1);
g1(20,6)=(-1);
g1(20,29)=1;
g1(20,8)=(-1);
g1(20,31)=1;
g1(21,21)=1;
g1(21,28)=(-1);
g1(21,7)=(-1);
g1(21,30)=1;
g1(21,9)=(-1);
g1(21,32)=1;
g1(22,22)=(-1);
g1(22,33)=1;
g1(22,34)=1;
g1(23,26)=(-T(1));
g1(23,34)=1;
g1(24,26)=(-((1-params(13)*T(1))/(1-params(13))));
g1(24,31)=1;
g1(25,26)=(-((1-params(13)*T(1))/(1-params(13))));
g1(25,32)=1;

end
