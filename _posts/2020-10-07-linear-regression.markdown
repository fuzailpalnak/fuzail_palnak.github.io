---
layout: single
title:  "Linear Regression"
excerpt: "Understanding Linear Regression, how it works and the assumption made by the algorithm on the data 
that needs to be satisfied for it to work"
categories: machine_learning
tags: Linear Regression
permalink: /linear-regression/
---

{% include toc title="Table of Contents" %}

{% include mathjax.html %}

## What is Regression

Regression is a machine learning technique that allows to predict a continuous outcome 
variable $Y$ based on the value of one or multiple predictor variables $X$. 

Briefly, the goal of regression model is to build a mathematical equation that defines $Y$ as a function of 
$f(  x_{1}, x_{2}, \ldots , x_{n})$

## What assumption is made by linear regression

<div style="padding: 10px;">
<figure class="image">
  <img src="https://raw.githubusercontent.com/fuzailpalnak/ML-Scratch/master/regression/linear/images/error.png" alt="error">
  <figcaption>Error term</figcaption>
</figure>
</div>


Assumption made on the *data* is, it is drawn from a line $w^{T} x + b$ and for each data point $x_{i}$, the label $y_{i}$
is drawn from a Gaussian with mean $w^{T} x_{i} + b$ with variance $\sigma^2$ and the task of linear regression is
to estimate $w$ for the data.

To formulate it mathematically,
$$y_{i} = w^{T} x_{i} + b +  \epsilon_{i} \\ \text{where } \epsilon_{i}  \sim N(0, \sigma^2)$$

therefore,
$$ y_i|\mathbf{x}_i \sim N(\mathbf{w}^\top\mathbf{x}_i, \sigma^2) \Rightarrow P(y_i|\mathbf{x}_i,\mathbf{w})=\frac{1}{\sqrt{2\pi\sigma^2}}e^{-\frac{(\mathbf{x}_i^\top\mathbf{w}-y_i)^2}{2\sigma^2}}$$

Label $y_{i}$ for every data point is drawn from a Gaussian with mean $w^{T} x_{i}$ and variance $\sigma^2$

<div style="padding: 10px;">
<figure class="image">
  <img src="https://user-images.githubusercontent.com/24665570/95292953-2391c280-0890-11eb-8a76-cee857fdaa09.png" alt="label">
  <figcaption>Data drawing Process</figcaption>
</figure>
</div>


## Loss Functions

Loss function that will be covered for solving linear regression *squared loss*, *absolute loss* and *huber loss*,
_for implementation in python, visit [loss_python](https://github.com/fuzailpalnak/ML-Scratch/tree/master/regression/linear)_

### <span style="text-decoration:underline; color:gray">Squared Loss </span>

Squared loss is defined as $(w^{T} x - y)^2$

- Due quadratic relation, loss function applies high penalty for predictions which are far away from the true label, this is the major reason 
the square loss focuses more on outlier, this means if there is an outlier present in the data
the loss will try its best to get the outlier point right, even if the loss has to compromise on other data points, as 
reducing the error on the outlier will reduce the loss significantly


Input Data with Outlier            |  Output
:-------------------------:|:-------------------------:
![failsqd](https://user-images.githubusercontent.com/24665570/95306603-3d89d000-08a5-11eb-9b04-6d540d8cda98.png) |  ![failsqo](https://user-images.githubusercontent.com/24665570/95306677-56928100-08a5-11eb-86ce-1bcea8090ca7.png)

- To put it in simpler way, square loss estimates the mean of the data, hence, even if there is a single outlier, it will affect the estimate.


### <span style="text-decoration:underline; color:gray">Absolute Loss </span>

Absolute loss is defined as abs($w^Tx - y$)

- The problem of squared loss focusing on outlier is solved by absolute loss, as the loss function treats all point 
equally, the update rule is same no matter how much away the prediction is from true label
 
Input Data with Outlier            |  Output
:-------------------------:|:-------------------------:
![absfaild](https://user-images.githubusercontent.com/24665570/95307406-37482380-08a6-11eb-9db7-d2edfeb9c02a.png)|  ![absfail_o](https://user-images.githubusercontent.com/24665570/95307414-3a431400-08a6-11eb-96e4-8275ab88d3a6.png)

- It is clear that, absolute loss estimates the median, hence, outlier have very little impact on the estimate
- The problem with absolute loss is, its not differentiable at zero

### <span style="text-decoration:underline; color:gray">Huber Loss </span>

Huber loss is defined as 
$$loss =\begin{cases}\text{squared loss} & ( | w^Tx |  - y) < \text{delta}\\\text{absolute loss} & \text{otherwise}\end{cases} $$

- The properties of both *squared loss* and *absolute loss* are incorporated by *huber loss*, Its a switch loss,
as it switches from *absolute loss* to *squared loss* after a certain specified threshold $delta$

