Here is the rigorous, complete guide addressing the **Master Formula**, the exact relationship between **`same` padding and stride**, and the **full standard pipeline (Conv2D, Pooling, Dense)** alongside all potential surprises (`padding="valid"`, `padding="same"`, `use_bias=False`, `BatchNormalization`, `UpSampling2D`, and `Receptive Field`).

Every single type follows the exact exam structure: **Python code**, **role**, **input/output shapes using the Master Formula**, **filter tensor shapes**, **number of neurons in layers with learnable parameters**, and **total learnable parameters**.

---

# 1. The True Master Formulas & Padding Conventions

Let:

- $N_{\text{in}}$ = input spatial size (height or width)
- $N_{\text{out}}$ = output spatial size
- $F$ = filter size ($M$ in slides, $F_h \times F_w$)
- $S$ = stride
- $P$ = total padding added across both sides ($P_{\text{total}} = 2P$ if symmetric)

### **The Universal Master Equation (Valid for ANY Convolution & Pooling):**

$$N_{\text{out}} = \left\lfloor \frac{N_{\text{in}} + 2P - F}{S} \right\rfloor + 1$$

---

### **Important: Why `same` does NOT always equal $N_{\text{in}}$**

In modern frameworks (Keras/TensorFlow), the definition of **`padding="same"`** is that the output spatial dimension matches the input downsampled by the stride $S$:

$$N_{\text{out}} = \left\lceil \frac{N_{\text{in}}}{S} \right\rceil$$

- **Case 1: When $S = 1$:**
  $$N_{\text{out}} = \lceil N_{\text{in}} / 1 \rceil = N_{\text{in}} \quad (\text{Preserves original spatial dimensions})$$
- **Case 2: When $S > 1$ (e.g., $S = 2$):**
  $$N_{\text{out}} = \left\lceil \frac{N_{\text{in}}}{2} \right\rceil \neq N_{\text{in}} \quad (\textbf{Halves the spatial dimension despite being "same"!})$$
- **Total Padding $2P$ applied under the hood to achieve this:**
  $$2P = \max\Big((N_{\text{out}} - 1) \cdot S + F - N_{\text{in}}, \; 0\Big)$$

---

# 2. Per-Type Breakdown (Standard & Surprise Layers)

---

### Type 1: Conv2D with `padding="same"` and $S = 1$ (Standard)

```python
# Input from previous layer: (28, 28, 2)
model.add(layers.Conv2D(16, (3, 3), strides=(1, 1), padding="same", activation="relu"))
```

- **Role:** Extracts 16 local spatial feature maps while maintaining full spatial resolution ($S=1$).
- **Input Shape:** $(28, 28, 2)$
- **Output Shape Formula:**
  $$N_{\text{out}} = \left\lceil \frac{N_{\text{in}}}{S} \right\rceil = \left\lceil \frac{28}{1} \right\rceil = 28 \implies \mathbf{(28, 28, 16)}$$
  _(Padding required: $P = \frac{F - 1}{2} = \frac{3 - 1}{2} = 1$ per side. Applying Master Formula: $\lfloor \frac{28 + 2(1) - 3}{1} \rfloor + 1 = 28$)._
- **Filter Tensor Shape:** $(3, 3, 2, 16)$
- **Neurons in this Layer:** $28 \times 28 \times 16 = \mathbf{12,544}$
- **Learnable Parameters Formula:**
  $$\text{Params} = (F_h \times F_w \times C_{\text{in}} + 1) \times C_{\text{out}} = (3 \times 3 \times 2 + 1) \times 16 = 19 \times 16 = \mathbf{304}$$

---

### Type 2: Conv2D with `padding="valid"` ($P = 0$)

```python
# Input from previous layer: (28, 28, 2)
model.add(layers.Conv2D(16, (3, 3), strides=(1, 1), padding="valid", activation="relu"))
```

- **Role:** Extracts 16 spatial feature maps without zero-padding; boundaries naturally shrink.
- **Input Shape:** $(28, 28, 2)$
- **Output Shape Formula:**
  $$N_{\text{out}} = \left\lfloor \frac{N_{\text{in}} + 2(0) - F}{S} \right\rfloor + 1 = \left\lfloor \frac{28 - 3}{1} \right\rfloor + 1 = 25 + 1 = 26 \implies \mathbf{(26, 26, 16)}$$
- **Filter Tensor Shape:** $(3, 3, 2, 16)$
- **Neurons in this Layer:** $26 \times 26 \times 16 = \mathbf{10,816}$
- **Learnable Parameters Formula:**
  $$\text{Params} = (F_h \times F_w \times C_{\text{in}} + 1) \times C_{\text{out}} = (3 \times 3 \times 2 + 1) \times 16 = \mathbf{304}$$

---

### Type 3: Conv2D with `padding="same"` and Strided Downsampling ($S = 2$)

```python
# Input: (28, 28, 16)
model.add(layers.Conv2D(32, (3, 3), strides=(2, 2), padding="same", activation="relu"))
```

- **Role:** Downsamples and extracts higher-level features simultaneously, replacing a pooling layer.
- **Input Shape:** $(28, 28, 16)$
- **Output Shape Formula:**
  $$N_{\text{out}} = \left\lceil \frac{N_{\text{in}}}{S} \right\rceil = \left\lceil \frac{28}{2} \right\rceil = 14 \implies \mathbf{(14, 14, 32)}$$
- **Filter Tensor Shape:** $(3, 3, 16, 32)$
- **Neurons in this Layer:** $14 \times 14 \times 32 = \mathbf{6,272}$
- **Learnable Parameters Formula:**
  $$\text{Params} = (F_h \times F_w \times C_{\text{in}} + 1) \times C_{\text{out}} = (3 \times 3 \times 16 + 1) \times 32 = 145 \times 32 = \mathbf{4,640}$$

---

### Type 4: Conv2D with No Bias (`use_bias=False`)

```python
# Input: (14, 14, 16)
model.add(layers.Conv2D(32, (3, 3), strides=(1, 1), padding="same", use_bias=False, activation="relu"))
```

- **Role:** Standard spatial convolution without additive bias intercepts (used before BatchNorm).
- **Input Shape:** $(14, 14, 16)$
- **Output Shape Formula:** $N_{\text{out}} = \lceil 14 / 1 \rceil = 14 \implies \mathbf{(14, 14, 32)}$
- **Filter Tensor Shape:** $(3, 3, 16, 32)$
- **Neurons in this Layer:** $14 \times 14 \times 32 = \mathbf{6,272}$
- **Learnable Parameters Formula (Drop the $+1$ bias term):**
  $$\text{Params} = F_h \times F_w \times C_{\text{in}} \times C_{\text{out}} = 3 \times 3 \times 16 \times 32 = \mathbf{4,608}$$

---

### Type 5: Pooling (`MaxPooling2D` / `AveragePooling2D`)

```python
# Input: (28, 28, 16)
model.add(layers.MaxPooling2D(pool_size=(2, 2), strides=(2, 2)))
```

- **Role:** Reduces spatial dimensionality via non-parametric pooling (e.g., max or average); grants translation invariance.
- **Input Shape:** $(28, 28, 16)$
- **Output Shape Formula (Slide Rule):**
  $$N_{\text{out}} = \left\lfloor \frac{N_{\text{in}}}{P_{\text{size}}} \right\rfloor = \left\lfloor \frac{28}{2} \right\rfloor = 14 \implies \mathbf{(14, 14, 16)}$$
  _(Via Master Formula with $F = 2, S = 2, P = 0$: $\lfloor \frac{28 - 2}{2} \rfloor + 1 = 13 + 1 = 14$)._
- **Filter Tensor Shape:** None (fixed mathematical operation).
- **Neurons in this Layer:** $0$ (contains no learnable parameters).
- **Learnable Parameters:** $\mathbf{0}$

---

### Type 6: Flatten + Dense Layer (Standard vs. `use_bias=False`)

```python
# Input tensor from Conv/Pool: (14, 14, 32)
model.add(layers.Flatten())
model.add(layers.Dense(128, activation="relu"))
```

- **Role of Flatten:** Reshapes a 3D volume into a 1D vector:
  $$N_{\text{in}} = 14 \times 14 \times 32 = 6,272 \implies \mathbf{(6272,)}$$
- **Role of Dense:** Full matrix multiplication connecting all input units to 128 hidden neurons with non-linear activation.
- **Dense Input Shape:** $(6272,)$
- **Dense Output Shape:** $(128,)$
- **Filter Tensor Shape:** None (Weight matrix $\mathbf{W} \in \mathbb{R}^{6272 \times 128}$).
- **Neurons in this Layer:** $\mathbf{128}$
- **Learnable Parameters Formulas:**
  - **Standard (`use_bias=True`, default):**
    $$\text{Params} = (N_{\text{in}} + 1) \times N_{\text{out}} = (6272 + 1) \times 128 = \mathbf{802,944}$$
  - **Surprise (`use_bias=False`):**
    $$\text{Params} = N_{\text{in}} \times N_{\text{out}} = 6272 \times 128 = \mathbf{802,816}$$

---

### Type 7: Batch Normalization (`BatchNormalization`)

```python
# Input: (14, 14, 32)
model.add(layers.BatchNormalization())
```

- **Role:** Normalizes channel distributions across mini-batches; applies learnable affine transform ($y = \gamma \hat{x} + \beta$).
- **Input Shape:** $(14, 14, 32)$
- **Output Shape:** $\mathbf{(14, 14, 32)}$ _(Dimensions never change)_
- **Filter Tensor Shape:** None.
- **Neurons with Learnable Parameters:** $0$ (Normalizes incoming feature maps).
- **Parameters Formulas:**
  - **Trainable Parameters ($\gamma, \beta$):**
    $$\text{Trainable} = 2 \times C_{\text{in}} = 2 \times 32 = \mathbf{64}$$
  - **Non-trainable Parameters (running $\mu, \sigma^2$):**
    $$\text{Non-trainable} = 2 \times C_{\text{in}} = 2 \times 32 = \mathbf{64}$$
  - **Total Parameters:** $4 \times C_{\text{in}} = 4 \times 32 = \mathbf{128}$

---

### Type 8: Spatial Upsampling (`UpSampling2D`) & U-Net Skip Connection

```python
# Decoder path: Input is (14, 14, 32)
model.add(layers.UpSampling2D(size=(2, 2)))
```

- **Role:** Nearest-neighbor spatial expansion used in decoders / U-Net architectures to restore resolution.
- **Input Shape:** $(14, 14, 32)$
- **Output Shape Formula:**
  $$H_{\text{out}} = H_{\text{in}} \times U_h = 14 \times 2 = 28, \quad W_{\text{out}} = W_{\text{in}} \times U_w = 14 \times 2 = 28 \implies \mathbf{(28, 28, 32)}$$
- **Filter Tensor Shape:** None.
- **Neurons in this Layer:** $0$
- **Learnable Parameters:** $\mathbf{0}$

_(If concatenated with an encoder skip-connection tensor of shape $(28, 28, 16)$ via `layers.Concatenate(axis=-1)`: output becomes $(28, 28, 32 + 16) = \mathbf{(28, 28, 48)}$ with $\mathbf{0}$ parameters)._

---

# 3. Receptive Field (RF) Master Formulation

The receptive field ($RF$) measures the sub-region of the initial input that influences a single neuron at layer $l$.

### **Recursive Master Formulas:**

$$RF_l = RF_{l-1} + (F_l - 1) \cdot J_{l-1}$$
$$J_l = J_{l-1} \cdot S_l$$

- **Base conditions:** $RF_0 = 1$, $J_0 = 1$
- $F_l$ = filter/kernel size at layer $l$ (for Conv or Pool)
- $S_l$ = stride at layer $l$
- $J_l$ = cumulative stride / jump

### **Example Walkthrough:**

- **Input:** $RF_0 = 1$, $J_0 = 1$
- **Layer 1 (Conv2D: $F_1 = 3, S_1 = 1$):**
  $$RF_1 = 1 + (3 - 1) \cdot 1 = \mathbf{3}, \quad J_1 = 1 \cdot 1 = 1$$
- **Layer 2 (MaxPool: $F_2 = 2, S_2 = 2$):**
  $$RF_2 = 3 + (2 - 1) \cdot 1 = \mathbf{4}, \quad J_2 = 1 \cdot 2 = 2$$
- **Layer 3 (Conv2D: $F_3 = 3, S_3 = 1$):**
  $$RF_3 = 4 + (3 - 1) \cdot 2 = 4 + 4 = \mathbf{8}$$
  _(The neuron has an **$8 \times 8$ receptive field** on the original image)._

---

# 4. Master Calculation Matrix for the Exam

| Layer Type     | Configuration     |         Output Spatial Size ($N_{\text{out}}$)          | Output Channels ($C_{\text{out}}$) | Learnable Parameters Formula                                                           |
| :------------- | :---------------- | :-----------------------------------------------------: | :--------------------------------: | :------------------------------------------------------------------------------------- |
| **Conv2D**     | `padding="valid"` |    $\lfloor \frac{N_{\text{in}} - F}{S} \rfloor + 1$    |           Filters count            | $(F_h \times F_w \times C_{\text{in}} + 1) \times C_{\text{out}}$                      |
| **Conv2D**     | `padding="same"`  |         $\lceil \frac{N_{\text{in}}}{S} \rceil$         |           Filters count            | $(F_h \times F_w \times C_{\text{in}} + 1) \times C_{\text{out}}$                      |
| **Conv2D**     | `use_bias=False`  |                   Depends on padding                    |           Filters count            | $(F_h \times F_w \times C_{\text{in}}) \times C_{\text{out}}$                          |
| **Pool2D**     | Max / Avg         | $\lfloor \frac{N_{\text{in}}}{P_{\text{size}}} \rfloor$ |    Unchanged ($C_{\text{in}}$)     | $\mathbf{0}$                                                                           |
| **UpSample2D** | `size=(U, U)`     |                $N_{\text{in}} \times U$                 |    Unchanged ($C_{\text{in}}$)     | $\mathbf{0}$                                                                           |
| **Dense**      | `use_bias=True`   |                            —                            |       $N_{\text{out}}$ units       | $(N_{\text{in}} + 1) \times N_{\text{out}}$                                            |
| **Dense**      | `use_bias=False`  |                            —                            |       $N_{\text{out}}$ units       | $N_{\text{in}} \times N_{\text{out}}$                                                  |
| **BatchNorm**  | Default           |                        Unchanged                        |    Unchanged ($C_{\text{in}}$)     | **Trainable:** $2 \times C_{\text{in}}$<br>**Non-trainable:** $2 \times C_{\text{in}}$ |
