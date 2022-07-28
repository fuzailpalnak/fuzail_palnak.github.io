---
layout: single
title:  "Understanding The Perceptron Classifier"
excerpt: "How does Perceptron learns the decision boundary needed to 
classify the data?, What is the learning Rule and Decision for Peceptron?"
categories: machine_learning
tags: Perceptron Machine-Learning
permalink: /perceptron/

---
{% include toc title="Table of Contents" %}

{% include mathjax.html %}


The Perceptron is the simplest type of artificial neural network. It is a model of a single neuron that can
be used for two-class classification problems and provides the foundation for later developing much larger networks.


*```Before we start with Perceptron, lets go through few concept that are essential in understanding the Classifier```*

## What are HyperPlanes
	
> As defined by [Wikipedia](https://en.wikipedia.org/wiki/Hyperplane), a hyperplane is a subspace whose dimension is one less than that of its ambient space. If a space is 
3-dimensional then its hyperplanes are the 2-dimensional planes, while if the space is 2-dimensional,
its hyperplanes are the 1-dimensional lines.

Consider a ***2D*** space, the `standard equation` of hyperplane in a ***2D*** space is defined
as $ax + by + c = 0$, If the equation is simplified it results to  $y = (-a/b) x + (-c/b)$, which is noting but the
`general equation` of line with slope $-a/b$ and intercept $-c/b$, which is a ***1D*** hyperplane in a ***2D*** space,
this validates our definition of hyperplanes to be one dimension less than the ambient space

What are a, b? - they are the components of the vector, this vector has a special name called `normal vector`, 
so any hyperplane can be defined using its normal vector. One property of normal vector is, it is always perpendicular to hyperplane.

<ul>
$$
n^T * coordinates + intercept = 0 
\\\text{where; }\\\vec{n}  = \begin{bmatrix}a  \\b \end{bmatrix}\\\vec{coordinates}  =  \begin{bmatrix}x  \\y \end{bmatrix}\\\text{intercept = distance from origin}
$$
</ul>

### <span style="text-decoration:underline; color:gray">How to relate hyperplane? </span>

Consider the normal vector $\vec{n}  = \begin{bmatrix}3 \\1  \end{bmatrix}$ , now the hyperplane can be define as $3x + 1y + c = 0$
this is equivalent to a line with slope $-3$ and intercept $-c$, whose equation is given by $y = (-3) x + (-c)$

To have a deep dive in hyperplanes and how are hyperplanes formed and defined, have a look at 
[this explanation](https://www.youtube.com/watch?v=-sNDkhE2Vsk&feature=emb_logo)



##  Assumptions made by the Classifier
The assumptions the Perceptron makes is that data is `linearly separable` and the classification problem is `binary`

### <span style="text-decoration:underline; color:gray">What Does linearly separable data mean </span>

This means that there must exists a hyperplane which separates the data points in way making all the points belonging
positive class lie on one side of hyperplane and the data points belonging to negative class lie on the other side.


<div style="padding: 10px;">
<figure class="image">
  <img src="https://fuzailpalnak.github.io/assets/perceptron_files/hyperplane.png" alt="Hyperplane">
  <figcaption>Hyperplane</figcaption>
</figure>
</div>



### <span style="text-decoration:underline; color:gray">Multiple Hyperplanes</span>

Now the assumptions is that the data is linearly separable.<br />
<code>How many hyperplanes could exists which separates the data?
Just One? More than One?</code><br />
The answer is more than one, in fact infinite hyperplanes could exists if data is linearly separable, 
and perceptron finds one such hyperplane out of the many hyperplanes that exists

<div style="padding: 10px;">
<figure class="image">
  <img src="https://fuzailpalnak.github.io/assets/perceptron_files/multiple_hyperplanes.png" alt="Multiple Hyperplane">
  <figcaption>Multiple Hyperplane</figcaption>
</figure>
</div>


##  Perceptron Classifier

There are two core rules at the center of this Classifier.

### <span style="text-decoration:underline; color:gray">Decision Rule</span>
This rule checks whether the data point lies on the positive side of the hyperplane or on the negative side, it does so
by checking the <code>dot product</code> of the $\vec{w}$ with $\vec{x}$ i.e the <code>data point</code>


For simplicity the <code>bias/intercept</code> term is removed from the equation $w^T * x + b = 0$, without the <code>bias/intercept</code> term,
the hyperplane, that $w$ defines would always have to go through the origin, i.e. $w^T * x = 0$<br />
This is done so the focus is just on the working of the classifier and not have to worry about the bias term during computation

<div style="padding: 10px;">
<figure class="image">
  <img src="https://fuzailpalnak.github.io/assets/perceptron_files/classifier.png" alt="Classifier">
  <figcaption>Classifier/Decision Rule</figcaption>
</figure>
</div>

<b>How does the dot product tells whether the data point lies on the positive side of the hyper plane or negative side of hyperplane?</b><br />

Lets look at the other representation of dot product
<ul>
$$
w^T* x = \| w \|  \| x \| cos \theta\\\Theta  \propto   \text{arcos }  w^{T} * x
$$
</ul>


<div style="padding: 10px;">
<figure class="image">
  <img src="https://fuzailpalnak.github.io/assets/perceptron_files/example2.png" alt="Data Points">
  <figcaption>Data Points</figcaption>
</figure>
</div>


For all the positive points, $cos \theta$ is positive as $\Theta$ is $< 90$, and for all the negative points,
$cos \theta$ is negative as $\Theta$ is $> 90$
This could be summarized as 
<ul>
$$\text{if } w^T* x  \geq  0 \text{ then }  \Theta < 90\\\text{elif } w^T* x  <  0 \text{ then }  \Theta > 90$$
</ul>

Therefore the decision rule could be formulated as:-
<ul>
$$
prediction =\begin{cases}1 & w^T* x \geq 0\\-1 & w^T* x <  0\end{cases} 
$$

</ul>


### <span style="text-decoration:underline; color:gray">Learning Rule </span>

Now there is a rule which informs the classifier about the class the data point belongs to, using this information 
classifier can keep on updating the weight vector $w$ whenever it make a wrong prediction until a separating hyperplane is found<br />
if $y * w^T * x <= 0$ i.e the point has been misclassified hence classifier will update the vector $w$ with the update rule
$\vec{w}  = \vec{w}  + y * \vec{x}$<br />  


<b>Rule when positive class is miss classified</b><br />

$$\text{if } y = 1 \text{ then } \vec{w}  = \vec{w} + \vec{x}$$
This translates to, the classifier is trying to decrease the $\Theta$ between $w$ and the $x$<br />


<b>Rule when negative class is miss classified</b><br />

$$\text{if } y = -1 \text{ then } \vec{w}  = \vec{w} - \vec{x}$$
This translates to, the classifier is trying to increase the $\Theta$ between $w$ and the $x$<br />

<img src="https://fuzailpalnak.github.io/assets/perceptron_files/intution.png" alt="Intution">

<div style="padding: 10px;">
<figure class="image">
  <img src="https://fuzailpalnak.github.io/assets/perceptron_files/intution.png" alt="Learning Rule">
  <figcaption>Learning Rule</figcaption>
</figure>
</div>
 
### <span style="text-decoration:underline; color:gray">Dealing with the bias Term </span>

Lets deal with the <code>bias/intercept</code> which was eliminated earlier, there is a simple trick which accounts the bias
term while keeping the same computation discussed above, the trick is to absorb the bias term in weight vector $\vec{w}$,
and adding a constant term to the data point $\vec{x}$
<ul>
$$\vec{w_{adjusted}}  = \begin{bmatrix}w_{1}  \\w_{2} \\b  \end{bmatrix} \vec{x_{adjusted}}  = \begin{bmatrix}x_{1} \\x_{2} \\1  \end{bmatrix} \\w_{adjusted}^T * x_{adjusted} = 0\\w_{1}  x_{1} + w_{2}  x_{2} +b = 0\\\text{which is nothing but } w^{T} * x + b =0\\\text{therefore } w_{adjusted}^{T} * x_{adjusted} = w^{T} * x + b$$
</ul>




##  Pseudo Code
Combining the `Decision Rule` and `Learning Rule`, the perceptron classifier is derived
```python
while True:
    miss_classified = 0
    for loop over data:
        if decision_rule() <= 0:
            # Miss classified the data point and adjust the weight
            learning_rule()
            miss_classified = miss_classified + 1
    if miss_classified == 0:
        # if no miss classified then the perceptron has converged and found a hyperplane
        break
```