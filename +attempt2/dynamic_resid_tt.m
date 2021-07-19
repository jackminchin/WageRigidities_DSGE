function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double  vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double  vector of endogenous variables in the order stored
%                                                    in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double  matrix of exogenous variables (in declaration order)
%                                                    for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double  vector of steady state values
%   params        [M_.param_nbr by 1]        double  vector of parameter values in declaration order
%   it_           scalar                     double  time period for exogenous variables for which
%                                                    to evaluate the model
%
% Output:
%   T           [#temp variables by 1]       double  vector of temporary terms
%

assert(length(T) >= 9);

T(1) = (1+params(3))/(params(13)+params(3)+(1-params(13))*params(1));
T(2) = (1-params(10))*(1-params(15)*params(10))/(params(10)*(1+params(3)*params(7)));
T(3) = (1-params(11))*(1-params(11)*params(16))/((1+params(3)*params(7))*params(11));
T(4) = exp(y(10))*exp(y(12))^(params(21)-1);
T(5) = exp(y(17))*params(18)/exp(y(14))*exp(y(37))*exp(y(38));
T(6) = params(19)*exp(y(12))^(params(19)-1);
T(7) = exp(y(13))^(1-params(19));
T(8) = (1-params(13))/(1-params(13)+params(13)*params(14))*(1-params(5))*(1-params(5)*params(15))/params(5);
T(9) = 1-params(13)+y(26)*(1-params(13)*T(1))/(1-params(13));

end
