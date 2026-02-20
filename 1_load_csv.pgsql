/*---------------------------
loading the csv's to the tables
---------------------------*/
COPY amex_etl 
FROM '/Users/myrsmpb/Documents/Finances/credit/amex/gold/2025_transactions.csv'
DELIMITER ','
CSV HEADER;
--venture
COPY capital_expenses
FROM '/Users/myrsmpb/Documents/Finances/credit/capital_one/venture/2025_transactions.csv'
DELIMITER ','
CSV HEADER;
--platinum
COPY capital_expenses
FROM '/Users/myrsmpb/Documents/Finances/credit/capital_one/platinum/2025_transactions.csv'
DELIMITER ','
CSV HEADER;

--dccu 
--mortgage
COPY mortgage_etl
FROM '/Users/myrsmpb/Documents/Finances/banks/dccu/mortgage/mortgage.csv'
DELIMITER ','
CSV HEADER;

--checking
COPY dccu_chk
FROM '/Users/myrsmpb/Documents/Finances/banks/dccu/checking_0224.csv'
DELIMITER ','
CSV HEADER;

--saving
COPY dccu_sav
FROM '/Users/myrsmpb/Documents/Finances/banks/dccu/saving_0224.csv'
DELIMITER ','
CSV HEADER;

--sccu 
--checking
COPY sccu_chk1
FROM '/Users/myrsmpb/Documents/Finances/banks/sccu/checking_1225.csv'
DELIMITER ','
CSV HEADER;

--saving
COPY sccu_sav1
FROM '/Users/myrsmpb/Documents/Finances/banks/sccu/saving_1225.csv'
DELIMITER ','
CSV HEADER;

--investments 
--td
COPY td_etl
FROM '/Users/myrsmpb/Documents/Finances/investments/TD/transactions_2019.csv'
DELIMITER ','
CSV HEADER;
