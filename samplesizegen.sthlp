{* *! version 1.0, Author: Omondi Robert @Evidence Action, Date: 2024-11-08 *}

{smcl}

{title:samplesizegen} [ado]

{phang}
{cmd:samplesizegen} calculates the required sample size for a survey based on user-specified parameters.

{marker description}{...}
{title:Description}

{pstd}
The program calculates the required survey sample size based on user-specified parameters, including population size, confidence level, margin of error, and response distribution.{p_end} 
{pstd}
It provides the adjusted sample size with finite population correction.{p_end}  

{marker parameters}{...}
{title:Parameters}

{pstd}
The following parameters are supported:

{p2colset 10 30 32 2}{...}
{p2col :{cmd:popsize(}{it:integer}{cmd:)}}Total population size. Must be an integer.{p_end}
{p2col :{cmd:conflevel(}{it:real}{cmd:)}}Confidence level (e.g., 0.95 for 95%).{p_end}
{p2col :{cmd:margin(}{it:real}{cmd:)}}Margin of error (e.g., 0.05 for ±5%).{p_end}
{p2col :{cmd:proportion(}{it:real}{cmd:)}}Expected response distribution (e.g., 0.5 for 50%).{p_end}

{marker methodology}{...}
{title:Methodology}
    
{pstd}
The program uses the following formulas:

{p 8 12 2}
1. To calculate the sample size for an infinite population:

{p 12 16 2}
{cmd:n = (Z^2 * P * (1 - P)) / E^2}{p_end}
{p 12 16 2}
Where: Z = Z-score, P = proportion, E = margin of error.{p_end}

{p 8 12 2}
2. Finite population correction is applied as follows:

{p 12 16 2}
{cmd:nadj = n / (1 + (n - 1) / popsize)}{p_end}

{marker output}{...}
{title:Output}

{pstd}
The program displays:

{p 8 12 2}
- Adjusted sample size with finite population correction.                                                                  
{p_end}

{pstd}
{it:Usage Example}

{pstd}
To calculate the sample size for a population of 2,000, with a 95% confidence level, 5% margin of error, and 50% response distribution:  

{p 12 12 2}
{bf:samplesizegen , popsize(2000) conflevel(0.95) margin(0.05) proportion(0.5)}
{p_end}


