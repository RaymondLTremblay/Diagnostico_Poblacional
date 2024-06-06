# Install the development version of the mpmsim package from github
install.packages("remotes")
remotes::install_github("jonesor/mpmsim")

# Load packages
library(mpmsim)
library(Rage)

# Here I am inventing a matrix model.
# This is split into the U and F submatrices.
# Note, however, though we only need the U matrix 
# for the calculation of life expectancy.
# I'm including both for completeness... :)

U_matrix <- matrix(c(0.12, 0.00, 0.00, 0.00,
                     0.25, 0.10, 0.00, 0.00,
                     0.00, 0.34, 0.21, 0.00,
                     0.00, 0.00, 0.31, 0.69), nrow= 4, ncol = 4, byrow = TRUE)

F_matrix <- matrix(c(0.00, 0.00, 2.21, 5.20,
                     0.00, 0.00, 0.00, 0.00,
                     0.00, 0.00, 0.00, 0.00,
                     0.00, 0.00, 0.00, 0.00), nrow= 4, ncol = 4, byrow = TRUE)

F_matrix
U_matrix

# Create the A matrix from the submatrices
A_matrix <- F_matrix + U_matrix

# What is lambda for the matrix?
popdemo::eigs(A_matrix, what = "lambda")


# Calculate the mean life expectancy
Rage::life_expect_mean(U_matrix)

# Calculate the variance in mean life expectancy
# Note that this would lead to 95% CI spanning 0.
Rage::life_expect_var(U_matrix) 


#Sample size estimate for each parameter in the U matrix
SS_matrix <- matrix(c(12, 00, 00, 00,
                      12, 12, 00, 00,
                      00, 12, 10, 00,
                      00, 00, 10, 20), nrow= 4, ncol = 4, byrow = TRUE)

# Calculate the confidence interval for life expectancy.
mpmsim::compute_ci_U(
  mat_U = U_matrix,
  sample_size = SS_matrix,
  FUN = Rage::life_expect_mean
)

# Calculate the confidence interval for life expectancy.
# ... but this time, use the argument dist.out = TRUE to get the 
# distribution.
xx <- mpmsim::compute_ci_U(
  mat_U = U_matrix,
  sample_size = SS_matrix,
  FUN = Rage::life_expect_mean,
  dist.out = TRUE
)



summary(xx$quantiles)
hist(xx$estimates)

# These estimates are calculated by bootstrapping, so they will
# produce slightly different results each time (stochasticity!)
# To reduce this issue, you can set the argument `n_sim` to be larger. The default is 1000, so maybe set it to 5000.

#e.g.
mpmsim::compute_ci_U(
  mat_U = U_matrix,
  sample_size = SS_matrix,
  FUN = Rage::life_expect_mean,
  n_sim = 5000
  )
