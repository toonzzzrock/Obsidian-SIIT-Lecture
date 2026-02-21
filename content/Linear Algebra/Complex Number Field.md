---
title: Complex Number Field
created_date: 2024-11-22
tags: 
relates:
  - "[[Field theory]]"
source: 
status: To_process
Note_types:
  - Permanent_note
---
> [!summary]
> 

# Complex Number Field

## Definition

> [!definition]
> A complex number field is a field that is formed by tuples of real numbers $(a, b)$, where $a$ and $b$ are real numbers. $\mathbb{C} = \mathbb{R} \times \mathbb{R}$.
> The field operations are defined as follows:
> - Addition: $(a, b) + (c, d) = (a + c, b + d)$
> - Multiplication: $(a, b) \cdot (c, d) = (ac - bd, ad + bc)$
> - The additive identity is $(0, 0)$ and the multiplicative identity is $(1, 0)$.
> - Inverse of $(a, b)$ is $\left(\frac{a}{a^2 + b^2}, -\frac{b}{a^2 + b^2}\right)$ if $(a, b) \neq (0, 0)$.


<svg width="400" height="400" xmlns="http://www.w3.org/2000/svg" style="background-color: #f9f9f9;">
  <!-- Axes -->
  <line x1="200" y1="0" x2="200" y2="400" stroke="black" stroke-width="2"/>
  <line x1="0" y1="200" x2="400" y2="200" stroke="black" stroke-width="2"/>

  <!-- Labels -->
  <text x="210" y="20" font-size="14" fill="black">Imaginary (i)</text>
  <text x="380" y="190" font-size="14" fill="black">Real</text>

  <!-- Complex number vector -->
  <line x1="200" y1="200" x2="320" y2="100" stroke="blue" stroke-width="2" marker-end="url(#arrow)"/>

  <!-- Point -->
  <circle cx="320" cy="100" r="4" fill="red"/>

  <!-- Labels for the complex number -->
  <text x="325" y="95" font-size="14" fill="black">(3, 4i)</text>
  <text x="240" y="160" font-size="14" fill="blue" transform="rotate(-36 240,160)">r</text>

  <!-- Magnitude -->
  <line x1="200" y1="200" x2="320" y2="200" stroke="green" stroke-dasharray="5,5"/>
  <text x="250" y="215" font-size="14" fill="green">3 (Real)</text>
  <line x1="320" y1="200" x2="320" y2="100" stroke="green" stroke-dasharray="5,5"/>
  <text x="330" y="150" font-size="14" fill="green">4i (Imaginary)</text>

  <!-- Arrow marker -->
  <defs>
    <marker id="arrow" markerWidth="10" markerHeight="10" refX="10" refY="3" orient="auto">
      <path d="M0,0 L10,3 L0,6 Z" fill="blue"/>
    </marker>
  </defs>
</svg>


### definition for imaginary unit

> [!definition]
> The imaginary unit $i$ is defined as $i = \left(0, 1\right)$ in the complex number field. It satisfies the property $i^2 = (0, 1) \cdot (0, 1) = (-1, 0)$.


