# 1. Fundamental RNN Theory & Sequence Modeling

### Why Standard Feedforward Networks Fail on Sequences (Slides 5–6)

A standard Multi-Layer Perceptron (MLP) cannot model sequences effectively due to four core structural flaws:

1. **Inability to handle variable-length sequences:** MLPs require a fixed-dimensional input vector $\mathbf{x} \in \mathbb{R}^D$. Sequences in language or time series vary dynamically in length $\tau$. Truncating or zero-padding forces arbitrary limits and wastes computation.
2. **Lack of parameter sharing across time:** An MLP learns separate weights for each input index. If the model learns that `"2009"` is a temporal entity at position 2 (_"In 2009, I went to Nepal"_), it cannot transfer that knowledge to position 6 (_"I went to Nepal in 2009"_). It must relearn language rules independently at every temporal position.
3. **Loss of temporal ordering:** Order carries crucial syntax and semantics. MLPs cannot intrinsically represent sequential precedence without ad-hoc positional encodings.
4. **Inability to retain long-term memory:** Feedforward networks lack persistent internal states to hold context across arbitrary time delays.

---

### The Dynamical System Perspective (Slides 12–17)

An RNN formalizes sequence processing by adapting the classical mathematical framework of a **discrete-time dynamical system**:

- **Autonomous (Isolated) Dynamical System:**
  $$s^{(t)} = f\left(s^{(t-1)};\, \boldsymbol{\theta}\right)$$
  Information in this system does not grow; it decays or stays constant: $\mathcal{H}_t \subset \mathcal{H}_{t-1}$.

- **Driven Dynamical System (Driven by External Signal $\mathbf{x}^{(t)}$):**
  $$h^{(t)} = f\left(h^{(t-1)}, \, \mathbf{x}^{(t)}; \, \boldsymbol{\theta}\right)$$
  Information in the hidden state is bounded by the joint information of the past state and the current input:
  $$\mathcal{H}_t \subset \mathfrak{S}\left(\mathcal{H}_{t-1} \cup \mathcal{I}_t\right)$$

---

### Unfolding the Computational Graph

By recursively substituting $h^{(t-1)}$ into $h^{(t)}$:
$$h^{(t)} = f\big(f(h^{(t-2)}, \mathbf{x}^{(t-1)}; \boldsymbol{\theta}), \mathbf{x}^{(t)}; \boldsymbol{\theta}\big) = g^{(t)}\left(\mathbf{x}^{(t)}, \mathbf{x}^{(t-1)}, \dots, \mathbf{x}^{(1)}\right)$$

- **The Core Invariance:** Regardless of sequence length $\tau$, the model maintains a constant number of parameters because transition function $f$ and weight matrices ($U, W, V$) are shared across all time steps.

---

# 2. Forward Propagation in Standard RNNs (Slide 20)

At each time step $t \in \{1, \dots, \tau\}$:

$$
\begin{aligned}
\mathbf{a}^{(t)} &= \mathbf{b} + \mathbf{W}\mathbf{h}^{(t-1)} + \mathbf{U}\mathbf{x}^{(t)} && \text{(Hidden pre-activation)} \\
\mathbf{h}^{(t)} &= \tanh\left(\mathbf{a}^{(t)}\right) && \text{(Hidden state activation)} \\
\mathbf{o}^{(t)} &= \mathbf{c} + \mathbf{V}\mathbf{h}^{(t)} && \text{(Output logits)} \\
\hat{\mathbf{y}}^{(t)} &= \text{softmax}\left(\mathbf{o}^{(t)}\right) \quad \text{or} \quad \hat{\mathbf{y}}^{(t)} = \mathbf{o}^{(t)} && \text{(Prediction: Classification vs. Regression)}
\end{aligned}
$$

### Weight Matrix Dimensions:

- $\mathbf{U} \in \mathbb{R}^{d_h \times d_{\text{in}}}$: Input-to-hidden weights
- $\mathbf{W} \in \mathbb{R}^{d_h \times d_h}$: Hidden-to-hidden recurrent weights
- $\mathbf{V} \in \mathbb{R}^{d_{\text{out}} \times d_h}$: Hidden-to-output weights
- $\mathbf{b} \in \mathbb{R}^{d_h}$: Hidden bias vector
- $\mathbf{c} \in \mathbb{R}^{d_{\text{out}}}$: Output bias vector

---

### Sequence Loss Formulation (Slide 21)

For sequential classification, the total sequence loss is the sum of cross-entropy losses across all steps:
$$L = \sum_{t=1}^\tau L^{(t)} = -\sum_{t=1}^\tau \log p_{\text{model}}\left(y^{(t)} \mid \mathbf{x}^{(1)}, \dots, \mathbf{x}^{(t)}\right)$$

For sequential mean squared error (regression):
$$L = \sum_{t=1}^\tau L^{(t)} = \frac{1}{2} \sum_{t=1}^\tau \|\mathbf{y}^{(t)} - \mathbf{z}^{(t)}\|^2$$

---

# 3. Keras `SimpleRNN` Parameter Calculations (Slides 27–28)

Given a `SimpleRNN` layer with:

- $d_{\text{in}}$ = input feature dimension per time step
- $d_h$ = number of hidden units (`units`)

### The Master Parameter Formula:

$$\text{Params}_{\text{SimpleRNN}} = \mathbf{W}_{\text{input}} + \mathbf{W}_{\text{recurrent}} + \mathbf{b}_{\text{hidden}}$$
$$\text{Params}_{\text{SimpleRNN}} = (d_{\text{in}} \times d_h) + (d_h \times d_h) + d_h = \mathbf{d_h(d_{\text{in}} + d_h + 1)}$$

---

### Step-by-Step Code Example from Class Slides:

```python
model = Sequential()
# Layer 1: 50 units, 1 input feature per timestep, full sequence output
model.add(SimpleRNN(50, input_shape=(None, 1), return_sequences=True))
model.add(Dropout(0.2))

# Layer 2: 100 units, 50 input features, vector output
model.add(SimpleRNN(100, return_sequences=False))
model.add(Dropout(0.2))

# Layer 3: Dense output regression
model.add(Dense(1))
```

#### Layer 1: `SimpleRNN(50, input_shape=(None, 1))`

- $d_{\text{in}} = 1, \quad d_h = 50$
- Input weights ($U$): $1 \times 50 = 50$
- Recurrent weights ($W$): $50 \times 50 = 2,500$
- Biases ($b$): $50$
- **Total:** $50 + 2,500 + 50 = \mathbf{2,600}\text{ parameters}$
- **Output Shape:** `(None, None, 50)` because `return_sequences=True`.

#### Layer 2: `SimpleRNN(100, return_sequences=False)`

- $d_{\text{in}} = 50$ (from Layer 1), $\quad d_h = 100$
- Input weights ($U$): $50 \times 100 = 5,000$
- Recurrent weights ($W$): $100 \times 100 = 10,000$
- Biases ($b$): $100$
- **Total:** $5,000 + 10,000 + 100 = \mathbf{15,100}\text{ parameters}$
- **Output Shape:** `(None, 100)` because `return_sequences=False` (only the final time step is emitted).

#### Layer 3: `Dense(1)`

- $N_{\text{in}} = 100, \quad N_{\text{out}} = 1$
- Weights: $100 \times 1 = 100$
- Bias: $1$
- **Total:** $100 + 1 = \mathbf{101}\text{ parameters}$
- **Output Shape:** `(None, 1)`

---

# 4. Backpropagation Through Time (BPTT) Math (Slides 31–37)

Consider a 2-step unrolled network with squared loss:
$$a_1 = W h_0 + U X_1 + b, \quad h_1 = \tanh(a_1), \quad Y_1 = V h_1 + c$$
$$a_2 = W h_1 + U X_2 + b, \quad h_2 = \tanh(a_2), \quad Y_2 = V h_2 + c$$
$$L = L_1 + L_2 = \frac{1}{2}(Y_1 - Z_1)^2 + \frac{1}{2}(Y_2 - Z_2)^2$$

Recall: $\frac{\partial h_t}{\partial a_t} = 1 - \tanh^2(a_t) = 1 - h_t^2$.

```
              L1                          L2
              ▲                           ▲
              │                           │
              Y1                          Y2
              ▲                           ▲
              │ V                         │ V
  h0 ───W───► h1 ───────────W───────────► h2
              ▲                           ▲
              │ U                         │ U
              X1                          X2
```

---

### Derivation of $\frac{\partial L}{\partial W}$ (Multi-Path Chain Rule)

$W$ influences the total loss through **three distinct computational paths**:

1. Path to $L_1$ through $h_1$: $W \to h_1 \to Y_1 \to L_1$
2. Direct path to $L_2$ through $h_2$: $W \to a_2 \to h_2 \to Y_2 \to L_2$
3. Indirect path to $L_2$ through $h_1$: $W \to a_1 \to h_1 \to a_2 \to h_2 \to Y_2 \to L_2$

$$\frac{\partial L}{\partial W} = \frac{\partial L_1}{\partial W} + \frac{\partial L_2}{\partial W}$$

$$\frac{\partial L_1}{\partial W} = \frac{\partial L_1}{\partial Y_1} \frac{\partial Y_1}{\partial h_1} \frac{\partial h_1}{\partial a_1} \frac{\partial a_1}{\partial W} = (Y_1 - Z_1) \cdot V \cdot (1 - h_1^2) \cdot h_0$$

$$\frac{\partial L_2}{\partial W} = \underbrace{\frac{\partial L_2}{\partial h_2} \frac{\partial h_2}{\partial W}}_{\text{Direct path via } a_2} + \underbrace{\frac{\partial L_2}{\partial h_2} \frac{\partial h_2}{\partial h_1} \frac{\partial h_1}{\partial W}}_{\text{Indirect path through } h_1}$$

Evaluating each factor:

- $\frac{\partial L_2}{\partial h_2} = \frac{\partial L_2}{\partial Y_2}\frac{\partial Y_2}{\partial h_2} = (Y_2 - Z_2)V$
- $\frac{\partial h_2}{\partial W} = \frac{\partial h_2}{\partial a_2}\frac{\partial a_2}{\partial W} = (1 - h_2^2)h_1$
- $\frac{\partial h_2}{\partial h_1} = \frac{\partial h_2}{\partial a_2}\frac{\partial a_2}{\partial h_1} = (1 - h_2^2)W$
- $\frac{\partial h_1}{\partial W} = (1 - h_1^2)h_0$

Combining all terms:
$$\mathbf{\frac{\partial L}{\partial W} = (Y_1 - Z_1)V(1 - h_1^2)h_0 + (Y_2 - Z_2)V(1 - h_2^2)h_1 + (Y_2 - Z_2)V(1 - h_2^2)W(1 - h_1^2)h_0}$$

---

### Derivation of $\frac{\partial L}{\partial U}$ and $\frac{\partial L}{\partial b}$

Following the identical branching structure:

$$\mathbf{\frac{\partial L}{\partial U} = (Y_1 - Z_1)V(1 - h_1^2)X_1 + (Y_2 - Z_2)V(1 - h_2^2)X_2 + (Y_2 - Z_2)V(1 - h_2^2)W(1 - h_1^2)X_1}$$

$$\mathbf{\frac{\partial L}{\partial b} = (Y_1 - Z_1)V(1 - h_1^2) + (Y_2 - Z_2)V(1 - h_2^2) + (Y_2 - Z_2)V(1 - h_2^2)W(1 - h_1^2)}$$

---

### Derivation of $\frac{\partial L}{\partial V}$ and $\frac{\partial L}{\partial c}$

Because $V$ and $c$ act independently on each time step without temporal recurrence:
$$\mathbf{\frac{\partial L}{\partial V} = \sum_{t=1}^2 (Y_t - Z_t)h_t = (Y_1 - Z_1)h_1 + (Y_2 - Z_2)h_2}$$
$$\mathbf{\frac{\partial L}{\partial c} = \sum_{t=1}^2 (Y_t - Z_t) = (Y_1 - Z_1) + (Y_2 - Z_2)}$$

---

# 5. Deep-Dive: Teacher Forcing (Slides 23–24, 38–40)

---

### 1. Structural Comparison: RNN A vs. RNN B (Slide 39)

```
        RNN A (Hidden-to-Hidden)                   RNN B (Output-to-Hidden)
                o^(t)                                      o^(t)
                ▲                                          ▲   │
                │ V                                        │ V │ W
      ... ──► h^(t) ────W────► ...               ...       h^(t)▼       ...
                ▲                                          ▲
                │ U                                        │ U
              x^(t)                                      x^(t)
```

- **RNN A (Hidden-to-Hidden Recurrence):**
  - The hidden state $\mathbf{h}^{(t)}$ serves as an internal memory buffer.
  - It can store arbitrary context from the past without committing to an immediate output.
  - It is **Turing-complete**, but computing gradients requires running Backpropagation Through Time sequentially across all time steps, which cannot be parallelized.
- **RNN B (Output-to-Hidden Recurrence):**
  - The only link to the future is the output prediction $\mathbf{o}^{(t)}$ (or $\mathbf{y}^{(t)}$).
  - **Strictly less powerful:** Unless the output $\mathbf{o}^{(t)}$ is exceptionally high-dimensional, it creates an information bottleneck. Hidden state $\mathbf{h}^{(t)}$ cannot store private contextual clues that are not directly reflected in the output target.
  - **Major Operational Benefit:** Because time steps do not share direct hidden state recurrences, **they can be completely decoupled during training using Teacher Forcing**.

---

### 2. Mathematical Foundation: Maximum Likelihood Derivation (Slide 40)

Teacher Forcing is not a heuristic; it is derived from applying the **Maximum Likelihood Criterion** to conditional sequential models.

By the probability chain rule, the joint conditional likelihood of generating target sequence $\mathbf{y} = (y^{(1)}, y^{(2)})$ given inputs $\mathbf{x} = (x^{(1)}, x^{(2)})$ factorizes as:

$$\log p\left(y^{(1)}, y^{(2)} \mid x^{(1)}, x^{(2)}\right) = \log p\left(y^{(1)} \mid x^{(1)}, x^{(2)}\right) + \log p\left(y^{(2)} \mid y^{(1)}, x^{(1)}, x^{(2)}\right)$$

Notice the second conditional term:
$$p\left(y^{(2)} \mid \mathbf{y}^{(1)}, x^{(1)}, x^{(2)}\right)$$

To maximize the true conditional log-likelihood during training, the conditioning input at time $t=2$ must be the **true ground-truth label $y^{(1)}$**, _not_ the model's stochastic or inaccurate guess $\hat{y}^{(1)}$.

---

### 3. Training Graph vs. Inference Graph (Slide 40)

```
       TRAINING TIME (Teacher Forcing)                      TEST / INFERENCE TIME (Autoregressive)
             y^(t-1)         y^(t)                                o^(t-1)         o^(t)
              │   ▲           │   ▲                                ▲   │           ▲
              │   │           │   │                                │   │           │
              │   │ L^(t-1)   │   │ L^(t)                          │   └──┐        │
              │   │           │   │                                │      ▼        │
              │  o^(t-1)      │  o^(t)                            o^(t-1)─►h^(t)  o^(t)
              │   ▲           │   ▲                                ▲      ▲        ▲
           W  │   │ V         │   │ V                              │ V    │ U      │ V
     ─────────┘  h^(t-1)  ────┘  h^(t)                            h^(t-1) x^(t)   h^(t)
                  ▲               ▲                                ▲               ▲
                  │ U             │ U                              │ U             │ U
                 x^(t-1)         x^(t)                            x^(t-1)         x^(t)
```

#### During Training (Teacher Forcing Active):

- At step $t$, the recurrence input fed into hidden state $h^{(t)}$ is forced to be the **ground truth target $y^{(t-1)}$**:
  $$h^{(t)} = f\left(y^{(t-1)}, x^{(t)}; \boldsymbol{\theta}\right)$$
- **Full Parallelization:** Because $y^{(t-1)}$ is already known from the training data, $h^{(t)}$ does not need to wait for step $t-1$ to compute its forward pass. All time steps $\{1, \dots, \tau\}$ can be processed simultaneously as independent feedforward examples in parallel.

#### During Testing / Inference (Teacher Forcing Inactive):

- Ground-truth labels $y^{(t)}$ do not exist.
- The network operates autoregressively: the model's own predicted output $\hat{y}^{(t-1)}$ (or $o^{(t-1)}$) is fed back into $h^{(t)}$:
  $$h^{(t)} = f\left(\hat{y}^{(t-1)}, x^{(t)}; \boldsymbol{\theta}\right)$$
- Processing is sequential; step $t$ must wait for step $t-1$ to produce an output.

---

### 4. Failure Mode: Exposure Bias (Compounding Errors)

While Teacher Forcing provides fast, stable training, it creates a fundamental train-test discrepancy known as **Exposure Bias**:

$$
\begin{matrix}
\textbf{Training Distribution:} & p\left(\text{Input to } h^{(t)} \mid \text{True History } y^{(1:t-1)}\right) \\
\textbf{Testing Distribution:} & p\left(\text{Input to } h^{(t)} \mid \text{Generated History } \hat{y}^{(1:t-1)}\right)
\end{matrix}
$$

- During training, the model is **never exposed to its own errors**. It only practices predicting the next step given an immaculate, perfect history.
- At test time, if the network makes a small error at step $t=1$, the hidden state $h^{(2)}$ is fed an out-of-distribution input. The model cannot recover from this unfamiliar state, causing errors to compound rapidly across subsequent steps, leading to degenerate or repetitive sequences.

---

### 5. Solutions to Exposure Bias

To resolve this discrepancy, training procedures mix ground truth with model predictions:

1. **Scheduled Sampling (Bengio et al.):**
   During training, flip a coin at each time step with probability $\epsilon_k$:
   $$\text{Input to } h^{(t)} = \begin{cases} y^{(t-1)} & \text{with probability } \epsilon_k \\ \hat{y}^{(t-1)} & \text{with probability } 1 - \epsilon_k \end{cases}$$
   $\epsilon_k$ starts at $1.0$ (pure teacher forcing) at the beginning of training and gradually decays toward $0.0$ (free running) as epochs progress.
2. **Beam Search at Inference:** Instead of greedily picking $\arg\max \hat{y}^{(t)}$ at each step, maintain a beam of the top-$B$ most probable cumulative sequences to mitigate individual erroneous steps.
3. **Reinforcement Learning (Policy Gradient / Actor-Critic):** Optimize sequence-level rewards (e.g., BLEU, ROUGE) directly using the model's own rollouts.

---

# 6. The Long-Term Dependency Problem (Slides 51–56)

### Mathematical Cause: Repeated Matrix Multiplication (Slide 52)

When an RNN is unfolded across $t$ steps, the gradient paths back to $h^{(0)}$ involve repeated products of the recurrent transition Jacobian:

$$\frac{\partial h^{(t)}}{\partial h^{(0)}} = \prod_{k=1}^t \frac{\partial h^{(k)}}{\partial h^{(k-1)}} = \prod_{k=1}^t \mathbf{W}^T \operatorname{diag}\left(1 - \left(h^{(k)}\right)^2\right)$$

Simplifying this on a linear path yields repeated powers of the recurrent weight matrix: $\mathbf{W}^t$.

Using the eigendecomposition $\mathbf{W} = \mathbf{V} \boldsymbol{\Lambda} \mathbf{V}^{-1}$:
$$\mathbf{W}^t = \left(\mathbf{V} \boldsymbol{\Lambda} \mathbf{V}^{-1}\right)^t = \mathbf{V} \boldsymbol{\Lambda}^t \mathbf{V}^{-1}$$
$$\boldsymbol{\Lambda}^t = \operatorname{diag}\left(\lambda_1^t, \, \lambda_2^t, \, \dots, \, \lambda_n^t\right)$$

- **If $|\lambda_i| > 1$:** $\lambda_i^t \to \infty$ as $t \to \infty \implies$ **Exploding Gradients** (leads to numerical overflows / `NaN` weights; mitigated by **Gradient Clipping**).
- **If $|\lambda_i| < 1$:** $\lambda_i^t \to 0$ as $t \to \infty \implies$ **Vanishing Gradients** (the contribution of $h^{(0)}$ to the gradient at time step $t$ shrinks to zero; the network fails to learn long-range temporal associations).

---

### Slide Solutions to the Vanishing Gradient Problem (Slides 53–56)

#### 1. Leaky Units (Slide 55)

Instead of fully replacing the hidden state, introduce a linear self-connection controlled by parameter $\alpha \in [0, 1]$:
$$h^{(t)} = (1 - \alpha) h^{(t-1)} + \alpha \tilde{h}^{(t)}$$
$$\tilde{h}^{(t)} = \tanh\left(W h^{(t-1)} + U x^{(t)} + b\right)$$

- **$\alpha = 1$:** Reverts to a standard, memoryless vanilla RNN.
- **$\alpha = 0$:** State is locked ($h^{(t)} = h^{(t-1)}$), ignoring all new inputs.
- **Small $\alpha$:** Gradients bypass non-linear saturations via the constant factor $(1 - \alpha)$, preserving information over longer time horizons.

#### 2. Temporal Skip Connections (Slide 54)

Construct recurrent connections spanning delays greater than $1$:
$$h^{(t)} \longrightarrow h^{(t+d)} \quad (d > 1)$$
Gradients backpropagate in $\tau / d$ steps rather than $\tau$ steps, mitigating exponential decay.

#### 3. Pruning Connections / Multi-Time Scales (Slide 56)

Actively remove length-1 connections and replace them with stride-2 or stride-$k$ connections:
$$h^{(t)} \longrightarrow h^{(t+2)} \longrightarrow h^{(t+4)} \longrightarrow h^{(t+6)}$$
This forces different parts of the network to operate on distinct temporal resolutions (fine-grained vs. coarse-grained time scales).

---

# 7. Practice Exam Questions (RNN Focused)

---

### Exam Question 1: Parameter Count & Multi-Layer RNN Pipeline

#### **Problem**

Consider the following Keras model:

```python
model = Sequential()
model.add(SimpleRNN(64, input_shape=(None, 8), return_sequences=True))
model.add(SimpleRNN(32, return_sequences=False))
model.add(Dense(10, activation="softmax"))
```

1. State the role and output shape of each layer.
2. Derive and calculate the exact number of learnable parameters for each layer.
3. What is the total number of learnable parameters in the entire network?

---

#### **Solution**

- **Layer 1: `SimpleRNN(64, input_shape=(None, 8), return_sequences=True)`**
  - **Role:** Processes input sequences of 8-dimensional vectors. Emits full sequence of 64-dimensional hidden states.
  - **Output Shape:** `(None, None, 64)`
  - **Parameters:** $d_{\text{in}} = 8, d_h = 64$
    $$\text{Params} = d_h(d_{\text{in}} + d_h + 1) = 64 \times (8 + 64 + 1) = 64 \times 73 = \mathbf{4,672}$$

- **Layer 2: `SimpleRNN(32, return_sequences=False)`**
  - **Role:** Takes sequence of 64-dimensional vectors from Layer 1; summarizes sequence into a single 32-dimensional context vector at the final time step.
  - **Output Shape:** `(None, 32)`
  - **Parameters:** $d_{\text{in}} = 64, d_h = 32$
    $$\text{Params} = d_h(d_{\text{in}} + d_h + 1) = 32 \times (64 + 32 + 1) = 32 \times 97 = \mathbf{3,104}$$

- **Layer 3: `Dense(10, activation='softmax')`**
  - **Role:** Classifies the 32-dimensional summary vector into 10 class probabilities.
  - **Output Shape:** `(None, 10)`
  - **Parameters:** $N_{\text{in}} = 32, N_{\text{out}} = 10$
    $$\text{Params} = (N_{\text{in}} + 1) \times N_{\text{out}} = (32 + 1) \times 10 = \mathbf{330}$$

- **Total Parameters in Network:**
  $$\text{Total} = 4,672 + 3,104 + 330 = \mathbf{8,106}\text{ parameters}$$

---

### Exam Question 2: BPTT Derivation & Teacher Forcing Analysis

#### **Problem**

1. Write down the gradient of the loss with respect to output bias $c$ and output matrix $V$ for an unrolled 2-step RNN:
   $$Y_1 = V h_1 + c, \quad Y_2 = V h_2 + c, \quad L = \frac{1}{2}(Y_1 - Z_1)^2 + \frac{1}{2}(Y_2 - Z_2)^2$$
2. Explain why training an Output-to-Hidden recurrent network (RNN B) using **Teacher Forcing** eliminates the need for BPTT.
3. What is the fundamental disadvantage of Teacher Forcing during test time?

---

#### **Solution**

1. **Gradients for $c$ and $V$:**
   $$\frac{\partial L}{\partial c} = \frac{\partial L_1}{\partial c} + \frac{\partial L_2}{\partial c} = (Y_1 - Z_1) + (Y_2 - Z_2) = \sum_{t=1}^2 (Y_t - Z_t)$$
   $$\frac{\partial L}{\partial V} = \frac{\partial L_1}{\partial V} + \frac{\partial L_2}{\partial V} = (Y_1 - Z_1)h_1 + (Y_2 - Z_2)h_2 = \sum_{t=1}^2 (Y_t - Z_t)h_t$$

2. **Why Teacher Forcing eliminates BPTT in RNN B:**
   In an Output-to-Hidden architecture under Teacher Forcing, the input fed into hidden state $h^{(t)}$ is the fixed, known training target $y^{(t-1)}$:
   $$h^{(t)} = f\left(y^{(t-1)}, x^{(t)}; \boldsymbol{\theta}\right)$$
   Because $y^{(t-1)}$ is a constant provided by the dataset rather than a function of the model's parameters $\boldsymbol{\theta}$, there is **no mathematical dependency of $h^{(t)}$ on $h^{(t-1)}$**. The computational graph splits into independent single-step feedforward networks. Gradients do not propagate backward across time steps, allowing training steps to run in parallel without BPTT.

3. **Disadvantage at Test Time (Exposure Bias):**
   At test time, true labels $y^{(t-1)}$ are unavailable, forcing the model to rely on its own generated outputs $\hat{y}^{(t-1)}$. Because the network was trained exclusively on ground-truth inputs, errors at early inference steps push the hidden state into unfamiliar regions of the feature space, leading to compounding errors along the generated sequence.

Here is the complete, dedicated breakdown of **Section 7: RNN Architectural Variants** (from Slides 41–50 of your lecture), covering every variant, its computational graph structure, mathematical equations, pros/cons, and real-world applications.

---

# 8. RNN Architectural Variants (Slides 41–50)

Standard RNNs assume a causal, sequence-in to sequence-out mapping of identical lengths. In practice, sequence modeling requires several architectural variants:

---

## 1. Sequence Conditioned on Context (Slide 42)

- **Goal:** Map a single, fixed-length context vector $\mathbf{x}$ to a distribution over an output sequence $\mathbf{Y} = (\mathbf{y}^{(1)}, \dots, \mathbf{y}^{(\tau)})$.
- **Primary Application:** **Image Captioning** (a single image feature vector $\mathbf{x}$ is transformed into a natural language sentence describing the scene).

### Three Ways to Provide the Context Vector $\mathbf{x}$:

1. **As the initial hidden state only:**
   $$\mathbf{h}^{(0)} = g(\mathbf{x}), \quad \mathbf{h}^{(t)} = \tanh\left(\mathbf{W}\mathbf{h}^{(t-1)} + \mathbf{b}\right) \quad \text{for } t \ge 1$$
2. **As an input at every single time step:**
   $$\mathbf{h}^{(t)} = \tanh\left(\mathbf{W}\mathbf{h}^{(t-1)} + \mathbf{R}\mathbf{x} + \mathbf{b}\right)$$
   _(where $\mathbf{R}$ is the context-to-hidden projection matrix)_.
3. **Both (as initial state AND recurrent input at every step):**
   $$\mathbf{h}^{(0)} = g(\mathbf{x}), \quad \mathbf{h}^{(t)} = \tanh\left(\mathbf{W}\mathbf{h}^{(t-1)} + \mathbf{R}\mathbf{x} + \mathbf{U}\mathbf{y}^{(t-1)} + \mathbf{b}\right)$$
   _(Allows the network to continuously reference the original context image throughout sentence generation without forgetting it)._

---

## 2. Bidirectional RNNs (BRNNs) (Slide 43)

```
       y^(t-1)                  y^(t)                  y^(t+1)
          ▲                       ▲                       ▲
          │                       │                       │
     ┌────┴────┐             ┌────┴────┐             ┌────┴────┐
     │  Output │             │  Output │             │  Output │
     └────▲────┘             └────▲────┘             └────▲────┘
       ┌──┴────────┬───────────┐  │  ┌────────────┬───────┴──┐
       │           │           │  │  │            │          │
  ... ─┼───────────┼──────────► g^(t-1) ◄─────────┼──────────┼─ ... (Backward)
       │           │              ▲               │          │
  ... ─┼──────────►h^(t-1)────────┼──────────────►h^(t)──────┼─ ... (Forward)
       │           ▲              │               ▲          │
       │           └──────────────┼───────────────┘          │
       ▲                          ▲                          ▲
     x^(t-1)                     x^(t)                     x^(t+1)
```

- **Motivation:** Standard causal RNNs only capture the past ($\mathbf{x}^{(1)}, \dots, \mathbf{x}^{(t)}$). In many offline sequence tasks, the meaning of a word at step $t$ depends on words that come **after** it.
  - _Example:_ "I saw a **bank** ... of the river" vs. "I saw a **bank** ... robbery".
- **Mechanism:** Maintains **two independent recurrent hidden layers**:
  1. **Forward RNN ($\overrightarrow{\mathbf{h}}^{(t)}$):** Reads sequence from left to right ($t = 1 \to \tau$):
     $$\overrightarrow{\mathbf{h}}^{(t)} = \tanh\left(\mathbf{W}_{\text{fwd}}\overrightarrow{\mathbf{h}}^{(t-1)} + \mathbf{U}_{\text{fwd}}\mathbf{x}^{(t)} + \mathbf{b}_{\text{fwd}}\right)$$
  2. **Backward RNN ($\overleftarrow{\mathbf{g}}^{(t)}$):** Reads sequence from right to left ($t = \tau \to 1$):
     $$\overleftarrow{\mathbf{g}}^{(t)} = \tanh\left(\mathbf{W}_{\text{bwd}}\overleftarrow{\mathbf{g}}^{(t+1)} + \mathbf{U}_{\text{bwd}}\mathbf{x}^{(t)} + \mathbf{b}_{\text{bwd}}\right)$$
- **Combined Output:** Hidden states are concatenated at each step to produce the final prediction:
  $$\mathbf{o}^{(t)} = \mathbf{V}\left[\overrightarrow{\mathbf{h}}^{(t)}; \; \overleftarrow{\mathbf{g}}^{(t)}\right] + \mathbf{c}, \quad \hat{\mathbf{y}}^{(t)} = \text{softmax}(\mathbf{o}^{(t)})$$
- **Use Cases:** Speech recognition, protein structure prediction, handwriting recognition, machine translation encoding.
- **Limitation:** Cannot be used for real-time / online streaming applications because the entire future sequence must be observed before computation can begin.

---

## 3. Sequence-to-Sequence (Seq2Seq / Encoder-Decoder) (Slides 44–47)

```
        ENCODER RNN                                         DECODER RNN
                                         Context C
   (x1)      (x2)      (x3)                 │            (y1)      (y2)      (y3)
    │         │         │                   │             ▲         ▲         ▲
    ▼         ▼         ▼                   ▼             │         │         │
  [h1] ───► [h2] ───► [h3] ─────────────► [ C ] ───────► [d1] ───► [d2] ───► [d3]
                                                          ▲         ▲         ▲
                                                          │         │         │
                                                        <SOS>      (y1)      (y2)
```

- **Motivation:** Handles sequence tasks where input length $n_x$ and output length $n_y$ are **different** ($n_x \neq n_y$).
- **Components:**
  1. **Encoder RNN:**
     - Iterates over variable-length input sequence $\mathbf{X} = (\mathbf{x}^{(1)}, \dots, \mathbf{x}^{(n_x)})$.
     - Generates a final hidden state that serves as the summary context vector:
       $$\mathbf{C} = \mathbf{h}^{(n_x)}$$
  2. **Decoder RNN:**
     - Conditioned on the fixed context vector $\mathbf{C}$ (either as initial hidden state $\mathbf{d}^{(0)} = \mathbf{C}$, or fed at every step).
     - Autoregressively generates target sequence $\mathbf{Y} = (\mathbf{y}^{(1)}, \dots, \mathbf{y}^{(n_y)})$ one element at a time until an end-of-sequence token `"<EOS>"` is emitted.
- **Use Cases:** Machine translation (e.g., English to Thai), speech-to-text, question answering, text summarization.
- **Key Limitation (Slide 47):** **The Context Bottleneck.** Forcing an entire sequence into a single, fixed-size vector $\mathbf{C}$ creates an information bottleneck, causing performance to degrade sharply on long sentences.

---

## 4. Deep Recurrent Neural Networks (Stacked RNNs) (Slides 48–50)

Computation in an RNN occurs across three parameter blocks:

1. Input-to-hidden ($\mathbf{U}$)
2. Hidden-to-hidden ($\mathbf{W}$)
3. Hidden-to-output ($\mathbf{V}$)

Introducing depth into each operation allows the model to learn hierarchical features across time.

```
       Hierarchical Stacking (Left)              Skip Connections (Right)
                 y^(t)                                    y^(t)
                   ▲                                        ▲
                   │                                        │
             ┌───────────┐                            ┌───────────┐
             │ Layer 2 h2│                            │ Layer 2 h2│◄──┐
             └─────▲─────┘                            └─────▲─────┘   │
                   │                                        │         │ (Skip)
             ┌─────┴─────┐                            ┌─────┴─────┐   │
             │ Layer 1 h1│                            │ Layer 1 h1├───┘
             └─────▲─────┘                            └─────▲─────┘
                   │                                        │
                 x^(t)                                    x^(t)
```

### The Three Deep RNN Topologies (Slide 50):

#### 1. Hierarchically Stacked Hidden States (Slide 50, Left)

- Multiple recurrent layers stacked vertically on top of one another.
- The output sequence of hidden layer $l-1$ becomes the input sequence to hidden layer $l$:
  $$\mathbf{h}_1^{(t)} = f\left(\mathbf{h}_1^{(t-1)}, \, \mathbf{x}^{(t)}\right)$$
  $$\mathbf{h}_2^{(t)} = f\left(\mathbf{h}_2^{(t-1)}, \, \mathbf{h}_1^{(t)}\right)$$
- **Benefit:** Lower recurrent layers extract low-level temporal features (e.g., phonemes/characters), while higher layers learn abstract temporal concepts (e.g., grammar/semantics).

#### 2. Deep Feedforward Transitions within Steps (Slide 50, Middle)

- Deep computation (e.g., an MLP with multiple non-linear layers) is placed _inside_ the state transitions:
  - Deep input-to-hidden
  - Deep hidden-to-hidden
  - Deep hidden-to-output
- **Drawback:** Greatly lengthens the path gradients must travel per time step, exacerbating the vanishing/exploding gradient problem and making optimization difficult.

#### 3. Temporal & Hierarchical Skip Connections (Slide 50, Right)

- Adds shortcut/residual connections across layers (e.g., feeding $\mathbf{x}^{(t)}$ directly to $\mathbf{h}_2^{(t)}$, or connecting $\mathbf{h}_1^{(t)}$ directly to output $\mathbf{y}^{(t)}$).
- **Benefit:** Mitigates the path-lengthening effect of deep architectures, giving gradients direct highways to propagate without vanishing.

---

## Summary Comparison of Architectural Variants

| Architecture                  | Input $\to$ Output Mapping | Recurrence Direction          | Temporal Dimension Matching | Core Limitation / Trade-off                                 |
| :---------------------------- | :------------------------- | :---------------------------- | :-------------------------- | :---------------------------------------------------------- |
| **Context-Conditioned**       | Vector $\to$ Sequence      | Forward                       | $1 \to \tau$                | Must preserve context across long generations               |
| **Bidirectional RNN**         | Sequence $\to$ Sequence    | Both ($\to$ and $\leftarrow$) | $n_x = n_y$                 | Cannot run online/real-time (requires future inputs)        |
| **Seq2Seq (Encoder-Decoder)** | Sequence $\to$ Sequence    | Encoder $\to$, Decoder $\to$  | $n_x \neq n_y$ (Arbitrary)  | Context vector $\mathbf{C}$ forms an information bottleneck |
| **Deep / Stacked RNN**        | Hierarchical layers        | Forward per layer             | Layer-dependent             | Harder to optimize due to increased gradient path length    |
