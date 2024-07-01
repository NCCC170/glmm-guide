# Example 1: Negative variance component estimates for block effects;
# Source: SAS for Mixed Models by Stroup, Milliken, Claassen, Wolfinger, 2018.
# 	Chp2, Section 2.5:

# Data Set:
#install.packages("readxl")
library(readxl)
Example1_Data <- read_excel("Example1 Data.xlsx")
View(Example1_Data)
str(Example1_Data)
cols = c("Block","Trt" )
Example1_Data[cols] <- lapply(Example1_Data[cols], factor)  # Reformat variables as factors


#install.packages("lme4")
library(lme4)
library(performance)

# Problem: Negative VC estimates
Example1_MxM <-lmer(Y ~ (1|Block) + Trt, Example1_Data, REML=TRUE) 
print(VarCorr(Example1_MxM),comp="Variance")
summary(Example1_MxM) # Note VC set to zero
check_singularity(Example1_MxM)
joint_tests(Example1_MxM )

# Alternative 1: Unbound?

# Alternative 2: Marginal model parameterization: Compound symmetry structure
library(nlme) 
library(emmeans)
Example1MxMcs <- gls(Y ~ Trt, data = Example1_Data,
               corr = corCompSymm(, form= ~ 1 | Block), method="REML")
summary(Example1MxMcs)
(Example1cov_cs<-getVarCov(Example1MxMcs,individual=1)) # variance-covariance matrix.
cov2cor(Example1cov_cs)
joint_tests(Example1MxMcs )



