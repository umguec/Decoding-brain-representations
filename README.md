# Decoding-brain-representations
DONDERS (f)MRI TOOL-KIT: From Image Acquisition to Computation Model

The dataset contains fMRI data acquired from the early visual cortex of one subject

In this hands-on session, you will implement neural decoder that can reconstruct the percieved stimuli from observed brain responses.

A brief sketch of the approach

We use **x** and **y** for reffering to a stimulus-response pair, where **x** is a vector of pixels, and **y** is a vector of voxels.



Let's first familiarize ourselves with the dataset. It containes a number of variables:

X -> This is a 100 x 784 matrix. The ith row contains the pixel values that were presented in the ith trial.
Y -> This is a 100 x 3092 matrix. The ith contains the voxel values that were measured in the ith trial.

and

X_prior -> This is a 2000 x 784 matrix. Each row contains the pixel values of a different stimuli, which was not used in the experiment.


## Task

- Visualize some of the stimuli.


Let's prepare the dataset for analysis. We 


## Task


- Split X and Y in two parts called X_training and X_test, and Y_training and Y_test.
- Visualize some of the stimuli.


## Task

Recall that our goal is to solve the problem of reconstructing stimuli (**x**) from responses (**y**).

One possible approach to solve this problem is to use a *discriminative* model, which predicts **x** as a function of **y**. That is:

**x** = f(**y**)

We will assume that f is a linear function. That is:

**x** = **B'** **y**

We can estimate **B** with ridge regression. That is:

**B** = (**X**_training' **X**_training + lambda **I**) ^ -1 **X**_training' **Y**_training'

where lambda is the regularization coefficient and **I** is the identity matrix.

Note that we can safely ignore the intercept since we normalized our data to have zero mean and unit variance.

- Estimate **B**. Normally, you should use cross validation to estimate lambda. For simplicity, you can assume that lambda = 10 ^ -6.
- Reconstruct the **X**_test from **Y**_test.
- Visualize some of the reconstructions.

As you can see, the results are not very good. One reason is that we are trying to find the solution among all 28 x 28 images. That is we are not contraining the solution by using our prior knowledge that the reconstructions will have a particular form (i.e., handwritten digits). 

## Task

To do this, we have to resort to probability theory.

From a probabilistic context, our Our goal is to solve the problem of preciting **x** given **y** can be formulated as finding the most likely x given y. That is,

argmax_**x** P(**x** | **y**)

So, we have to define P(**x** | **y**) and find the **x** that maximizes P(**x** | **y**) given **y**. While, this may seem daunting, it actually has a simple solution. We use Bayes' theorem to reformulate P(**x** | **y**) as a product of P(**y** | **x**) and P(**y** | **x**)

P(**x** | **y**) ~ P(**y** | **x**) * P(**x**)

Here P(**y** | **x**) is called the likelihood: how likely is a particular response given that the stimulus was a particular image and P(x) is called the prior: how like is x For example, in this context, a face image or a white noise image will be extremely unlikely to be observed however, a letter will be quite likely and a digit will be extremely likely.

We will assume that the likelihood and the prior are multivariate Gaussian distributions. A Guassian is characterized by two parameters: a mean vector and a covraiance matrix.

In the case of the liklihood, the mean of the Gaussian is given by **B'** **x** and its covariance matrix is given by diag(E[||**y** - **B'** **x**|| ^ 2]). As before, we can estimate **B** with ridge regression. That is:

**B** = (**X**_training' **X**_training + lambda **I**) ^ -1 **X**_training' **Y**_training'

In the case of the prior, the mean of the Gaussian is given by **0** and its covariance matrix is given by **X**_prior' * **X**_prior / (n_prior - 1).

- Estimate **B**. Normally, you should use cross validation to estimate lambda and Sigma_liklihood. For simplicity, you can assume that lambda = 10 ^ -6 and Sigma_liklihood = 10 ^ -3 * **I**.
- Estimate **Sigma**_prior.
Tip: regularize Sigma_prior by adding lambda to its diagonal).
- Visualize Sigma_prior (tip: you can use imagesc function).

Now, we can obtain the posterior by multiplying the likelihood and the prior. It turns out that the product of two Gaussians is another Gaussian with the following parameters:

**mu**_posterior = 
**Sigma**_posterior = 

We are almost done. We can start reconstructing stimuli from responses if we can answer the following question:

What value of x maximizes P(x | y) = N_x(mu, Sigma)?

.
.
.
.
.
.

**mu**\_posterior = argmax_**x** P(**x** | **y**)

which was our goal! We can now plug any response in the above equation and reconstruct the most probable stimulus that could have caused that response.

## Task

- Reconstruct the stimuli in the test set.
- Visualize the reconstructions (tip: you can use reshape and imshow/imagesc functions).
- Compare the reconstructions with the earlier reconstructions.

Congratulations, you have reached the end!
