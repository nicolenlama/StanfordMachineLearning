function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%

delta(:,1) = log(sigmoid(X*theta));
delta(:,2) = log(1-(sigmoid(X*theta)));
tempy(:,1) = -y;
tempy(:,2) = 1-y;
delta_full = delta.*tempy;

% Formula for cost function. Note theta0 not involved in reglarization
J = (1/m)*(sum(delta_full(:,1))-sum(delta_full(:,2)));

% Compute gradient 
% theta0 not calclated with regularization
grad(1,1) = (1/m)*sum((sigmoid(X*theta)-y).*X(:,1)); 
grad(2:end,1)=((1/m)*((sigmoid(X*theta)-y)'*X(:,2:end)))

%'+(lambda/m)*theta(2:end);

grad = grad(:);

% J = (1/m)*(-sum(log(sigmoid(X*grad)))-sum(log(sigmoid(X*grad))));


    % =========================================================
fprintf('%f\n', J);

end

