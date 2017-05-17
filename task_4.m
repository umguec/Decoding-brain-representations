% Task 4

%% Reconstruct x from y in the test set.

X_test_hat = (B' + Sigma_liklihood / B * Sigma_prior) \ Y_test';

%% Visualize the reconstructions. Tip: You can use reshape function, and
% imshow or imagesc functions.

i     = 2;
x     = reshape(X_test(i, :), 28, 28);
x_hat = reshape(X_test_hat(:, i), 28, 28);

subplot(1, 2, 1)
imshow(x);
% imagesc(x);
title('stimulus');
subplot(1, 2, 2)
imshow(x_hat);
% imagesc(x_hat);
title('reconstruction');

%% Compare the reconstructions with the earlier reconstructions.