# Decoding-brain-representations
DONDERS (f)MRI TOOL-KIT: From Image Acquisition to Computation Model

In this hands-on session, you will implement a neural decoder for reconstructing stimuli from responses. We will use a dataset, which was used in the following papers:

[1]  
[2]  
[3]  
[4]  


A brief sketch of the approach

We use **x** and **y** for reffering to a stimulus-response pair, where **x** is a vector of pixels, and **y** is a vector of voxels.

The dataset contains fMRI data acquired from the early visual cortex of one subject while the subject was presented with grayscale images of handwritten sixes and nines.

Let's first familiarize ourselves with the dataset. It containes a number of variables:

X -> This is a 100 x 784 matrix. The ith row contains the pixel values of the stimulus that was presented in the ith trial of the experiment.

Y -> This is a 100 x 3092 matrix. The ith row contains the voxel values of the responses that were measured in the ith trial of the experiment.

and

X_prior -> This is a 2000 x 784 matrix. Each row contains the pixel values of a different stimulus, which was not used in the experiment.

Note that the trials are not in their original order.

Let's prepare the dataset for analysis. We 

## Task

- Split X and Y in two parts called X_training and X_test, and Y_training and Y_test.
- Visualize some of the stimuli in the training set, test set and the prior set. Tip: You can use reshape and imshow/imagesc functions.

---

Recall that our goal is to solve the problem of reconstructing **x** from **y**.

One possible approach to solve this problem is to use a *discriminative* model, which predicts **x** as a function of **y**. That is:

**x** = f(**y**)

We will assume that f is a linear function. That is:

**x** = **B'** **y**

We can estimate **B** with ridge regression. That is:

**B** = (**Y**_training' **Y**_training + lambda **I**) ^ -1 **Y**_training' **X**_training'

where lambda is the regularization coefficient, **I** is the *p* x *p* identity matrix, and *p* is the number of voxels.

Note that we can safely ignore the intercept since we normalized our data to have zero mean and unit variance.

## Task

- Estimate **B**. Tip: Normally, you should use cross validation to estimate lambda. For simplicity, you can assume that lambda = 10 ^ -6.
- Reconstruct **X**_test from **Y**_test.
- Visualize some of the reconstructions. Tip: You can use reshape and imshow/imagesc functions.

---

As you can see, the results are not very good. One reason is that we are trying to find the solution among all 28 x 28 images. That is we are not contraining the solution by using our prior knowledge that the reconstructions will have a particular form (i.e., handwritten digits). 

To do this, we have to resort to probability theory. We reformulate our goal as finding the most probable **x** that could have caused **y**. That is:

argmax_**x** P(**x** | **y**)

So, we have to define P(**x** | **y**) and find the **x** that maximizes P(**x** | **y**) given **y**. While, this may seem daunting, it actually has a simple solution. We use Bayes' theorem to reformulate P(**x** | **y**) as a product of P(**y** | **x**) and P(**y** | **x**)

P(**x** | **y**) ~ P(**y** | **x**) * P(**x**)

Here P(**y** | **x**) is called the likelihood: how likely is a particular response given that the stimulus was a particular image and P(x) is called the prior: how like is x For example, in this context, a face image or a white noise image will be extremely unlikely to be observed however, a letter will be quite likely and a digit will be extremely likely.

We will assume that the likelihood and the prior are multivariate Gaussian distributions. A Guassian is characterized by two parameters: a mean vector and a covraiance matrix.

In the case of the liklihood, the mean of the Gaussian is given by **B'** **x** and its covariance matrix is given by diag(E[||**y** - **B'** **x**|| ^ 2]). As before, we can estimate **B** with ridge regression. That is:

**B** = (**X**_training' **X**_training + lambda **I**) ^ -1 **X**_training' **Y**_training'

In the case of the prior, the mean of the Gaussian is given by **0** and its covariance matrix is given by **X**_prior' * **X**_prior / (n_prior - 1).

## Task

- Estimate **B**. Tip: Normally, you should use cross-validation to estimate lambda and Sigma_liklihood. For simplicity, you can assume that lambda = 10 ^ -6 and Sigma_liklihood = 10 ^ -3 **I**.
- Estimate **Sigma**\_prior. Tip: Add 10 ^ -6 to the diagonal of Sigma_prior).
- Visualize Sigma_prior Tip: you can use imagesc function.

---

Now, we can obtain the posterior by multiplying the likelihood and the prior. It turns out that the product of two Gaussians is another Gaussian whose mean vector is given by:

We are almost done. We can start reconstructing stimuli from responses if we can answer the following question:

Question: What **x** maximizes P(**x** | **y**) considerig that P(**x** | **y**) is a Guassian?

.  
.  
.  
.  
.  
.  

Answer: **mu**\_posterior

which was our goal! That is:
 
**mu**\_posterior = argmax_**x** P(**x** | **y**)

We can now plug any **y** in the above equation and reconstruct the most probable **x** that could have caused it.

## Task

- Reconstruct the stimuli in the test set.
- Visualize the reconstructions (tip: you can use reshape and imshow/imagesc functions).
- Compare the reconstructions with the earlier reconstructions.

---

Congratulations, you have reached the end!
