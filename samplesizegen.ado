*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
* Program: samplesizegen
* Author: Omondi Robert
* Description: This program calculates the required sample size for a survey based on user-specified parameters: population size, confidence level, margin of error, and response distribution. It computes 	*                   both the initial sample size (assuming an infinite population) and the adjusted sample size after applying finite population correction.  
*
* Parameters: 
*    - popsize:    Total population size (integer)
*    - conflevel:  Confidence level (e.g., 0.95 for 95%)
*    - margin:     Margin of error (e.g., 0.05 for ±5%)
*    - proportion: Expected response distribution (e.g., 0.5 for 50%)
*
* Methodology:
*    - The program uses the Z-score corresponding to the specified confidence level to compute the sample size for an infinite population using the formula:
*          n = (Z^2 * P * (1 - P)) / E^2
*          where Z = Z-score, P = proportion, E = margin of error.
*    - The sample size is then adjusted for finite populations using the formula:
*          nadj = n / (1 + (n - 1) / popsize)
*
* Output:
*    - Adjusted sample size with finite population correction.
*
* Usage Example:
*    . samplesizegen , popsize(2000) conflevel(0.95) margin(0.05) proportion(0.5)
*----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

cap program drop samplesizegen

program define samplesizegen
    syntax , popsize(integer) [Conflevel(real 0.95) Margin(real 0.05) Proportion(real 0.5)]
    
    // Validate inputs
    if `conflevel' <= 0 | `conflevel' >= 1 {
        di as error "Confidence level must be between 0 and 1"
        exit 198
    }
    if `margin' <= 0 | `margin' >= 1 {
        di as error "Margin of error must be between 0 and 1"
        exit 198
    }
    if `proportion' < 0 | `proportion' > 1 {
        di as error "Proportion must be between 0 and 1"
        exit 198
    }
    if `popsize' <= 0 {
        di as error "Population size must be a positive integer"
        exit 198
    }
    
    // Set Z-score based on confidence level
    local z = invnormal(1 - (1 - `conflevel') / 2)
    
    // Calculate initial sample size
    local n = ((`z'^2 * `proportion' * (1 - `proportion')) / (`margin'^2))
    
    // Adjust for finite population
	local nadj = round(`n' / (1 + (`n' - 1) / `popsize') + 0.5)
    
    // Display results
	global sample_size `nadj'
    di as text "Adjusted sample size (with finite population correction): " as result `nadj'
end
