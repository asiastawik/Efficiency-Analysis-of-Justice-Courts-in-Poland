# Project Report: Efficiency Analysis of Justice Courts in Poland

## Introduction
This report details an analysis conducted on the efficiency of justice courts in Poland using Data Envelopment Analysis (DEA). The study aims to evaluate the relationship between resources used by the courts and their outputs, specifically focusing on the resolution of cases. By identifying areas for improvement, the report seeks to optimize resource allocation within the courts.

## Data Collection
The analysis utilized data from the Excel file **Courts_data_2023.xlsx**. The dataset comprised various inputs and outputs related to court operations. The first step involved cleaning the data by removing columns with missing values, specifically those identified as Var8, Var15, Var17, and Var21.

The cleaned dataset included 84 observations structured as follows:

### Inputs (Resources Used):
- **Number of Employees**: Total staff across various roles.
- **Salaries**: Fixed and variable salary components of employees.
- **Assets**: Value of tangible and intangible assets held by the courts.

### Outputs (Results Achieved):
- **Solved Cases**: The total number of cases resolved (criminal, civil, family).
- **Pending Cases**: Number of cases pending at the end of 2023.

## Methodology

### Inputs and Outputs
**Inputs Categorization**:
- **Fixed Inputs**: Salaries for judges and clerks (treated as fixed due to government regulation).
- **Variable Inputs**: Salaries for court clerks, probation officers, assistants, and other workers (subject to variability).

### Combined Approach
A mixed approach was employed, separating inputs into fixed and non-fixed components:
- **Fixed Component (X_fix)**: Representing salaries for judges and clerks.
- **Non-Fixed Component (X_non)**: Variable salaries multiplied by their respective prices.

### Optimization Model
The objective was to minimize costs based on the combined input matrix, integrating both fixed and variable components. The optimization constraints included:
- **Input Constraints**: Representing limits on resources.
- **Output Constraints**: Reflecting required case resolution metrics.

Using the Gurobi Optimization Solver, the model calculated cost efficiency for each court by evaluating the ratio of observed costs to minimized costs.

### Efficiency Metrics
- **Observed Cost**: Computed by summing the products of inputs and their respective prices.
- **Cost Efficiency**: Calculated as the ratio of the optimized objective value to the observed cost.

## Results
The efficiency analysis yielded significant findings:

### Most Efficient Courts
Courts with a cost efficiency ratio equal to 1 were identified as:
- **Unit 2**
- **Unit 45**
- **Unit 70**

### Least Efficient Courts
- **Unit 69**: Cost efficiency ratio of 0.0365, indicating a need to decrease costs associated with assets.
- **Unit 62**: Cost efficiency ratio of 0.0378, suggesting a low number of solved cases relative to resources employed.

## Conclusions
The findings from this analysis suggest that while some courts operate efficiently, many can improve by adopting best practices from the top-performing units. This can lead to better resource allocation, cost savings, and enhanced productivity in terms of case resolutions.

## Recommendations
1. **Best Practices**: Courts should analyze the practices of the most efficient units (Units 2, 45, and 70) to identify actionable strategies for improving efficiency.
2. **Cost Minimization**: Focus should be placed on minimizing excess costs associated with assets, particularly in units identified as inefficient.
3. **Training Programs**: Develop training and resource optimization programs to enhance the capabilities of court employees, especially in units with lower efficiency ratios.

## Future Work
Future studies could expand this analysis by incorporating additional variables related to court operations or exploring qualitative factors influencing efficiency. Further research could also investigate the impact of case types on court performance and resource utilization.
