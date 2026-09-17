This study guide is organized as an exam-preparation reference for 4th-year Computer Engineering students taking Computer Vision / Digital Image Processing. It covers the physics, mathematical foundations, algorithmic mechanics, and computer engineering trade-offs across Chapters 1 through 5.

---

# Chap. 1: Image Acquisition

## 1. Digital Cameras & Image Sensors (CCD vs. CMOS)

Digital cameras convert photons (light energy) into discrete digital values ($[0, 255]$ for an 8-bit channel).

- **Charge-Coupled Device (CCD):**
  - _Mechanism:_ Incoming photons generate photoelectrons trapped in potential wells. During readout, these charge packets are shifted row-by-row into a horizontal shift register and converted to voltage at a single readout amplifier, followed by an external Analog-to-Digital Converter (ADC).
  - _Characteristics:_ High signal-to-noise ratio (SNR), high dynamic range, uniform response, but high power consumption and slow readouts.
  - _Shutter mechanism:_ Inherently supports **Global Shutter** (all pixels expose and transfer charge simultaneously).
- **Complementary Metal-Oxide-Semiconductor (CMOS):**
  - _Mechanism:_ Every individual pixel (Active Pixel Sensor - APS) contains its own photodiode, reset transistor, source-follower amplifier, and row-select transistor. Column-parallel ADCs convert signals directly on the chip.
  - _Characteristics:_ Fast, low power, cheaper to fabricate on standard silicon lines, but introduces fixed-pattern noise (FPN) requiring Correlated Double Sampling (CDS).
  - _Shutter mechanism:_ Typically uses **Rolling Shutter** (rows are exposed and read sequentially).
  - _CV Implication of Rolling Shutter:_ Rapidly moving objects undergo geometric distortions (e.g., rotating fan blades appear curved, vertical poles lean horizontally during rapid camera panning).

```
   Rolling Shutter Exposure:                 Distortion Effect on Moving Car:
   Row 0: |---|                                  /======\
   Row 1:   |---|                               /        \
   Row 2:     |---|            ====>           /__________\
   Row 3:       |---|                         (O)        (O)  (Sheared shape)
         Time --->
```

---

## 2. Thin Lens Optics (with Grade 12 Lens Physics)

### The Thin Lens Formula and Sign Conventions

A thin lens has a thickness negligible compared to its radii of curvature. The interaction between object distance ($d_o$), image distance ($d_i$), and focal length ($f$) is governed by the **Gaussian Thin Lens Equation**:

$$\frac{1}{f} = \frac{1}{d_o} + \frac{1}{d_i}$$

#### Cartesian / Real-is-Positive Sign Convention:

- $f > 0$ for converging (convex) lenses; $f < 0$ for diverging (concave) lenses.
- $d_o > 0$ for a real object in front of the lens.
- $d_i > 0$ if the image is **real** (formed behind the lens, captured by an image sensor).
- $d_i < 0$ if the image is **virtual** (formed on the same side as the object, cannot be projected onto a sensor).

#### Linear (Lateral) Magnification ($m$):

$$m = \frac{h_i}{h_o} = -\frac{d_i}{d_o}$$

- $h_o$ is object height, $h_i$ is image height.
- If $m < 0$, the image is **inverted** (standard real image on camera sensor).
- If $|m| < 1$, the image is diminished; if $|m| > 1$, it is magnified.

#### Lensmaker's Equation:

$$\frac{1}{f} = (n - 1)\left( \frac{1}{R_1} - \frac{1}{R_2} \right)$$
Where $n$ is the refractive index of the glass, and $R_1, R_2$ are the radii of curvature of the two lens surfaces.

---

### Grade 12 Physics Exam-Style Worked Problem

#### Problem:

A robot vision camera uses a thin biconvex lens with a focal length of $f = 50\text{ mm}$.

1. A marker of height $h_o = 120\text{ mm}$ is positioned at a distance of $d_o = 1.05\text{ m}$ ($1050\text{ mm}$) along the optical axis.
   - Calculate the distance $d_i$ behind the lens where the CMOS sensor must be placed to obtain a sharp image.
   - Compute the lateral magnification $m$ and the size of the marker projected onto the sensor $h_i$.
2. If the marker suddenly moves to $d_o' = 30\text{ mm}$ in front of the lens, determine the new image distance $d_i'$, state whether the image can be captured by the sensor, and explain why.

---

#### Solution:

**Part 1:**
Given:

- $f = +50\text{ mm}$
- $d_o = +1050\text{ mm}$
- $h_o = 120\text{ mm}$

Using the thin lens equation:
$$\frac{1}{d_i} = \frac{1}{f} - \frac{1}{d_o} = \frac{1}{50} - \frac{1}{1050}$$
Find a common denominator:
$$\frac{1}{d_i} = \frac{21}{1050} - \frac{1}{1050} = \frac{20}{1050} = \frac{1}{52.5\text{ mm}}$$
$$d_i = +52.5\text{ mm}$$
_(The sensor must be placed $52.5\text{ mm}$ behind the lens optical center)._

Magnification:
$$m = -\frac{d_i}{d_o} = -\frac{52.5}{1050} = -0.05$$
_(The image is inverted and scaled down to $5\%$ of original size)._

Image size on sensor:
$$h_i = m \cdot h_o = -0.05 \cdot 120\text{ mm} = -6.0\text{ mm}$$
The height of the marker on the sensor is **$6.0\text{ mm}$ (inverted)**.

---

**Part 2:**
Given:

- $d_o' = +30\text{ mm}$
- $f = +50\text{ mm}$

$$\frac{1}{d_i'} = \frac{1}{f} - \frac{1}{d_o'} = \frac{1}{50} - \frac{1}{30} = \frac{3 - 5}{150} = -\frac{2}{150} = -\frac{1}{75\text{ mm}}$$
$$d_i' = -75\text{ mm}$$

**Conclusion & Justification:**
$d_i' < 0$, which signifies a **virtual, upright image** located $75\text{ mm}$ on the _object's_ side of the lens. A physical CMOS sensor placed behind the lens **cannot** capture this image because the rays diverge after exiting the lens and do not physically converge onto a focal plane.

---

## 3. Camera Parameters & The Exposure Triangle

Exposure is the total quantity of light energy reaching the sensor per unit area:
$$\text{Exposure} \propto \text{Scene Illuminance} \times \Delta t \times \frac{1}{N^2}$$

```
                           EXPOSURE TRIANGLE
                            Aperture (f-stop)
                             /             \
                   Depth of Field       Motion Blur
                         /                     \
      Shutter Speed  -------------------------  ISO Sensitivity
                              Sensor Noise
```

### 1. Aperture & F-Number ($N$)

- The aperture is the physical opening diameter ($D$) of the diaphragm.
- **F-number ($N$):** Defined as the ratio of focal length to pupil diameter:
  $$N = \frac{f}{D} \implies D = \frac{f}{N}$$
- Standard f-stops follow a $\sqrt{2}$ factor sequence: $f/1.4, f/2, f/2.8, f/4, f/5.6, f/8, f/11, f/16, f/22$.
- Each step up cuts the aperture area ($A = \frac{\pi D^2}{4}$) by half, reducing light transmission by $50\%$.

### 2. Shutter Speed ($\Delta t$)

- The duration the sensor collects photons (e.g., $1/1000\text{ s}$ to $1/30\text{ s}$).
- _Fast shutter:_ Freezes high-speed motion; requires high illumination or wide aperture.
- _Slow shutter:_ Collects more photons in low light; introduces **motion blur**, which acts as a low-pass directional filter in spatial domain:
  $$g(x,y) = \int_0^T f(x - x_0(t), y - y_0(t)) \, dt$$

### 3. ISO Sensitivity

- The analog and digital gain applied to the voltage read from the photodiodes before ADC quantization.
- _Trade-off:_ Doubling ISO doubles signal brightness without changing the physical photon count, which directly amplifies background thermal noise and shot noise, degrading the **Signal-to-Noise Ratio (SNR)**.

---

## 4. Depth of Field (DOF) & Circle of Confusion (CoC)

- **Circle of Confusion ($c$):** When an object is out of focus, a point source in object space is projected not onto an infinitesimal point on the sensor, but as a disk of blur. The maximum blur diameter that the human eye or sensor pixel grid considers indistinguishable from a sharp point is $c$.
- **Depth of Field:** The distance range in front of and behind the focused distance ($d_o$) where blur remains $\le c$.
- **Hyperfocal Distance ($H$):** The closest focus distance at which DOF extends to infinity:
  $$H \approx \frac{f^2}{N \cdot c}$$
- **Near and Far Limits:**
  $$D_{\text{near}} = \frac{H \cdot d_o}{H + (d_o - f)}, \quad D_{\text{far}} = \frac{H \cdot d_o}{H - (d_o - f)}$$
- _Engineering rule:_
  - Large Aperture (small $N$, e.g., $f/1.4$) $\to$ **Shallow DOF** (background is blurred; useful for portrait segmentation).
  - Small Aperture (large $N$, e.g., $f/16$) $\to$ **Deep DOF** (entire scene in focus; ideal for SLAM / visual odometry).

---

## 5. Auto-Focus (AF)

| Mechanism                        | Operating Principle                                                                                                                                                      | Advantages                                                                                 | Disadvantages                                                                                         |
| :------------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :----------------------------------------------------------------------------------------- | :---------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------- |
| **CDAF (Contrast Detection AF)** | Evaluates image high frequencies (spatial gradient variance via Sobel/Laplacian). Stepper motor sweeps lens until focus measure peaks: $F = \sum                         | \nabla I                                                                                   | ^2$.                                                                                                  | Highly accurate; no calibration needed; uses the primary imaging sensor. | Slow "hunting" behavior (lens overshoots to verify peak); struggles in low-contrast scenes. |
| **PDAF (Phase Detection AF)**    | Employs dedicated microlenses/masked pixel pairs splitting light exiting opposing sides of lens exit pupil. Measures horizontal phase shift $\Delta x$ between two rays. | Fast, single-shot calculation; directly tells the direction and distance to move the lens. | Historically required separate sensor; complex pixel fabrication on sensor (masked photodiode pairs). |

---

## 6. White Balance (WB) & Chromatic Adaptation

- **Color Temperature ($T$):** Measured in Kelvin (K), following Planckian blackbody radiation.
  - Tungsten light $\approx 2800\text{ K}$ (red/orange-shifted).
  - Daylight $\approx 5500\text{ K} - 6500\text{ K}$ (neutral).
  - Overcast / Shade $\approx 7500\text{ K} - 9000\text{ K}$ (blue-shifted).
- **Von Kries Chromatic Adaptation Model:**
  Assumes illumination changes can be modeled as independent diagonal gain adjustments per sensor color channel:
  $$\begin{bmatrix} R' \\ G' \\ B' \end{bmatrix} = \begin{bmatrix} k_R & 0 & 0 \\ 0 & k_G & 0 \\ 0 & 0 & k_B \end{bmatrix} \begin{bmatrix} R \\ G \\ B \end{bmatrix}$$
- **Gray-World Assumption:** Assumes the spatial average of reflectance in an arbitrary natural scene is achromatic neutral gray ($R_{\text{avg}} = G_{\text{avg}} = B_{\text{avg}}$).
  $$k_R = \frac{G_{\text{avg}}}{R_{\text{avg}}}, \quad k_G = 1, \quad k_B = \frac{G_{\text{avg}}}{B_{\text{avg}}}$$

---

# Chap. 2: Digital Image Fundamentals

```
Continuous World                Sampling               Quantization           Digital Image
f(x, y) Continuous  ======>  Spatial Grid (M x N)  ===>  Discrete Levels (L)  ===> Matrix I[r, c]
```

## 1. The Sampling Theorem & Aliasing

- **Sampling:** Discretization of the continuous spatial coordinates $(x, y)$ onto a 2D lattice.
- **Nyquist-Shannon Theorem:** To reconstruct a continuous 2D spatial signal containing maximum spatial frequencies $(u_{\max}, v_{\max})$ without information loss, the sampling frequencies $(f_s^x, f_s^y)$ must satisfy:
  $$f_s^x > 2 u_{\max}, \quad f_s^y > 2 v_{\max}$$
- **Aliasing:** When sampling frequency $f_s \le 2 f_{\max}$, high-frequency scene details fold back (mirror) into lower frequencies:
  $$f_{\text{alias}} = |f - k f_s|$$
  - _Visual artifacts:_ Moiré patterns (stripes on brick walls or fine fabric), jagged step edges ("jaggies").
  - _Antialiasing Solution:_ Place an **Optical Low-Pass Filter (OLPF)** (birefringent quartz crystal) in front of the sensor to blur out frequencies beyond the sensor's Nyquist limit prior to sampling.

```
       Continuous Wave (High freq):   /\  /\  /\  /\  /\  /\  /\  /\
       Sampling Points (*):          *       *       *       *
       Reconstructed (Aliased):      \_______/       \_______/  (Lower freq!)
```

### Slit Animation (Barrier-Grid / Picket-Fence Effect)

Slit animation overlay utilizes a moving set of vertical slits (grating) over an interlaced composite printed image. This is a physical demonstration of spatial subsampling:

- The barrier allows the eye to integrate only a specific phase-shifted spatial sample of the underlying image at any given position.
- When the slit raster translates horizontally by distance $\Delta x$, the visible spatial sample steps to the next phase, producing the illusion of smooth temporal motion.
- In computer vision, this physical phenomenon parallels **temporal aliasing** (wagon-wheel effect in video frame acquisition) and spatial phase sampling in structured-light 3D scanners.

---

## 2. Quantization & Dynamic Range

- **Quantization:** Discretization of continuous light amplitude (radiance) into $L$ integer levels.
  $$L = 2^b \quad (b = \text{bit depth, typically } 8, 10, \text{ or } 12 \text{ bits/pixel})$$
- **Uniform Quantizer:** Maps an intensity interval $[0, I_{\max}]$ into steps of width $\Delta = \frac{I_{\max}}{L}$.
- **False Contouring:** Occurs when bit-depth is too low ($b \le 4$). Smooth gradients show discrete step-like boundaries because quantization noise becomes correlated with image content.

---

## 3. Bit-Plane Decomposition & Digital Watermarking

An 8-bit grayscale pixel can be decomposed into an 8-term binary sum:
$$I(x,y) = \sum_{k=0}^{7} b_k(x,y) \cdot 2^k$$
Where $b_0$ is the **Least Significant Bit (LSB)** and $b_7$ is the **Most Significant Bit (MSB)**.

```
Bit Plane 7 (MSB): [ 128 ] -> Contains structural, edge, and major contrast data.
Bit Plane 6:       [  64 ] -> High structural information.
...
Bit Plane 1:       [   2 ] -> Visually indistinct, high spatial variation.
Bit Plane 0 (LSB): [   1 ] -> Appears as pure random noise; carries ~0.4% luminance impact.
```

### Digital Watermarking via LSB Insertion

Since bit-plane 0 contributes imperceptibly to human vision, we can replace $b_0$ with a binary secret payload/watermark $W(x,y) \in \{0, 1\}$:

$$I_{\text{watermarked}}(x,y) = \Big( I(x,y) \ \& \ \sim 1 \Big) \ | \ W(x,y)$$

- **Trade-off & Vulnerability:**
  - _Advantage:_ Extremely fast $O(1)$ encoding; zero perceptual degradation.
  - _Critical Weakness:_ Fragile. Any JPEG lossy compression, histogram equalization, spatial filtering (LPF), or cropping strips or corrupts the LSB entirely. For robustness, watermarks must be inserted in the frequency domain (e.g., mid-band DCT or DWT coefficients).

---

# Chap. 3: Intensity Transformations & Image Quality

Intensity transformations operate purely on single pixels: $s = T(r)$, where $r$ is input intensity and $s$ is output intensity.

```
          s (Output)
         1.0 |      / (Log / Gamma < 1)  - Expands dark tones
             |    /
             |  /   (Identity: s = r)
             | /
             |/____ (Gamma > 1)          - Compresses dark tones
             0------------------ 1.0  r (Input)
```

## 1. Log Transformations

$$s = c \cdot \log(1 + r)$$

- **Function:** Stretches the dynamic range of low, dark pixel values while heavily compressing higher, bright values.
- **Primary Application:** Displaying the **Fourier Transform 2D Magnitude Spectrum** $|F(u,v)|$. Dynamic range in frequency space can span $10^6$ units; the DC component overwhelms the display unless scaled logarithmically:
  $$D(u,v) = c \cdot \log(1 + |F(u,v)|)$$

---

## 2. Power-Law (Gamma) Transformations

$$s = c \cdot r^\gamma \quad (r, s \in [0, 1])$$

- **Case $\gamma < 1$:** The curve bends upward. Low intensities are mapped to broader ranges of output $\implies$ **Brightens dark shadows**, revealing obscured details in underexposed scenes.
- **Case $\gamma > 1$:** The curve bends downward. High intensities are expanded, darks are compressed $\implies$ **Darkens overall image**, increases high-end contrast in washed-out/overexposed scenes.
- **Display Gamma Correction:** Standard displays have a natural non-linear response of approximately $\gamma \approx 2.2$. Video pipelines pre-compensate by applying $s = r^{1/2.2}$ so the combined physical output is linear:
  $$(r^{1/\gamma})^\gamma = r$$

---

## 3. Histogram Equalization (HE)

### Mathematical Derivation (Continuous Domain)

Let $r \in [0, 1]$ be continuous pixel intensities with Probability Density Function (PDF) $p_r(r)$.
We seek an invertible, monotonically increasing transformation $s = T(r)$ such that output PDF $p_s(s)$ is uniform: $p_s(s) = 1$ over $[0, 1]$.

From fundamental probability theory for transformed random variables:
$$p_s(s) \left| \frac{ds}{dr} \right|^{-1} = p_r(r) \implies p_s(s) = p_r(r) \left| \frac{dr}{ds} \right|$$
Since we require $p_s(s) = 1$:
$$1 = p_r(r) \frac{dr}{ds} \implies ds = p_r(r) \, dr$$
Integrating both sides:
$$s = T(r) = \int_0^r p_r(w) \, dw = F_r(r) \quad \text{(The Cumulative Distribution Function, CDF!)}$$

### Discrete Transformation Algorithm

For an $M \times N$ image with $L$ discrete levels ($[0, L-1]$):

1.  **Compute Histogram:** Count pixel frequencies $n_k$ for each intensity $r_k$, where $k \in [0, L-1]$.
2.  **Compute Discrete PDF:**
    $$p_r(r_k) = \frac{n_k}{M \cdot N}$$
3.  **Compute Discrete CDF and Mapping Function:**
    $$s_k = T(r_k) = \text{round}\left( (L - 1) \sum_{j=0}^{k} p_r(r_j) \right)$$
4.  **Remap Pixels:** Assign each original pixel with value $r_k$ to new value $s_k$.

- _Usage & Artifacts:_ Automatically enhances global contrast across flatly illuminated or hazy images.
- _Limitation:_ Often amplifies background noise and causes unnatural, harsh visual artifacts because it acts globally. This motivates **CLAHE (Contrast Limited Adaptive Histogram Equalization)** for local regions.

---

## 4. Image Quality Assessment (IQA) Metrics

Let $I_1$ be the ground-truth/reference image and $I_2$ be the degraded/test image of size $M \times N$.

### 1. Root Mean Squared Error (RMSE)

$$\text{MSE} = \frac{1}{M N}\sum_{x=0}^{M-1} \sum_{y=0}^{N-1} [I_1(x,y) - I_2(x,y)]^2$$
$$\text{RMSE} = \sqrt{\text{MSE}}$$
_Measures absolute pixel-by-pixel intensity error. Simple, but poorly correlated with human perceptual judgment (e.g., uniform 1-pixel shift yields high RMSE despite high perceptual quality)._

### 2. Peak Signal-to-Noise Ratio (PSNR)

$$\text{PSNR} = 10 \cdot \log_{10} \left( \frac{\text{MAX}_I^2}{\text{MSE}} \right) \quad (\text{dB})$$

- For an 8-bit image, $\text{MAX}_I = 255 \implies \text{MAX}_I^2 = 65025$.
- Typical acceptable lossy image compression values: $30\text{ dB} - 50\text{ dB}$.
- If $\text{MSE} \to 0$, $\text{PSNR} \to \infty$.

### 3. Zero-Mean Normalized Cross-Correlation (ZNCC)

Used extensively for template matching and stereo depth disparity:
$$\text{ZNCC} = \frac{\sum_{x,y} \Big( I_1(x,y) - \bar{I}_1 \Big) \Big( I_2(x,y) - \bar{I}_2 \Big)}{\sqrt{\sum_{x,y} \Big( I_1(x,y) - \bar{I}_1 \Big)^2 \sum_{x,y} \Big( I_2(x,y) - \bar{I}_2 \Big)^2}}$$

- **Key Property:** Normalized to $[-1, 1]$. Invariant to affine illumination shifts ($I_2 = a \cdot I_1 + b$ where $a > 0$), making it robust against changing lighting conditions.

### 4. Structural Similarity Index Measure (SSIM)

SSIM evaluates visual degradation by decomposing the evaluation into three orthogonal terms: Luminance, Contrast, and Structure.

$$\text{SSIM}(x, y) = [l(x, y)]^\alpha \cdot [c(x, y)]^\beta \cdot [s(x, y)]^\gamma$$
Setting weights $\alpha = \beta = \gamma = 1$:
$$\text{SSIM}(x, y) = \frac{(2\mu_x\mu_y + C_1)(2\sigma_{xy} + C_2)}{(\mu_x^2 + \mu_y^2 + C_1)(\sigma_x^2 + \sigma_y^2 + C_2)}$$
Where:

- $\mu_x, \mu_y$: Local mean intensities (luminance estimation).
- $\sigma_x^2, \sigma_y^2$: Local sample variances (contrast estimation).
- $\sigma_{xy}$: Cross-covariance between patches $x$ and $y$ (structural correlation).
- $C_1 = (K_1 L)^2, C_2 = (K_2 L)^2$: Regularization constants (with $K_1=0.01, K_2=0.03$) to prevent division by zero when local denominators vanish.
- $\text{SSIM} \in [-1, 1]$, where $1.0$ indicates structural identity.

---

# Chap. 4: Color Models

## 1. Color Filter Array (CFA) & Demosaicing

Digital image sensors are inherently panchromatic (color-blind, counting incoming photons regardless of wavelength). To construct a color image, an absorption filter mask is deposited over the pixel array.

```
       Bayer Filter Layout (2 x 2 Repeat Pattern):
       +-------+-------+
       |   R   |   G   |   -> Red:   25% of surface
       +-------+-------+
       |   G   |   B   |   -> Green: 50% of surface
       +-------+-------+   -> Blue:  25% of surface
```

- **Why 50% Green?** The human visual system's photopic luminous efficiency function peaks at $\approx 555\text{ nm}$ (green band). The eye is significantly more sensitive to spatial detail/sharpness in green wavelengths than in red or blue.
- **Demosaicing:** The process of interpolating missing color components at each pixel location.
  - _Bilinear Demosaicing:_ Reconstructs missing channels by averaging immediate orthogonal or diagonal neighbors of that specific missing color.
    $$\hat{G}(i, j) = \frac{1}{4} [G(i-1, j) + G(i+1, j) + G(i, j-1) + G(i, j+1)]$$
  - _Flaw:_ Bilinear filtering blurs across high-contrast edges, resulting in high-frequency "zipper artifacts" (color fringes) along sharp boundaries. Advanced algorithms use edge-directed color-difference interpolation ($R - G$ and $B - G$).

---

## 2. RGB Color Model

- **Coordinate Representation:** Additive color space formed by a unit cube with axes Red, Green, and Blue $\in [0, 1]$ or $[0, 255]$.
- **Vertices:**
  - $(0,0,0) =$ Black, $(1,1,1) =$ White.
  - Main diagonal connects Black to White (Achromatic Gray Line).
- **Limitation in Computer Vision:**
  - **Coupled Chrominance and Luminance:** If a shadow falls across an object, all three color channels $(R, G, B)$ scale down proportionally.
  - Pixel-level color tracking using RGB Euclidean distance is susceptible to false positives/negatives under variable lighting conditions.

---

## 3. HSI / HSV Color Model

Decouples chromatic information (color content) from achromatic light intensity (illumination).

```
                 HUE (Angle 0 to 360 deg)
                        Red (0 deg)
                      /            \
          Magenta                    Yellow (60 deg)
            |                             |
       Blue (240 deg)                Green (120 deg)
                      \            /
                           Cyan

       Saturation: Radial distance from center (0 at axis, 1 at boundary).
       Intensity / Value: Vertical axis (0 at bottom, 1 at top).
```

- **Hue ($H \in [0^\circ, 360^\circ]$):** Encodes the pure dominant wavelength of the color.
- **Saturation ($S \in [0, 1]$):** Encodes the degree of dilution by white light (purity).
- **Intensity ($I$) or Value ($V$):** Encodes brightness / energy.
  $$I = \frac{R + G + B}{3}, \quad V = \max(R, G, B)$$

### RGB to HSI Conversion Math

Given $R, G, B$ normalized to $[0, 1]$:

$$I = \frac{1}{3}(R + G + B)$$

$$S = 1 - \frac{3}{(R + G + B)} \min(R, G, B) \quad (\text{if } R+G+B > 0, \text{ else } S=0)$$

$$
H = \begin{cases}
\theta & \text{if } B \le G \\
360^\circ - \theta & \text{if } B > G
\end{cases}
$$

Where:
$$\theta = \arccos \left( \frac{\frac{1}{2}[(R - G) + (R - B)]}{\sqrt{(R - G)^2 + (R - B)(G - B)}} \right)$$

### Computer Vision Engineering Application: Robust Color Segmentation

In tasks such as autonomous vehicle lane marking or traffic cone tracking, illumination varies widely (direct sunlight vs. shadows).

- _Method:_ Convert input image to HSV/HSI. Discard or widen threshold on the $V$ or $I$ channel; place tight bounding thresholds solely on the Hue channel ($H_{\min} \le H \le H_{\max}$) and a minimum Saturation threshold ($S \ge S_{\min}$).
- _Result:_ Targets inside shadows are segmented accurately because shadow alters $V$ while leaving $H$ largely unchanged.

---

# Chap. 5 (Part 1): Image Filtering in the Spatial Domain

## 1. Spatial Filtering Basics: Correlation vs. Convolution

For an image $f(x,y)$ and a $(2a+1) \times (2b+1)$ kernel $w(s,t)$:

- **2D Cross-Correlation ($f \otimes w$):**
  $$(f \otimes w)(x, y) = \sum_{s=-a}^{a} \sum_{t=-b}^{b} w(s, t) \, f(x + s, \, y + t)$$
- **2D Convolution ($f * w$):**
  $$(f * w)(x, y) = \sum_{s=-a}^{a} \sum_{t=-b}^{b} w(s, t) \, f(x - s, \, y - t)$$
- _Difference:_ Convolution requires **flipping the kernel by $180^\circ$** prior to sliding. If the kernel is symmetric ($w(s,t) = w(-s,-t)$, like a Gaussian kernel), correlation and convolution produce identical results.

---

## 2. Linear Filters

### A. Low-Pass Filters (LPF) / Smoothing Filters

Attenuate high spatial frequencies (edges, fine details, noise) while preserving low spatial frequencies (homogeneous backgrounds).

#### 1. Box Filter (Mean/Average)

Every kernel element has an identical weight:
$$W_{\text{box}} = \frac{1}{9}\begin{bmatrix} 1 & 1 & 1 \\ 1 & 1 & 1 \\ 1 & 1 & 1 \end{bmatrix}$$
_Drawback:_ Poor frequency response; produces ringing and harsh, rectangular blur artifacts.

#### 2. Gaussian Filter

The standard continuous isotropic 2D Gaussian function is:
$$G(x,y) = \frac{1}{2\pi\sigma^2} e^{-\frac{x^2+y^2}{2\sigma^2}}$$

- Kernel values decay smoothly away from the center pixel.
- _Advantage:_ Isotropic (rotationally invariant), eliminates high frequencies without introducing ringing artifacts in the frequency domain.

---

### B. High-Pass Filters (HPF) & Sharpening

Attenuate low frequencies and amplify high frequencies (emphasize discontinuities, step edges, and fine details).

#### 1. Laplacian Filter (2nd-order differential)

Isotropic operator tracking second derivatives:
$$\nabla^2 f = \frac{\partial^2 f}{\partial x^2} + \frac{\partial^2 f}{\partial y^2}$$

Finite difference approximation:
$$\frac{\partial^2 f}{\partial x^2} \approx f(x+1, y) + f(x-1, y) - 2f(x,y)$$
$$\frac{\partial^2 f}{\partial y^2} \approx f(x, y+1) + f(x, y-1) - 2f(x,y)$$
Yielding the standard 4-neighbor and 8-neighbor discrete kernels:
$$\nabla^2_4 = \begin{bmatrix} 0 & 1 & 0 \\ 1 & -4 & 1 \\ 0 & 1 & 0 \end{bmatrix}, \quad \nabla^2_8 = \begin{bmatrix} 1 & 1 & 1 \\ 1 & -8 & 1 \\ 1 & 1 & 1 \end{bmatrix}$$

- **Property:** Kernel coefficients sum to 0 ($\sum w = 0$). Flat, uniform areas map to zero output (black). Zero-crossings mark edge transitions.

#### 2. Sobel Operators (1st-order differential gradient)

Compute horizontal and vertical gradient components:
$$G_x = \begin{bmatrix} -1 & 0 & 1 \\ -2 & 0 & 2 \\ -1 & 0 & 1 \end{bmatrix}, \quad G_y = \begin{bmatrix} -1 & -2 & -1 \\ 0 & 0 & 0 \\ 1 & 2 & 1 \end{bmatrix}$$
Edge Magnitude: $|\nabla f| = \sqrt{G_x^2 + G_y^2} \approx |G_x| + |G_y|$  
Edge Direction: $\theta = \arctan(G_y / G_x)$

#### 3. Unsharp Masking

Subtracts a blurred version of the image to isolate high frequencies, then adds them back with a scaling factor $k$:

1.  Blur image: $f_{\text{smooth}} = f * G_{\text{LPF}}$
2.  Obtain high-frequency mask: $g_{\text{mask}} = f - f_{\text{smooth}}$
3.  Add back: $f_{\text{sharp}} = f + k \cdot g_{\text{mask}}$
    - $k = 1$: Standard unsharp masking.
    - $k > 1$: Highboost filtering.

---

## 3. Separable Filters (Algorithmic Complexity Optimization)

A 2D spatial convolution kernel $K$ of size $k \times k$ is defined as **separable** if it can be factored into the outer product of two 1D vectors:

$$K = \mathbf{v} \cdot \mathbf{h}^T \quad (\text{where } \mathbf{v} \in \mathbb{R}^{k \times 1}, \ \mathbf{h}^T \in \mathbb{R}^{1 \times k})$$

_Condition:_ The $k \times k$ matrix $K$ must be **rank 1**.

```
   2D Kernel K (3x3):                     1D Vertical       1D Horizontal
   1/16 * [ 1  2  1 ]                         [ 1 ]
          [ 2  4  2 ]     =======>     1/4 *  [ 2 ]   *   1/4 * [ 1  2  1 ]
          [ 1  2  1 ]                         [ 1 ]
```

### Computational Complexity Analysis

Let the target image have dimensions $M \times N$, and the square kernel have dimensions $k \times k$.

- **Standard 2D Convolution:**
  For each of the $M \times N$ pixels, we perform $k^2$ multiplications and $k^2 - 1$ additions.
  $$\text{Complexity} = \mathcal{O}(M \cdot N \cdot k^2)$$
- **Separable 2D Convolution:**
  First, convolve every row with the 1D horizontal kernel $\mathbf{h}^T$ ($k$ multiplications per pixel). Then convolve the resulting matrix columns with the 1D vertical kernel $\mathbf{v}$ ($k$ multiplications per pixel).
  $$\text{Complexity} = \mathcal{O}(M \cdot N \cdot (2k))$$

#### Speedup Ratio:

$$\text{Speedup} = \frac{k^2}{2k} = \frac{k}{2}$$
_Exam calculation:_ For a typical $15 \times 15$ Gaussian smoothing kernel ($k=15$):
$$\text{Speedup} = \frac{15^2}{2 \times 15} = \frac{225}{30} = 7.5\times \text{ faster}$$
The Gaussian filter is mathematically separable because:
$$e^{-\frac{x^2+y^2}{2\sigma^2}} = e^{-\frac{x^2}{2\sigma^2}} \cdot e^{-\frac{y^2}{2\sigma^2}}$$

---

## 4. Non-Linear Spatial Filters

Non-linear filters do not satisfy the superposition principle: $T(a \cdot f + b \cdot g) \neq a T(f) + b T(g)$.

### 1. Median Filter

- **Operation:** Slides a window over the image, extracts all pixel values within the neighborhood, sorts them in numerical order, and sets the center pixel to the median value:
  $$I_{\text{out}}(x,y) = \text{median}\Big(\{I(x+s, y+t) \mid (s,t) \in W\}\Big)$$
- **Application:** Standard method for removing **Salt-and-Pepper (impulse) noise**.
- _Comparison with Linear LPF:_ A linear mean filter averages impulse noise spikes ($0$ or $255$) into adjacent pixels, blurring the noise without fully removing it. The median filter discards outliers because extreme values fall at the tail ends of the sorted sequence. It also preserves crisp step edges far better than a box or Gaussian filter.

```
Local 3x3 Window with "Salt" Noise:
[ 12  15  14 ]
[ 11 255  13 ]   ==> Sort: [11, 12, 12, 13, 14, 15, 16, 17, 255]
[ 12  16  17 ]   ==> Median = 14
                     The noise value (255) is completely eliminated!
```

### 2. Mode Filter

- **Operation:** Replaces the central pixel with the most frequently occurring value within the neighborhood.
- **Application:** Applied to classified labels, semantic segmentation masks, and indexed categorical maps to remove isolated misclassified noise pixels. It is not typically suited for continuous natural photographic images where neighboring pixel values vary continuously.

### 3. Bilateral Filter

- **Operation:** An edge-preserving smoothing filter. While a standard Gaussian filter averages neighboring pixels based solely on their **spatial distance**, the bilateral filter introduces a second weight based on **radiometric (intensity) similarity**:

$$I^{\text{filtered}}(p) = \frac{1}{W_p} \sum_{q \in \Omega} I(q) \cdot g_s(\|p - q\|) \cdot g_r(|I(p) - I(q)|)$$

Where normalization factor $W_p$ is:
$$W_p = \sum_{q \in \Omega} g_s(\|p - q\|) \cdot g_r(|I(p) - I(q)|)$$
And the spatial and range kernels are both Gaussians:
$$g_s(\|p - q\|) = \exp\left(-\frac{\|p - q\|^2}{2\sigma_s^2}\right)$$
$$g_r(|I(p) - I(q)|) = \exp\left(-\frac{|I(p) - I(q)|^2}{2\sigma_r^2}\right)$$

```
        Spatial Weight gs                 Range Weight gr (Edge Present)
         (Closer is higher)               (Similar intensity is higher)
             /\                                    |
            /  \                                   |        /---\
           /    \                                  |       /     \
      ----+------+----                       ------+------+-------+----
             p                                    I(p)          I(q) (Large delta I)
                                                  gr falls to ~0!
```

- **Mechanism at an Edge:**
  - In flat, uniform regions, $|I(p) - I(q)| \approx 0 \implies g_r \approx 1$. The bilateral filter behaves identically to a standard Gaussian blur, smoothing out noise.
  - Across a sharp boundary, $|I(p) - I(q)|$ is large $\implies g_r \to 0$. The filter zeros out the contribution of pixels across the edge, smoothing strictly along the boundary rather than across it.
- _Application:_ Removing photographic grain/noise without blurring object outlines; surface normal smoothing; computational photography tone mapping.

---

# Comprehensive Exam Review Cheat-Sheet

| Topic                 | Core Mathematical Formula / Rule                                                                                         | Key Engineering Trade-off / Pitfall                                                                      |
| :-------------------- | :----------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------- |
| **Thin Lens**         | $\frac{1}{f} = \frac{1}{d_o} + \frac{1}{d_i}$                                                                            | Real image ($d_i > 0$, behind lens) vs. Virtual image ($d_i < 0$, cannot capture on sensor).             |
| **Exposure / DOF**    | $N = \frac{f}{D}$, $\text{DOF} \propto \frac{N \cdot c}{f^2}$                                                            | Small $N$ (wide aperture) $\implies$ shallow DOF, more light. Large $N$ $\implies$ deep DOF, less light. |
| **Sampling**          | $f_s > 2 f_{\max}$                                                                                                       | Subsampling below Nyquist rate causes high frequencies to fold into low frequencies (Moiré).             |
| **Bit-Planes**        | $I = \sum_{k=0}^{7} b_k 2^k$                                                                                             | MSB ($b_7$) preserves high-level structure; LSB ($b_0$) is noise-like and fragile to compression.        |
| **Histogram Eq.**     | $s_k = \text{round}\left((L-1)\sum_{j=0}^k \frac{n_j}{MN}\right)$                                                        | Fully automated global contrast expansion; can over-amplify background sensor noise.                     |
| **IQA: SSIM**         | $\text{SSIM} = \frac{(2\mu_x\mu_y + C_1)(2\sigma_{xy} + C_2)}{(\mu_x^2 + \mu_y^2 + C_1)(\sigma_x^2 + \sigma_y^2 + C_2)}$ | Quantifies perceptual structure; outmatches MSE/RMSE on shifted or human-evaluated imagery.              |
| **Color: HSI**        | $H \propto \text{angle}, S = 1 - \frac{3 \min(R,G,B)}{R+G+B}$                                                            | Separates chromatic content from illumination; robust against shadows in segmentation.                   |
| **Filter Separation** | $K = \mathbf{v} \cdot \mathbf{h}^T \iff \text{Rank}(K) = 1$                                                              | Drops 2D convolution execution time from $\mathcal{O}(k^2)$ to $\mathcal{O}(2k)$ operations per pixel.   |
| **Median Filter**     | $I_{\text{out}} = \text{median}(W_p)$                                                                                    | Highly effective at suppressing salt-and-pepper noise while preserving sharp boundaries.                 |
| **Bilateral Filter**  | $W = g_s(\|p-q\|) \cdot g_r(\|I_p - I_q\|)$                                                                              | Edge-preserving smoothing; stops blur from leaking across steep intensity boundaries.                    |
