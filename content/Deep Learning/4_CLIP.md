# Part 1: Multitask Learning (MTL)

### 1. Conceptual Definition

- **Core Idea:** A single neural network is trained to jointly solve $T > 1$ related tasks simultaneously using shared internal representations.
- **Inductive Transfer:** According to Rich Caruana (1997), Multitask Learning acts as a form of inductive transfer. It improves generalization by leveraging the domain-specific information contained in the supervisory signals of related tasks:
  $$\text{What is learned for Task } A \text{ helps the model learn Task } B \text{ better.}$$

---

### 2. Architectural Paradigm (Hard Parameter Sharing)

As illustrated in Caruana’s architecture:

- **Shared Representation (Trunk):** The lower hidden layers are shared across all tasks. They map raw inputs into a generic feature space.
- **Task-Specific Heads:** The upper layers split into specialized output heads, each mapped to a specific task.

```
       Task 1        Task 2        Task 3        Task 4
         ↑             ↑             ↑             ↑
      [Head 1]      [Head 2]      [Head 3]      [Head 4]
         \             \             /             /
          -----------------------------------------
                              ↑
                    [ Shared Hidden Layers ]
                              ↑
                       [ Input: x ]
```

---

### 3. Mathematical Formulation

Given a dataset of $N$ samples, each with inputs $\mathbf{x}_i$ and target labels $y_i^{(t)}$ for $T$ different tasks:

$$\mathcal{L}_{\text{total}}(\mathbf{W}_{\text{shared}}, \mathbf{w}_1, \dots, \mathbf{w}_T) = \sum_{t=1}^T \lambda_t \mathcal{L}_t\left(f_t(\mathbf{x};\, \mathbf{W}_{\text{shared}}, \mathbf{w}_t),\, y^{(t)}\right)$$

- $\mathcal{L}_t$: The task-specific loss function (e.g., Cross-Entropy for classification, MSE for regression).
- $\lambda_t \ge 0$: Task weight/importance coefficient balancing competing gradient updates.
- $\mathbf{W}_{\text{shared}}$: Parameters updated by gradient contributions from **all** tasks:
  $$\nabla_{\mathbf{W}_{\text{shared}}} \mathcal{L}_{\text{total}} = \sum_{t=1}^T \lambda_t \nabla_{\mathbf{W}_{\text{shared}}} \mathcal{L}_t$$

---

### 4. Why Multitask Learning Works (Key Benefits)

1. **Implicit Data Augmentation:** Effectively increases sample size because diverse training signals average out task-specific noise.
2. **Regularization:** Prevents overfitting to a single task because the shared representation must satisfy multiple constraints simultaneously.
3. **Representation Learning:** Encourages the shared layers to extract robust, invariant, and transferable features.

---

# Part 2: Contrastive Learning

### 1. Conceptual Definition

- **Core Goal:** Learn an embedding space where semantically similar pairs (**positive pairs**) are pulled close together, while dissimilar pairs (**negative pairs**) are pushed far apart.
- **Key Difference from Standard ML:** Unlike traditional supervised learning that maps an input to a fixed target label, **contrastive loss is defined relatively**—an input's representation is judged entirely in relation to other inputs.
- **Feature Extraction:** Once trained, the classification/projection head is discarded, and the activations of the intermediate latent space (the unit hypersphere) are used for downstream tasks (linear probing, zero-shot transfer, retrieval).

---

### 2. Anchors, Positive Pairs, and Negative Pairs

For an arbitrary reference data point $\mathbf{x}$ (called the **Anchor**):

- **Positive Sample ($\mathbf{x}^+$):** A point semantically similar to $\mathbf{x}$.
  - _Unimodal (e.g., SimCLR):_ Two differently augmented views of the same image (crops, color jitters).
  - _Multimodal (e.g., CLIP):_ An image and its paired text caption.
- **Negative Samples ($\{\mathbf{x}_1^-, \mathbf{x}_2^-, \dots, \mathbf{x}_K^-\}$):** Dissimilar points (e.g., other unrelated images or mismatched captions in a mini-batch).

---

### 3. The InfoNCE Loss Function (Single Modality)

Let $f_{\mathbf{w}}(\mathbf{x})$ be an encoder mapping input $\mathbf{x}$ to a latent embedding. Embeddings are $\ell_2$-normalized onto the unit hypersphere:
$$\|f_{\mathbf{w}}(\mathbf{x})\|_2 = 1$$

The similarity between any two points is measured by **cosine similarity** (which equals the dot product for unit vectors):
$$\text{sim}(\mathbf{u}, \mathbf{v}) = \mathbf{u}^T \mathbf{v}$$

For an anchor $\mathbf{x}$, one positive sample $\mathbf{x}^+$, and $K$ negative samples $\{\mathbf{x}_j^-\}_{j=1}^K$, the **InfoNCE Loss** is defined as:

$$\mathcal{L}_{\text{InfoNCE}} = -\ln \left( \frac{\exp\left(\frac{f_{\mathbf{w}}(\mathbf{x})^T f_{\mathbf{w}}(\mathbf{x}^+)}{\tau}\right)}{\exp\left(\frac{f_{\mathbf{w}}(\mathbf{x})^T f_{\mathbf{w}}(\mathbf{x}^+)}{\tau}\right) + \sum_{j=1}^K \exp\left(\frac{f_{\mathbf{w}}(\mathbf{x})^T f_{\mathbf{w}}(\mathbf{x}_j^-)}{\tau}\right)} \right)$$

- $\tau > 0$: Temperature hyperparameter.
  - A smaller $\tau$ penalizes hard negative samples more aggressively.
- **Interpretation:** InfoNCE is mathematically identical to a **multi-class cross-entropy loss**, where the network is tasked with classifying the single positive pair among $K+1$ total candidate pairs.

---

### 4. Multimodal Contrastive Learning: CLIP (Radford et al., 2021)

![[4NN.png]]
_(Referring directly to the second slide: Cat image $\mathbf{x}^+$ paired with text $\mathbf{y}^+$ vs. negative text $\mathbf{y}^-$)_

In multimodal learning, inputs come from different domains (e.g., Image and Text):

- **Image Encoder:** $f_{\mathbf{w}}(\mathbf{x}) \in \mathbb{R}^D$ (e.g., Vision Transformer or ResNet), normalized such that $\|f_{\mathbf{w}}(\mathbf{x})\| = 1$.
- **Text Encoder:** $g_{\boldsymbol{\theta}}(\mathbf{y}) \in \mathbb{R}^D$ (e.g., Transformer), normalized such that $\|g_{\boldsymbol{\theta}}(\mathbf{y})\| = 1$.

#### **The Mini-Batch Formulation:**

Consider a mini-batch of $B$ paired samples $\{(\mathbf{x}_i, \mathbf{y}_i)\}_{i=1}^B$:

- $(\mathbf{x}_i, \mathbf{y}_i)$ forms a **positive pair** (an image and its true caption).
- For a given image $\mathbf{x}_i$, all other $B-1$ texts $\{\mathbf{y}_j\}_{j \neq i}$ in the batch serve as **negative captions**.
- For a given text $\mathbf{y}_i$, all other $B-1$ images $\{\mathbf{x}_j\}_{j \neq i}$ serve as **negative images**.

#### **Symmetric CLIP Loss Function:**

The overall objective optimizes both image-to-text and text-to-image classification:

$$\mathcal{L}_{\text{CLIP}} = \frac{1}{2}\left(\mathcal{L}_{\text{image}\to\text{text}} + \mathcal{L}_{\text{text}\to\text{image}}\right)$$

Where:
$$\mathcal{L}_{\text{image}\to\text{text}} = -\frac{1}{B}\sum_{i=1}^B \ln \left( \frac{\exp\left(\frac{f_{\mathbf{w}}(\mathbf{x}_i)^T g_{\boldsymbol{\theta}}(\mathbf{y}_i)}{\tau}\right)}{\sum_{j=1}^B \exp\left(\frac{f_{\mathbf{w}}(\mathbf{x}_i)^T g_{\boldsymbol{\theta}}(\mathbf{y}_j)}{\tau}\right)} \right)$$

$$\mathcal{L}_{\text{text}\to\text{image}} = -\frac{1}{B}\sum_{i=1}^B \ln \left( \frac{\exp\left(\frac{g_{\boldsymbol{\theta}}(\mathbf{y}_i)^T f_{\mathbf{w}}(\mathbf{x}_i)}{\tau}\right)}{\sum_{j=1}^B \exp\left(\frac{g_{\boldsymbol{\theta}}(\mathbf{y}_i)^T f_{\mathbf{w}}(\mathbf{x}_j)}{\tau}\right)} \right)$$

---

# Part 3: Quick Summary Table

| Dimension            | Multitask Learning (MTL)                                         | Contrastive Learning (e.g., CLIP, SimCLR)                             |
| :------------------- | :--------------------------------------------------------------- | :-------------------------------------------------------------------- |
| **Supervision Type** | Typically Supervised (multiple task targets $y^{(t)}$)           | Self-supervised or weakly supervised (pairs of inputs)                |
| **Objective**        | Optimize multiple task-specific prediction losses simultaneously | Maximize agreement of positive pairs while repelling negative pairs   |
| **Architecture**     | Shared trunk + multiple task-specific output heads               | One or two encoder backbones projected onto a shared unit sphere      |
| **Loss Formulation** | Weighted sum: $\sum \lambda_t \mathcal{L}_t$                     | InfoNCE / Softmax cross-entropy over similarity logits                |
| **Downstream Usage** | Run directly on the task output heads                            | Discard projection heads; reuse embeddings for zero-shot or retrieval |
