# Part 1: Core Concepts & Mathematical Breakdown

---

## 1. Fully Connected Neural Networks & Forward Propagation

A Fully Connected (Dense) Neural Network connects every node in layer $l-1$ to every node in layer $l$.

### Mathematical Formulation

For any layer $l \in \{1, 2, \dots, L\}$:

1. **Pre-activation (Affine transformation):**
   $$\mathbf{z}^{[l]} = \mathbf{W}^{[l]} \mathbf{a}^{[l-1]} + \mathbf{b}^{[l]}$$
2. **Post-activation:**
   $$\mathbf{a}^{[l]} = \sigma(\mathbf{z}^{[l]})$$
   where $\mathbf{a}^{[0]} = \mathbf{x}$ (the network input).

### Dissecting the Architecture from Your Slide

![[3NN.png]]
Looking at the computational graph in your image:

- **Inputs:** $\mathbf{x} = [x_1, x_2]^T$ with bias input $1$.
- **Hidden Layer 1:**
  $$h_1 = w_3(1) + w_4 x_1 + w_5 x_2 \implies t_1 = \sigma(h_1)$$
  $$h_2 = w_0(1) + w_1 x_1 + w_2 x_2 \implies t_2 = \sigma(h_2)$$
- **Hidden Layer 2:**
  $$z_1 = w_9(1) + w_{10} t_1 + w_{11} t_2 \implies v_1 = \sigma(z_1)$$
  $$z_2 = w_6(1) + w_7 t_1 + w_8 t_2 \implies v_2 = \sigma(z_2)$$
- **Output Layer:**
  Linear combination into $\hat{y}$ (here, $\hat{y} = v_1 + v_2$, or with weights $1$):
  $$\frac{\partial \hat{y}}{\partial v_1} = 1, \quad \frac{\partial \hat{y}}{\partial v_2} = 1$$

---

## 2. Activation Functions and Their Derivatives

Activation functions introduce non-linearities, allowing networks to approximate complex, non-linear functions (Universal Approximation Theorem).

### 1. Sigmoid ($\sigma$)

$$\sigma(x) = \frac{1}{1 + e^{-x}}$$

- **Derivative derivation:**
  $$\frac{d}{dx}\sigma(x) = \frac{d}{dx}(1+e^{-x})^{-1} = -(1+e^{-x})^{-2}(-e^{-x}) = \frac{1}{1+e^{-x}} \cdot \frac{e^{-x}}{1+e^{-x}} = \sigma(x)(1 - \sigma(x))$$
- **Vanishing Gradient Problem:** When $|x|$ is large, $\sigma(x) \approx 0$ or $1$, so $\sigma'(x) \approx 0$. Multiplying many derivatives near $0$ across layers causes gradients to vanish.

### 2. ReLU (Rectified Linear Unit)

$$\text{ReLU}(x) = \max(0, x), \quad \frac{d}{dx}\text{ReLU}(x) = \begin{cases} 1 & x > 0 \\ 0 & x < 0 \end{cases}$$

- **Advantage:** Constant gradient of $1$ for $x > 0$ avoids vanishing gradients; computationally trivial.

### 3. Tanh (Hyperbolic Tangent)

$$\tanh(x) = \frac{e^x - e^{-x}}{e^x + e^{-x}}, \quad \frac{d}{dx}\tanh(x) = 1 - \tanh^2(x)$$

- **Advantage:** Zero-centered output.

---

## 3. Cost Functions ($L$)

### 1. Mean Squared Error (MSE) (Regression)

$$L(\hat{y}, y_T) = \frac{1}{2}(\hat{y} - y_T)^2 \implies \frac{\partial L}{\partial \hat{y}} = \hat{y} - y_T$$

### 2. Binary Cross-Entropy (BCE) (Binary Classification)

$$L(\hat{y}, y_T) = -\Big[y_T \ln \hat{y} + (1 - y_T) \ln(1 - \hat{y})\Big] \implies \frac{\partial L}{\partial \hat{y}} = \frac{\hat{y} - y_T}{\hat{y}(1 - \hat{y})}$$

---

## 4. Backpropagation & The Multivariate Chain Rule

To compute $\frac{\partial L}{\partial w}$, we trace every forward path from parameter $w$ to the final loss $L$.

### Step-by-Step Breakdown of $\frac{\partial L}{\partial w_4}$ (From Your Slide)

In the slide, weight $w_4$ directly affects pre-activation $h_1$, which produces $t_1$. Then $t_1$ branches along **two distinct paths** to reach the loss:

- **Path A:** $t_1 \to z_2 \to v_2 \to \hat{y} \to L$
- **Path B:** $t_1 \to z_1 \to v_1 \to \hat{y} \to L$

By the chain rule for multivariate functions:
$$\frac{\partial L}{\partial w_4} = \frac{\partial L}{\partial \hat{y}} \cdot \frac{\partial \hat{y}}{\partial w_4}$$

Expanding $\frac{\partial \hat{y}}{\partial w_4}$ across both diverging paths:
$$\frac{\partial \hat{y}}{\partial w_4} = \underbrace{\frac{\partial \hat{y}}{\partial v_2}\frac{\partial v_2}{\partial z_2}\frac{\partial z_2}{\partial t_1}\frac{\partial t_1}{\partial h_1}\frac{\partial h_1}{\partial w_4}}_{\text{Path via } z_2} + \underbrace{\frac{\partial \hat{y}}{\partial v_1}\frac{\partial v_1}{\partial z_1}\frac{\partial z_1}{\partial t_1}\frac{\partial t_1}{\partial h_1}\frac{\partial h_1}{\partial w_4}}_{\text{Path via } z_1}$$

Evaluating each factor directly:

- $\frac{\partial \hat{y}}{\partial v_2} = 1$, $\frac{\partial \hat{y}}{\partial v_1} = 1$
- $\frac{\partial v_2}{\partial z_2} = \sigma'(z_2) = v_2(1 - v_2)$
- $\frac{\partial v_1}{\partial z_1} = \sigma'(z_1) = v_1(1 - v_1)$
- $\frac{\partial z_2}{\partial t_1} = \frac{\partial}{\partial t_1}(w_6 + w_7 t_1 + w_8 t_2) = w_7$
- $\frac{\partial z_1}{\partial t_1} = \frac{\partial}{\partial t_1}(w_9 + w_{10} t_1 + w_{11} t_2) = w_{10}$
- $\frac{\partial t_1}{\partial h_1} = \sigma'(h_1) = t_1(1 - t_1)$
- $\frac{\partial h_1}{\partial w_4} = \frac{\partial}{\partial w_4}(w_3 + w_4 x_1 + w_5 x_2) = x_1$

Factoring out common terms $\frac{\partial t_1}{\partial h_1}\frac{\partial h_1}{\partial w_4}$:
$$\frac{\partial \hat{y}}{\partial w_4} = \Big[ 1 \cdot v_2(1 - v_2) \cdot w_7 + 1 \cdot v_1(1 - v_1) \cdot w_{10} \Big] \cdot t_1(1 - t_1) \cdot x_1$$

---

## 5. Gradient Descent vs. Momentum

### 1. Standard Gradient Descent (GD)

$$\mathbf{w}^{k+1} = \mathbf{w}^k - \alpha_k \nabla g(\mathbf{w}^k)$$

- **Weakness:** In ravines (areas where the surface curves much more steeply in one direction than another), GD oscillates wildly perpendicular to the valley while making very slow progress toward the minimum.

### 2. Gradient Descent with Momentum

$$\mathbf{w}^{k+1} = \mathbf{w}^k - \alpha_k \nabla g(\mathbf{w}^k) + \beta (\mathbf{w}^k - \mathbf{w}^{k-1})$$

#### **Alternative (Velocity) Formulation:**

Let the velocity vector be $\mathbf{v}^k = \mathbf{w}^k - \mathbf{w}^{k-1}$. Then:
$$\mathbf{v}^{k+1} = \beta \mathbf{v}^k - \alpha_k \nabla g(\mathbf{w}^k)$$
$$\mathbf{w}^{k+1} = \mathbf{w}^k + \mathbf{v}^{k+1}$$

#### **Mathematical Mechanics & Intuition:**

- **$\beta \in [0, 1)$ (typically $0.9$):** Momentum parameter (friction coefficient).
- **$\mathbf{w}^k - \mathbf{w}^{k-1}$:** The previous step taken.
- **Why it works:**
  - **Cancels Oscillations:** In directions where gradients alternate signs ($+ / - / + / -$), the history terms add up and cancel out.
  - **Accelerates Along Plateaus:** In directions where gradients persistently point the same way, velocities accumulate:
    $$\text{Terminal velocity factor} \approx \frac{1}{1 - \beta}$$
    For $\beta = 0.9$, progress along a flat gradient is up to $10\times$ faster than standard GD!
  - **Escaping Shallow Local Minima:** Kinetic energy carries the weights over small local bumps/ridges.

---

# Part 2: Practice Exam Problems & Solutions

---

### **Exam Problem 1: Manual Forward and Backward Pass with Sigmoid**

#### **Problem**

Consider a simplified 2-layer network with one input $x$, one hidden neuron $h = w_1 x + b_1$, activation $a = \sigma(h)$, and output $\hat{y} = w_2 a + b_2$. The cost function is MSE:
$$L = \frac{1}{2}(\hat{y} - y_T)^2$$
Given:

- Input $x = 1.0$, Target $y_T = 0.0$
- Current parameters: $w_1 = 2.0, b_1 = -1.0, w_2 = 3.0, b_2 = -1.5$
- Learning rate $\alpha = 0.5$

1. Compute the forward pass values for $h, a, \hat{y}$, and $L$. (Use $\sigma(1) \approx 0.731$).
2. Compute the exact gradients $\frac{\partial L}{\partial w_2}$ and $\frac{\partial L}{\partial w_1}$.
3. Perform one step of Gradient Descent update for $w_1$ and $w_2$.

---

#### **Solution**

#### **1. Forward Pass**

- $h = w_1 x + b_1 = (2.0)(1.0) + (-1.0) = 1.0$
- $a = \sigma(h) = \sigma(1.0) \approx 0.731$
- $\hat{y} = w_2 a + b_2 = (3.0)(0.731) - 1.5 = 2.193 - 1.5 = 0.693$
- Cost:
  $$L = \frac{1}{2}(0.693 - 0)^2 = \frac{1}{2}(0.4802) \approx 0.240$$

#### **2. Backward Pass (Chain Rule)**

- Output error signal:
  $$\delta_{\text{out}} = \frac{\partial L}{\partial \hat{y}} = \hat{y} - y_T = 0.693 - 0 = 0.693$$
- Gradient for $w_2$:
  $$\frac{\partial L}{\partial w_2} = \frac{\partial L}{\partial \hat{y}} \cdot \frac{\partial \hat{y}}{\partial w_2} = \delta_{\text{out}} \cdot a = (0.693)(0.731) \approx \mathbf{0.5065}$$
- Gradient for $w_1$:
  $$\frac{\partial L}{\partial w_1} = \frac{\partial L}{\partial \hat{y}} \cdot \frac{\partial \hat{y}}{\partial a} \cdot \frac{\partial a}{\partial h} \cdot \frac{\partial h}{\partial w_1}$$
  - $\frac{\partial \hat{y}}{\partial a} = w_2 = 3.0$
  - $\frac{\partial a}{\partial h} = a(1 - a) = 0.731(1 - 0.731) = 0.731 \times 0.269 \approx 0.1966$
  - $\frac{\partial h}{\partial w_1} = x = 1.0$
    $$\frac{\partial L}{\partial w_1} = (0.693) \cdot (3.0) \cdot (0.1966) \cdot (1.0) \approx \mathbf{0.4087}$$

#### **3. Parameter Updates**

- $w_2^{\text{new}} = w_2 - \alpha \frac{\partial L}{\partial w_2} = 3.0 - (0.5)(0.5065) = 3.0 - 0.2533 = \mathbf{2.7467}$
- $w_1^{\text{new}} = w_1 - \alpha \frac{\partial L}{\partial w_1} = 2.0 - (0.5)(0.4087) = 2.0 - 0.2044 = \mathbf{1.7956}$

---

### **Exam Problem 2: Numerical Calculation with Momentum**

#### **Problem**

Consider the scalar objective function:
$$g(w) = 3w^2 - 12w + 5$$
We optimize $g(w)$ using the momentum update rule:
$$w^{k+1} = w^k - \alpha \nabla g(w^k) + \beta (w^k - w^{k-1})$$
Given:

- Learning rate $\alpha = 0.1$
- Momentum factor $\beta = 0.8$
- Starting positions: $w^0 = 5.0$, and before the start assume $w^{-1} = 5.0$ (initial momentum is zero).

1. State the gradient function $\nabla g(w)$.
2. Calculate the value of $w^1$ at iteration $k = 0$.
3. Calculate the value of $w^2$ at iteration $k = 1$.
4. Show how the momentum term altered $w^2$ compared to standard Gradient Descent without momentum.

---

#### **Solution**

#### **1. Gradient Function**

$$\nabla g(w) = \frac{d}{dw}(3w^2 - 12w + 5) = 6w - 12$$

#### **2. Iteration $k=0$ (computing $w^1$)**

- Gradient at $w^0 = 5.0$:
  $$\nabla g(w^0) = 6(5.0) - 12 = 30 - 12 = 18.0$$
- Previous step difference:
  $$w^0 - w^{-1} = 5.0 - 5.0 = 0$$
- Update:
  $$w^1 = w^0 - \alpha \nabla g(w^0) + \beta(w^0 - w^{-1})$$
  $$w^1 = 5.0 - (0.1)(18.0) + 0.8(0) = 5.0 - 1.8 = \mathbf{3.2}$$

#### **3. Iteration $k=1$ (computing $w^2$)**

- Gradient at $w^1 = 3.2$:
  $$\nabla g(w^1) = 6(3.2) - 12 = 19.2 - 12 = 7.2$$
- Previous step difference:
  $$w^1 - w^0 = 3.2 - 5.0 = -1.8$$
- Momentum term contribution:
  $$\beta(w^1 - w^0) = 0.8(-1.8) = -1.44$$
- Update:
  $$w^2 = w^1 - \alpha \nabla g(w^1) + \beta(w^1 - w^0)$$
  $$w^2 = 3.2 - (0.1)(7.2) + (-1.44) = 3.2 - 0.72 - 1.44 = \mathbf{1.04}$$

#### **4. Comparison with Standard GD**

- Without momentum ($\beta = 0$):
  $$w^2_{\text{standard}} = 3.2 - (0.1)(7.2) = 3.2 - 0.72 = \mathbf{2.48}$$
- Optimal point:
  $$6w^* - 12 = 0 \implies w^* = 2.0$$
- **Analysis:**
  - Without momentum, standard GD moved from $5.0 \to 3.2 \to 2.48$ (still above the minimum $2.0$).
  - With momentum, the accumulated velocity carried the search from $3.2 \to 1.04$, taking a much larger stride downhill and temporarily overshooting past $2.0$, demonstrating how momentum preserves kinetic energy.
