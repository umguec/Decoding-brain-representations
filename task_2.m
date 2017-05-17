% Task 2

%% Estimate **B** on the training set. Tip: Normally, you should use cross-
% validation to estimate lambda. For simplicity, you can assume that lambda
% = 10 ^ -6.

q      = size(Y_training, 2);
lambda = 1e-6;
B      = (Y_training' * Y_training + lambda * eye(q)) \ Y_training' * ...
    X_training;

%% Reconstruct **x** from **y** in the test set.

X_test_hat = Y_test * B;

%% Visualize the reconstructions. Tip: You can use reshape function, and
% imshow or imagesc functions.

i     = 1;
x     = reshape(X_test(i, :), 28, 28);
x_hat = reshape(X_test_hat(i, :), 28, 28);

subplot(1, 2, 1)
imshow(x);
% imagesc(x);
title('stimulus');
subplot(1, 2, 2)
imshow(x_hat);
% imagesc(x_hat);
title('reconstruction');