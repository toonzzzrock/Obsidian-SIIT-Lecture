# Part 1: Core Theoretical Foundations

### 1. The Gaussian Distribution & i.i.d. Assumption

- **Probability Density Function (PDF):** For a continuous random variable $X \sim \mathcal{N}(\mu, \sigma^2)$:
  $$p(x \mid \mu, \sigma^2) = \frac{1}{\sqrt{2\pi\sigma^2}} \exp\left(-\frac{(x - \mu)^2}{2\sigma^2}\right)$$
- **Independent and Identically Distributed (i.i.d.):** If data points $\mathcal{D} = \{x_1, x_2, \dots, x_N\}$ are i.i.d., the joint probability density factors into the product of individual marginal densities:
  $$p(\mathcal{D} \mid \mu, \sigma^2) = \prod_{i=1}^N p(x_i \mid \mu, \sigma^2)$$

---

### 2. Maximum Likelihood Estimation (MLE)

- **Goal:** Find the parameter values $\theta = \{\mu, \sigma^2\}$ that maximize the probability of having observed the data $\mathcal{D}$:
  $$\hat{\theta}_{\text{MLE}} = \arg\max_\theta L(\theta) = \arg\max_\theta p(\mathcal{D} \mid \theta)$$
- **Why use the Log-Likelihood $\ell(\theta) = \ln L(\theta)$?**
  1. **Numerical Stability:** Products of small probabilities cause numerical underflow; sums of logs do not.
  2. **Mathematical Tractability:** Log turns products into sums, simplifying differentiation:
     $$\ln \left(\prod_{i=1}^N A_i\right) = \sum_{i=1}^N \ln A_i$$
  3. **Preserves Extrema:** Because the natural logarithm is a strictly monotonically increasing function ($x_1 > x_2 \iff \ln x_1 > \ln x_2$), $\arg\max L(\theta) \equiv \arg\max \ln L(\theta)$.

---

### 3. Bayes' Theorem and Maximum A Posteriori (MAP)

- **Bayes’ Theorem:**
  $$p(\theta \mid \mathcal{D}) = \frac{p(\mathcal{D} \mid \theta) \, p(\theta)}{p(\mathcal{D})}$$
  - $p(\theta)$: **Prior** (our belief about $\theta$ before seeing data).
  - $p(\mathcal{D} \mid \theta)$: **Likelihood** (how probable the data is given $\theta$).
  - $p(\theta \mid \mathcal{D})$: **Posterior** (updated belief about $\theta$ after observing data).
  - $p(\mathcal{D}) = \int p(\mathcal{D} \mid \theta)p(\theta)\,d\theta$: **Evidence / Marginal Likelihood** (normalizing constant independent of $\theta$).

- **Maximum A Posteriori (MAP):**
  Instead of maximizing only the likelihood, MAP chooses the parameter value that maximizes the posterior:
  $$\hat{\theta}_{\text{MAP}} = \arg\max_\theta p(\theta \mid \mathcal{D}) = \arg\max_\theta \big[\ln p(\mathcal{D} \mid \theta) + \ln p(\theta)\big]$$
  _(Note: The marginal likelihood $p(\mathcal{D})$ is dropped because it does not depend on $\theta$.)_
- **Connection between MLE and MAP:**
  If the prior $p(\theta)$ is uniform (flat / non-informative), $\ln p(\theta)$ is constant, meaning **MAP reduces exactly to MLE**.

---

# Part 2: Practice Exam Questions & Solutions

---

## Example 1: Combining Gaussian Likelihood, Prior Knowledge, and MAP vs. MLE

### **Problem Statement**

An automated sensor measures ambient temperature $x$ in a server room. Individual readings are assumed to be independent and drawn from a Gaussian distribution:
$$x_i \sim \mathcal{N}(\mu, \sigma^2)$$
with a known variance $\sigma^2 = 4$ ($\sigma = 2$).

1. You collect $N = 4$ independent readings: $\mathcal{D} = \{21, 23, 22, 26\}$. Compute the **Maximum Likelihood Estimate (MLE)** for the mean $\mu$.
2. The server room manufacturer specifies that the ambient temperature typically follows a prior distribution:
   $$\mu \sim \mathcal{N}(\mu_0, \sigma_0^2), \quad \text{where } \mu_0 = 20 \text{ and } \sigma_0^2 = 1$$
   Derive the objective function for the **Maximum A Posteriori (MAP)** estimator of $\mu$ and find the analytical expression for $\hat{\mu}_{\text{MAP}}$.
3. Calculate the numerical value of $\hat{\mu}_{\text{MAP}}$ for the given data and explain how the prior influences the result compared to $\hat{\mu}_{\text{MLE}}$.

---

### **Step-by-Step Solution**

#### **Part 1: MLE Calculation**

The likelihood function for $N$ i.i.d. observations is:
$$L(\mu) = \prod_{i=1}^N \frac{1}{\sqrt{2\pi\sigma^2}} \exp\left(-\frac{(x_i - \mu)^2}{2\sigma^2}\right)$$
Taking the natural logarithm:
$$\ell(\mu) = \ln L(\mu) = -\frac{N}{2}\ln(2\pi\sigma^2) - \frac{1}{2\sigma^2} \sum_{i=1}^N (x_i - \mu)^2$$
To maximize with respect to $\mu$, set the derivative to zero:
$$\frac{d\ell(\mu)}{d\mu} = \frac{1}{\sigma^2} \sum_{i=1}^N (x_i - \mu) = 0 \implies \sum_{i=1}^N x_i - N\mu = 0$$
$$\hat{\mu}_{\text{MLE}} = \bar{x} = \frac{1}{N}\sum_{i=1}^N x_i$$
Given the data $\mathcal{D} = \{21, 23, 22, 26\}$ ($N = 4$):
$$\hat{\mu}_{\text{MLE}} = \frac{21 + 23 + 22 + 26}{4} = \frac{92}{4} = \mathbf{23.0^\circ\text{C}}$$

---

#### **Part 2: Analytical MAP Formulation**

By Bayes' Theorem:
$$p(\mu \mid \mathcal{D}) \propto p(\mathcal{D} \mid \mu) \, p(\mu)$$
Taking the log-posterior objective function:
$$\ln p(\mu \mid \mathcal{D}) = \ln p(\mathcal{D} \mid \mu) + \ln p(\mu) + \text{constant}$$
Substitute the Gaussian likelihood and the Gaussian prior $p(\mu) = \frac{1}{\sqrt{2\pi\sigma_0^2}} \exp\left(-\frac{(\mu - \mu_0)^2}{2\sigma_0^2}\right)$:
$$\ln p(\mu \mid \mathcal{D}) = -\frac{1}{2\sigma^2} \sum_{i=1}^N (x_i - \mu)^2 - \frac{(\mu - \mu_0)^2}{2\sigma_0^2} + \text{terms independent of } \mu$$

Differentiating with respect to $\mu$ and setting to 0:
$$\frac{d}{d\mu}\ln p(\mu \mid \mathcal{D}) = \frac{1}{\sigma^2}\sum_{i=1}^N (x_i - \mu) - \frac{\mu - \mu_0}{\sigma_0^2} = 0$$
$$\frac{N\bar{x} - N\mu}{\sigma^2} - \frac{\mu - \mu_0}{\sigma_0^2} = 0$$
$$\mu \left(\frac{N}{\sigma^2} + \frac{1}{\sigma_0^2}\right) = \frac{N\bar{x}}{\sigma^2} + \frac{\mu_0}{\sigma_0^2}$$
$$\hat{\mu}_{\text{MAP}} = \frac{\frac{N}{\sigma^2}\bar{x} + \frac{1}{\sigma_0^2}\mu_0}{\frac{N}{\sigma^2} + \frac{1}{\sigma_0^2}}$$

---

#### **Part 3: Numerical Computation & Comparison**

Substitute the given values:

- $\bar{x} = 23$, $N = 4$, $\sigma^2 = 4 \implies \frac{N}{\sigma^2} = \frac{4}{4} = 1$
- $\mu_0 = 20$, $\sigma_0^2 = 1 \implies \frac{1}{\sigma_0^2} = \frac{1}{1} = 1$

$$\hat{\mu}_{\text{MAP}} = \frac{(1)(23) + (1)(20)}{1 + 1} = \frac{43}{2} = \mathbf{21.5^\circ\text{C}}$$

**Interpretation:**

- $\hat{\mu}_{\text{MLE}} = 23.0^\circ\text{C}$ relies solely on the observed data.
- $\hat{\mu}_{\text{MAP}} = 21.5^\circ\text{C}$ is a precision-weighted average between the sample mean ($23^\circ\text{C}$) and the prior mean ($20^\circ\text{C}$).
- Because the sensor variance per sample is $4$ ($N=4$ gives effective variance $1$) and the prior variance is $1$, both data and prior carry equal weight, pulling the estimate halfway toward the prior.

---

## Example 2: Combining Gaussian Likelihoods with Bayesian Hypothesis Selection

### **Problem Statement**

An automated inspection station classifies ball bearings into two categories based on diameter deviations (in $\mu\text{m}$):

- **Hypothesis $H_1$ (Standard Grade):** Measurements follow $\mathcal{N}(\mu_1 = 0, \sigma^2 = 4)$.
- **Hypothesis $H_2$ (Precision Grade):** Measurements follow $\mathcal{N}(\mu_2 = 0, \sigma^2 = 1)$.

Prior operational data indicates that $80\%$ of manufactured bearings are Standard Grade ($P(H_1) = 0.8$), while $20\%$ are Precision Grade ($P(H_2) = 0.2$).

A quality engineer tests a batch by taking $N = 3$ independent measurements:
$$\mathcal{D} = \{0.8, -0.6, 0.4\}$$

1. Write down the likelihood function $p(\mathcal{D} \mid H)$ for an arbitrary hypothesis $H$ with parameters $(\mu, \sigma^2)$.
2. Calculate the likelihood of observing data $\mathcal{D}$ under $H_1$ and under $H_2$.
3. Using Bayes' Theorem, compute the posterior probability $P(H_2 \mid \mathcal{D})$. Determine which hypothesis is more likely given both the prior and the data.

---

### **Step-by-Step Solution**

#### **Part 1: Likelihood Formulation**

For $N$ i.i.d. Gaussian observations with mean $\mu = 0$ and variance $\sigma^2$:
$$p(\mathcal{D} \mid \sigma^2) = \prod_{i=1}^N \frac{1}{\sqrt{2\pi\sigma^2}}\exp\left(-\frac{x_i^2}{2\sigma^2}\right) = \left(2\pi\sigma^2\right)^{-N/2} \exp\left(-\frac{\sum_{i=1}^N x_i^2}{2\sigma^2}\right)$$

Compute the sum of squared deviations from the data $\mathcal{D} = \{0.8, -0.6, 0.4\}$:
$$\sum_{i=1}^3 x_i^2 = (0.8)^2 + (-0.6)^2 + (0.4)^2 = 0.64 + 0.36 + 0.16 = 1.16$$

---

#### **Part 2: Calculating Likelihoods**

- **Under $H_1$ ($\sigma_1^2 = 4$, $\sigma_1 = 2$):**
  $$p(\mathcal{D} \mid H_1) = (2\pi \cdot 4)^{-3/2} \exp\left(-\frac{1.16}{2 \cdot 4}\right) = (8\pi)^{-1.5} \exp(-0.145)$$
  $$8\pi \approx 25.1327 \implies (25.1327)^{1.5} \approx 125.99$$
  $$\exp(-0.145) \approx 0.8650$$
  $$p(\mathcal{D} \mid H_1) = \frac{0.8650}{125.99} \approx \mathbf{0.006866}$$

- **Under $H_2$ ($\sigma_2^2 = 1$, $\sigma_2 = 1$):**
  $$p(\mathcal{D} \mid H_2) = (2\pi \cdot 1)^{-3/2} \exp\left(-\frac{1.16}{2 \cdot 1}\right) = (2\pi)^{-1.5} \exp(-0.58)$$
  $$2\pi \approx 6.2832 \implies (6.2832)^{1.5} \approx 15.7496$$
  $$\exp(-0.58) \approx 0.5599$$
  $$p(\mathcal{D} \mid H_2) = \frac{0.5599}{15.7496} \approx \mathbf{0.03555}$$

_(Notice that the data is roughly $5.18$ times more likely under $H_2$ because the deviations are tight around zero)._

---

#### **Part 3: Applying Bayes' Theorem**

Using Bayes' rule:
$$P(H_2 \mid \mathcal{D}) = \frac{p(\mathcal{D} \mid H_2) P(H_2)}{p(\mathcal{D})}$$
where the marginal likelihood (total probability) is:
$$p(\mathcal{D}) = p(\mathcal{D} \mid H_1) P(H_1) + p(\mathcal{D} \mid H_2) P(H_2)$$

Compute numerator and denominator terms:

- $p(\mathcal{D} \mid H_1) P(H_1) = 0.006866 \times 0.8 = 0.005493$
- $p(\mathcal{D} \mid H_2) P(H_2) = 0.03555 \times 0.2 = 0.007110$

Total evidence:
$$p(\mathcal{D}) = 0.005493 + 0.007110 = 0.012603$$

Posterior probability of $H_2$:
$$P(H_2 \mid \mathcal{D}) = \frac{0.007110}{0.012603} \approx \mathbf{0.564} \quad (56.4\%)$$
$$P(H_1 \mid \mathcal{D}) = 1 - P(H_2 \mid \mathcal{D}) \approx \mathbf{0.436} \quad (43.6\%)$$

**Conclusion:**
Even though $H_1$ was four times more probable a priori ($80\%$ vs. $20\%$), the tight clustering of the observed measurements provides strong enough evidence in favor of $H_2$ that the posterior probability of **$H_2$ (Precision Grade)** exceeds $50\%$ ($56.4\%$), making **$H_2$ the more likely hypothesis**.

---

### Quick Comparison Summary for the Exam

| Property        | Maximum Likelihood (MLE)                     | Maximum A Posteriori (MAP)                              | Bayesian Hypothesis Testing                                     |
| :-------------- | :------------------------------------------- | :------------------------------------------------------ | :-------------------------------------------------------------- |
| **Formula**     | $\arg\max_\theta p(\mathcal{D} \mid \theta)$ | $\arg\max_\theta p(\mathcal{D} \mid \theta)p(\theta)$   | $P(H_k \mid \mathcal{D}) \propto p(\mathcal{D} \mid H_k)P(H_k)$ |
| **Uses Prior?** | No                                           | Yes                                                     | Yes                                                             |
| **Output**      | Point estimate $\hat{\theta}$                | Point estimate $\hat{\theta}$                           | Posterior probability distribution over discrete hypotheses     |
| **When to Use** | When no prior belief is assumed or available | When prior distribution on continuous parameters exists | When deciding between discrete competing models                 |
