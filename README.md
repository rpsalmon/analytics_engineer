# Finance Planning Automation

These collection of files are to be paired up with a csv outputs from credit cards
, bank statements and investment account statements.

The goal of this is to create a program that will facilitate budgeting, expense tracking
, saving goal setting and tracking, net worth calculations, investment planning, and
credit scenarios.

This currently exists as a notebook with embedded visuals. The future state will be a
python (or other language) script that generates pdf outputs that summarize. There
will also be a UX that will take in various input scenarios and output monthly recurring
costs.

Version 1 will be html delivery.

### Updating it with new spend data
1. download YTD data as csv from bank and credit cards
2. name it :year_transactions and place it in the appropritate folder ~Downloads % cp <file> <desintation>
3. remove the additional row at the end of credit card exports
4. check for changes to column headers and data types

### File Structure
Finances/\
    .md\
    .ipynb\
    /banks\
        /dccu\
            /mortgage\
            /audi\
        /sccu\
    /credit\
        /amex\
            /gold\
                /transactions.csv (do not track)\
        /capital_one\
            /venture\
                /transactions.csv (do not track)\
            /platinum\
                /transactions.csv (do not track)\
        /download_activity\
            /everything_else_that_comes_from_credit_providers.csv\
            /pdf\
    /output\
        /2021\
        /2022\
        /2023\
        /2024\
        /2025\
        /2026\
    /program_files
        /python
            /python.py
        /sql
            /clear_tables
            /create.sql
            /load.sql
            /transform.sql
            /check.sql
            /select.sql    

### There are 4 requirements
1. SQL Database that holds the historical data (done)
2. Aiflow to orchestrate the ingest
3. Python automate the output
4. Outputs should be PDF
5. The UX should be built using Ruby/React/Django/HTML/JS
6. Turn it into a pure .py program, extracted from the notebook

## Products
### Budget
* Weekly/Monthly/Yearly budget (cash flow, income)
* Expense by category
* Mortgage
* Debt to income monthly
* Personal inflation
* Financial Independence number + ratio
* Real estate
* Balance sheet
* Outlier spend days

### Credit
* Weekly/Monthly/Yearly spend
    * Line chart of sum less payments
    * Table of period averages
* Available credit
    * Pie chart per period spend
* Payments over time
    * Stacked bar chart
* Expense by category
    * Pie chart of spend for the whole period
    * Histogram by category within a period
    * Line chart tracking distribution over time
* Monthly avg, Total spend qtr, total paid qtr, outstanding
    * By card

### Savings & Retirement
* Contribution by source
* Growth 
* Savings to income monthly
* Cost basis
* Diversification allocation
* Investment fees
* By account

## Features
### Data Ingest
* Credit card activity database
* Manipulate the tables as a dataframe

### Budget Scenario
* Increase/Decrease - what if
* Actual vs Projected
* Goal planning
* Normalize the budget to actual

### Repayment Schedule
* NYC cash advance
* Brianah accounting statement

### Output - Qtrly
* Credit
* Savings & Retirement
* Mortgage
* Personal loans