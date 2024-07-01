# # This resource was created by NCCC-170 and is provided free of charge with absolutely no warranty. Please use and redistribute this resource with no restrictions.

# Example 1: Negative variance component estimates for block effects;
# Source: SAS for Mixed Models by Stroup, Milliken, Claassen, Wolfinger, 2018.
# 	Chp2, Section 2.5:

# load libraries

library(readxl)
library(lme4)
library(performance)
library(nlme) 
library(emmeans)

# load Data Set:
Example1_Data <- read_excel("data/example_01.xlsx")

str(Example1_Data)
cols = c("Block", "Trt")
Example1_Data[cols] <- lapply(Example1_Data[cols], factor)  # Reformat variables as factors

# Problem: Negative VC estimates
Example1_MxM <- lmer(Y ~ (1 | Block) + Trt, Example1_Data, REML = TRUE)
print(VarCorr(Example1_MxM), comp = "Variance")
summary(Example1_MxM) # Note VC set to zero
check_singularity(Example1_MxM)
joint_tests(Example1_MxM)

# Alternative 1: Unbound?

# Alternative 2: Marginal model parameterization: Compound symmetry structure

Example1MxMcs <- gls(
  Y ~ Trt,
  data = Example1_Data,
  corr = corCompSymm(form = ~ 1|Block, fixed = FALSE),
  method = "REML"
)
summary(Example1MxMcs)
(Example1cov_cs <- getVarCov(Example1MxMcs, individual = 1)) # variance-covariance matrix.
cov2cor(Example1cov_cs)
joint_tests(Example1MxMcs)

