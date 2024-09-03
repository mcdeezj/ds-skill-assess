# ds-skill-assess
## Phase II technical assessment for data scientist candidates

This repository contains a short, notional example of SQL & R files designed to test your technical knowledge of basic data wrangling and version control.

### Ground Rules
* You will have 1 hour to clone the repo, create your own branch, and push your branch back to the remote repo.
* Please keep all work on your branch. Do not submit a pull request for main.
* The errors are simple; do not over-think them.
* Describe your approach in the ReadMe file's section below, as opposed to in-line comments.

### Instructions
1. Clone the repo
2. From `main`, create your own branch with `[your last name]/submission`
3. Correct errors in the SQL and R script as follows:
  * The SQL contains an error that will not generate correct output to be received by the R file. Please correct the SQL so that its output will match what the R file requires.
  * The R file contains a single series of steps that could be separated into more descriptive functions or otherwise condensed to improve readability and maintainability. Please re-factor the R code to reflect cleaner, more maintainable code without altering functionality. *Please feel free to add separate function script files if you think this would help.*
  * In the ReadMe file, modify the below section to explain your overall approach. Write as if speaking to a non-technical audience.

**NOTE**: When making corrections in the SQL or R file, please also consider formatting adjustments that more closely conform to generally accepted style guidance (e.g., indentation, vertical alignment, etc.).

**IMPORTANT: You should NOT need to create sample data and you do NOT need to compile your code to ensure it runs.** This is not a test of syntax, but of your ability to discover and streamline inefficiency in the data pipeline.

4. Commit your edits and push your branch back to the remote repo within 1 hour

*GOOD LUCK!*
  
## About My Submission: `[Joseph, Janicki]`
I started by looking at what the R script needed from the SQL File. The required information included the unit ID, fiscal year, and fiscal month. Upon checking the SQL script, I noticed that it had a SELECT and FROM clause, which were supposed to select the ID, year, and month, and also add up the total number of applicants for each combination of the ID, year, and month. However, the code wasn't written in a reader-friendly way, and the part that calculated the total number of applicants didn't provide the result in the format the R script was expecting. The GROUP BY statement in the SQL query was supposed to group the results by unique instances of what was listed in the section below it. It already did this with the ID, but it didn’t group the results by unique years or months. I made changes to fix this issue.

Moving on to the R script, I immediately noticed that the comments indicated three main tasks: "Load packages," "Prepare data for the model," and "Fit the model and write the coefficients." 
The comments provided a clear outline of tasks that could be turned into units of code (modular pieces of code, also known as functions).

Loading packages didn’t need to be part of this process, but the other two tasks could be made into functions.

The first function, which I named load_and_prepare_data (using a naming style consistent with the rest of the code), will load the data and prepare it. 
This function loads the file and creates new columns by using the mutate() method to combine columns, essentially concatenating them.

The second function will fit a linear regression model to the data and save the results. 
In simpler terms, it will train a predictive model using the data prepared by the load_and_prepare_data function and then save the results in a file format called CSV (Comma-Separated Values).

Once these functions are created, it’s just a matter of calling them. The data prepared by the first function is stored in a variable and then passed to the second function for training and saving.
