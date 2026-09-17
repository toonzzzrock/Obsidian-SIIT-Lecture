### 1. Mathematical Formulations & Derivations

Both algorithms aim to find a stationary point (a local or global minimum) where $\nabla g(\mathbf{w}) = \mathbf{0}$.

#### **A. Gradient Descent (First-Order Method)**

- **Update Rule:**
  $$\mathbf{w}^k = \mathbf{w}^{k-1} - \alpha \nabla g(\mathbf{w}^{k-1})$$

---

#### **B. Newton's Method (Second-Order Method)**

- **Update System:**
  $$\mathbf{w}^k = \mathbf{w}^{k-1} - \big[\nabla^2 g(\mathbf{w}^{k-1})\big]^{-1} \nabla g(\mathbf{w}^{k-1})$$

---

### 2. Side-by-Side Comparison

Let's look at the scalar quadratic function from your first and fourth slides:
$$g(w) = w^2 - 4w + 1$$

- First derivative (gradient): $\nabla g(w) = 2w - 4$
- Second derivative (Hessian): $\nabla^2 g(w) = 2$
- True minimum: $2w - 4 = 0 \implies w^* = 2$
- Starting point: $w^0 = 9$

---

#### **Walkthrough: Gradient Descent ($\alpha = 0.1$)**

$$\text{Update: } w^k = w^{k-1} - 0.1(2w^{k-1} - 4) = 0.8w^{k-1} + 0.4$$

| Step $k$  | Current $w^{k-1}$ | Gradient $\nabla g(w^{k-1}) = 2w^{k-1}-4$ |  Next $w^k = w^{k-1} - 0.1 \nabla g$   |
| :-------: | :---------------: | :---------------------------------------: | :------------------------------------: |
| **$k=1$** |     $w^0 = 9$     |              $2(9) - 4 = 14$              |      $9 - 0.1(14) = \mathbf{7.6}$      |
| **$k=2$** |    $w^1 = 7.6$    |            $2(7.6) - 4 = 11.2$            |   $7.6 - 0.1(11.2) = \mathbf{6.48}$    |
| **$k=3$** |   $w^2 = 6.48$    |           $2(6.48) - 4 = 8.96$            |  $6.48 - 0.1(8.96) = \mathbf{5.584}$   |
| **$k=4$** |   $w^3 = 5.584$   |          $2(5.584) - 4 = 7.168$           | $5.584 - 0.1(7.168) = \mathbf{4.8672}$ |
|  $\dots$  |      $\dots$      |                  $\dots$                  |    Converges gradually to $w^* = 2$    |

---

#### **Walkthrough: Newton's Method**

$$\text{Solve: } 2w^k = 2w^{k-1} - (2w^{k-1} - 4) = 4 \implies w^k = 2$$

| Step $k$  | Current $w^{k-1}$ |        $\nabla g(w^{k-1})$         | $\nabla^2 g(w^{k-1})$ |        Solve $2w^k = 2w^{k-1} - \nabla g$        |
| :-------: | :---------------: | :--------------------------------: | :-------------------: | :----------------------------------------------: |
| **$k=1$** |     $w^0 = 9$     |                $14$                |          $2$          | $2w^1 = 2(9) - 14 = 4 \implies \mathbf{w^1 = 2}$ |
| **$k=2$** |     $w^1 = 2$     | $2(2) - 4 = \mathbf{0}$ **(STOP)** |          $2$          | $2w^2 = 2(2) - 0 = 4 \implies \mathbf{w^2 = 2}$  |

---

### 3. Vector Input: General Quadratic Function

As shown in your second slide:
$$g(\mathbf{w}) = \frac{1}{2}\mathbf{w}^T \mathbf{Q} \mathbf{w} + \mathbf{r}^T \mathbf{w} + d \quad (\mathbf{Q} \text{ symmetric, positive definite})$$

1. **Gradient:**
   $$\nabla g(\mathbf{w}) = \mathbf{Q}\mathbf{w} + \mathbf{r}$$
2. **Hessian:**
   $$\nabla^2 g(\mathbf{w}) = \mathbf{Q}$$
3. **Newton Step:**
   $$\nabla^2 g(\mathbf{w}^{k-1})\,\mathbf{w}^k = \nabla^2 g(\mathbf{w}^{k-1})\,\mathbf{w}^{k-1} - \nabla g(\mathbf{w}^{k-1})$$
   $$\mathbf{Q}\,\mathbf{w}^k = \mathbf{Q}\mathbf{w}^{k-1} - (\mathbf{Q}\mathbf{w}^{k-1} + \mathbf{r}) = -\mathbf{r}$$
   $$\mathbf{w}^k = -\mathbf{Q}^{-1}\mathbf{r}$$

Because the quadratic Taylor model is **exact** for any quadratic function, Newton's method computes the exact analytical minimum in **1 single step**.

---

### 4. Non-Convex Functions & Challenges (Slide 3)

When optimizing complex surfaces such as:
$$g(\mathbf{w}) = -\cos(2\pi \mathbf{w}^T\mathbf{w}) + 2\mathbf{w}^T\mathbf{w}$$

1. **Local Minima vs. Global Minimum:**
   - Starting at $\mathbf{w}^0 = [0.85,\, 0.85]^T$ traps gradient descent in an outer **local minimum** valley.
   - Starting at $\mathbf{w}^0 = [-0.7,\, 0]^T$ allows the optimizer to slide into the deeper **global minimum**.

2. **How Newton's Method Behaves on Non-Convex Surfaces:**
   - If $\nabla^2 g(\mathbf{w})$ is **not positive definite** (e.g., negative eigenvalues near a saddle point or local maximum), Newton's method can step **uphill** towards local maxima or diverge.

---

### 5. Summary: GD vs. Newton's Method

| Feature              | Gradient Descent (GD)                                                 | Newton's Method                                                                                                        |
| :------------------- | :-------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------- |
| **Order**            | 1st-order ($\nabla g$)                                                | 2nd-order ($\nabla g$ and $\nabla^2 g$)                                                                                |
| **Update formula**   | $\mathbf{w}^k = \mathbf{w}^{k-1} - \alpha \nabla g(\mathbf{w}^{k-1})$ | $\nabla^2 g(\mathbf{w}^{k-1})\mathbf{w}^k = \nabla^2 g(\mathbf{w}^{k-1})\mathbf{w}^{k-1} - \nabla g(\mathbf{w}^{k-1})$ |
| **Hyperparameter**   | Needs learning rate $\alpha$ tuning                                   | Pure Newton has no step-size parameter                                                                                 |
| **Convergence rate** | Linear convergence (slow near minimum)                                | **Quadratic convergence** (extremely fast near minimum)                                                                |
