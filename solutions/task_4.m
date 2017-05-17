% Task 4

%% Reconstruct x from y in the test set.

X_test_hat = (inv(Sigma_prior) + B / Sigma_liklihood * B') \ B / ...
    Sigma_liklihood * Y_test';
X_test_hat = X_test_hat';

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

%% Compare the reconstructions with the earlier reconstructions.