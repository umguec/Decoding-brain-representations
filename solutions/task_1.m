% Task 1

%% Load the dataset.

load('69dataset2.mat');

%% Visualize some of the stimuli. Tip: You can use reshape and imagesc
% functions.

figure;

for i = 1 : 10
    x = reshape(X(i, :) .* sigma + mu, 28, 28);
    
    subplot(4, 5, i);
    imagesc(x);
    title('stimulus');
    
    axis off;
    axis square;
    axis tight;
end

for i = 11 : 20
    x = reshape(X(i + 50, :) .* sigma + mu, 28, 28);
    
    subplot(4, 5, i);
    imagesc(x);
    title('stimulus');
    
    axis off;
    axis square;
    axis tight;
end

%% Normalize X and Y to have zero mean and unit variance. Tip: Recall that
% normalization means subtracting the mean of each pixel/voxel from itself
% and dividng it by its standard deviation. You can use zscore function.

[X, mu, sigma] = zscore(X);
X_prior        = zscore(X_prior);
Y              = zscore(Y);

%% Split X and Y in two parts called X_training and X_test, and Y_training
% and Y_test. The training set should contain 80 stimulus-response pairs
% (40 pairs for sixes and 40 pairs for nines). The test set should contain
% 20 stimulus-response pairs (10 pairs for sixes and 10 pairs for nines).

X_training = X([1 : 40 51 : 90], :);
X_test     = X([41 : 50 91 : end], :);
Y_training = Y([1 : 40 51 : 90], :);
Y_test     = Y([41 : 50 91 : end], :);