# Parametric vs. Non-Parametric Analysis of Consumer Spending

This project explores **consumer spending behavior across demographics** using both **parametric (ANOVA, Tukey HSD)** and **non-parametric (Wilcoxon, Kruskal-Wallis)** statistical tests in **SAS**.  
The analysis demonstrates proficiency in **statistical validation, model assumption testing, and reproducible reporting**—core practices in applied statistics and assessment analytics.

---

## 📊 Project Overview

**Goal:**  
Determine whether spending behavior differs significantly by **gender** and **age group**, using appropriate statistical testing methods based on data assumptions.

**Dataset:**  
Mall Customer Segmentation dataset (Kaggle, 200 observations).  
Variables: `CustomerID`, `Gender`, `Age`, `Annual Income`, `Spending Score`.

---

## 🧩 Methodology

1. **Data Import and Preprocessing**
   - Imported `.csv` dataset into SAS using `PROC IMPORT`
   - Created derived variable `Age_Group` (`Under 25`, `25–39`, `40–59`, `60+`)

2. **Statistical Analysis**
   - **ANOVA** for parametric group comparison
   - **Levene’s Test** for variance homogeneity
   - **Shapiro–Wilk Test** for residual normality
   - **Wilcoxon Rank-Sum** and **Kruskal–Wallis** for non-parametric alternatives
   - **Post-hoc Tukey HSD** and pairwise Wilcoxon tests for multiple comparisons

3. **Visualization and Quality Checks**
   - Generated residual, histogram, and Q–Q plots using `PROC SGPLOT` and `PROC UNIVARIATE`
   - Ensured result reproducibility through complete code documentation and controlled output files

---

## 🧠 Key Findings

| Hypothesis | Test Used | Result | Significance |
|-------------|------------|---------|---------------|
| Gender vs. Spending Score | ANOVA / Wilcoxon | No difference | p = 0.41 / 0.57 |
| Age Group vs. Spending Score | ANOVA / Kruskal–Wallis | Significant difference | p < 0.001 |

- Age was found to be a **strong predictor of spending**, with **25–39-year-olds** showing higher spending scores.  
- Gender differences were statistically insignificant.

---

## ⚙️ Technologies and Skills

- **SAS Procedures:** `PROC GLM`, `PROC UNIVARIATE`, `PROC NPAR1WAY`, `PROC SGPLOT`
- **Statistical Methods:** ANOVA, Tukey HSD, Kruskal–Wallis, Wilcoxon Rank-Sum
- **Data Skills:** Quality Control, Validation, Reproducible Reporting
- **Documentation:** Full technical report included (`Report.docx`)

---

## 📁 Repository Contents

