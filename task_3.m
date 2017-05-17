% Task 3

%% Estimate B on the training set. Tip: Normally, you should use
% cross-validation to estimate lambda and Sigma_liklihood. For simplicity,
% you can assume that lambda = 10 ^ -6 and Sigma_liklihood = 10 ^ -3 I.

p               = size(X_training, 2);
lambda          = 1e-6;
Sigma_liklihood = 1e-3 * eye(q);
B               = (X_training' * X_training + lambda * eye(p)) \ ...
    X_training' * Y_training;

%% Estimate Sigma_prior. Tip: Add 10 ^ -6 to the diagonal of Sigma_prior
% for regularization.

n           = length(X_prior);
Sigma_prior = (X_prior' * X_prior) / (n - 1) + 1e-6 * eye(p);

%% Visualize Sigma_prior. Tip: you can use imagesc function.

imagesc(Sigma_prior);
xlabel('pixel');
ylabel('pixel');