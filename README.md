# STATA ADO
# samplesizegen

**Version:** 1.0  
**Author:** Omondi Robert   
**Date:** 2024-11-08

## Overview

`samplesizegen` is a custom Stata command (`.ado`) that calculates the required survey sample size based on user-defined parameters. It also applies a finite population correction when applicable to give more precise estimates.

---

## 🔍 Description

This command helps you determine how many survey respondents are needed to achieve a statistically valid sample based on:

- Population size
- Confidence level
- Margin of error
- Expected response distribution

It provides both the infinite population estimate and the adjusted sample size using finite population correction.

---

## ⚙️ Parameters

The following options are required:

| Parameter | Description |
|----------|-------------|
| `popsize(integer)` | Total population size. Must be a positive integer. |
| `conflevel(real)` | Confidence level (e.g., 0.95 for 95%). |
| `margin(real)` | Margin of error (e.g., 0.05 for ±5%). Must be between 0 and 1. |
| `proportion(real)` | Expected response distribution (e.g., 0.5 for 50%). Must be between 0 and 1. |

---

## 📐 Methodology

### 1. Sample size for an infinite population:
n = (Z^2 * P * (1 - P)) / E^2

Where:
- `Z` = Z-score based on confidence level  
- `P` = Proportion (expected response rate)  
- `E` = Margin of error

### 2. Finite population correction (FPC):
n_adj = n / (1 + (n - 1) / N)

Where:
- `n` = initial sample size from above  
- `N` = population size  
- `n_adj` = adjusted sample size with FPC

---

## 💡 Output

After execution, the command displays the **adjusted sample size** considering finite population correction.

---

## ▶️ Usage Example

To calculate the sample size for a population of 2,000, with:

- 95% confidence level
- 5% margin of error
- 50% response distribution

Run the following in Stata:

```stata
. samplesizegen , popsize(2000) conflevel(0.95) margin(0.05) proportion(0.5)
```
---
