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

%% Visualize the reconstructions. Tip: You can use reshape and imagesc
% functions.

figure;

for i = 1 : 20
    x = reshape(X_test(i, :) .* sigma + mu, 28, 28);
    
    subplot(4, 5, i);
    imagesc(x);
    title('stimulus');
    
    axis off;
    axis square;
    axis tight;
end

figure;

for i = 1 : 20
    x_hat = reshape(X_test_hat(i, :) .* sigma + mu, 28, 28);
    
    subplot(4, 5, i);
    imagesc(x_hat);
    title('reconstruction');
    
    axis off;
    axis square;
    axis tight;
end