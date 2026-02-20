
/*---------------------------
creating the capital one table
Transaction Date,Posted Date,Card No.,Description,Category,Debit,Credit
---------------------------*/
DROP TABLE capital_expenses;
CREATE TABLE capital_expenses (
    spend date
    , posted varchar
    , card varchar
    , description varchar
    , category varchar, debit decimal, credit decimal
);

/*---------------------------
creating the amex table
Date,Description,Amount,Extended Details,Appears On Your Statement As,Address,City/State,Zip Code,Country,Reference,Category
Can't use hte above columns because they are not actually comma separated when downloaded
Date,Description,Amount
---------------------------*/
DROP TABLE amex_etl;
CREATE TABLE amex_etl (
    spend date
    , description varchar
    , amount decimal
--, card varchar, category varchar
);

DROP TABLE amex_expense;
CREATE TABLE amex_expense (
    spend date
    , description varchar
    , amount decimal
    , card varchar
);

/*---------------------------
creating the final credit card table
---------------------------*/
DROP TABLE credit_cards;
CREATE TABLE credit_cards (
    spend date
    , card varchar
    , description varchar
    , amount decimal
);

/*---------------------------
Bank and Finance Tables
---------------------------*/

/*---------------------------
dccu mortgage account w/ interest, tax and pmi
---------------------------*/
DROP TABLE IF EXISTS mortgage_etl;
CREATE TABLE mortgage_etl (
    transaction varchar
    , spend date
    , description varchar
    , memo varchar
    , debit decimal
    , credit decimal
    , balance decimal
    , check_name varchar
    , fees decimal
    , principle decimal
    , interest decimal
);

DROP TABLE IF EXISTS mortgage;
CREATE TABLE mortgage (
    spend date
    , description varchar
    , credit decimal
    , balance decimal
    , principle decimal
    , interest decimal
);


/*---------------------------
final bank transaction table
---------------------------*/
DROP TABLE IF EXISTS bank;
CREATE TABLE bank (
    account varchar
    , spend date
    , description varchar
    , memo varchar
    , balance varchar
    , amount varchar
);


/*---------------------------
dccu checking and savings accounts
---------------------------*/
--dccu Transaction Number,Date,Description,Memo,Amount Debit,Amount Credit,Balance,Check Number,Fees ,Principal 
DROP TABLE IF EXISTS dccu_chk;
CREATE TABLE dccu_chk (
    transaction varchar
    , spend date
    , description varchar
    , memo varchar
    , debit decimal
    , credit decimal
    , balance varchar
    , check_num varchar
    , fees decimal
    , principle varchar
);

DROP TABLE IF EXISTS dccu_sav;
CREATE TABLE dccu_sav (
    transaction varchar
    , spend date
    , description varchar
    , memo varchar
    , debit decimal
    , credit decimal
    , balance varchar
    , check_num varchar
    , fees decimal
    , principle varchar
);

DROP TABLE IF EXISTS dccu_etl;
CREATE TABLE dccu_etl (
    account varchar
    , spend date
    , description varchar
    , memo varchar
    , balance varchar
    , principle varchar
);


/*---------------------------
sccu checking and savings accounts
---------------------------*/
-- sccu "Date","Description","Comments","Check Number","Amount","Balance"
/*DROP TABLE IF EXISTS sccu_chk;
CREATE TABLE sccu_chk (
    spend date
    , description varchar
    , memo varchar
    , check_number varchar
    , amount varchar
    , balance varchar
);*/

DROP TABLE IF EXISTS sccu_chk1;
CREATE TABLE sccu_chk1 (
    spend date
    , payee varchar
    , fi_payee varchar
    , amount varchar
    , transact varchar
    , category varchar
    , account varchar
    , tag varchar
    , memo varchar
    , check_number varchar
);

/*DROP TABLE IF EXISTS sccu_sav;
CREATE TABLE sccu_sav (
    spend date
    , description varchar
    , memo varchar
    , check_number varchar
    , amount varchar
    , balance varchar
);*/

DROP TABLE IF EXISTS sccu_sav1;
CREATE TABLE sccu_sav1 (
    spend date
    , payee varchar
    , fi_payee varchar
    , amount varchar
    , transact varchar
    , category varchar
    , account varchar
    , tag varchar
    , memo varchar
    , check_number varchar
);

DROP TABLE IF EXISTS sccu_etl;
CREATE TABLE sccu_etl (
    account varchar
    , spend date
    , description varchar
    , memo varchar
    , check_number varchar
    , amount varchar
    , balance varchar
);


/*---------------------------
TD accounts
will replace with Schwab when available
keep for accounting purposes
---------------------------*/
DROP TABLE IF EXISTS invest;
CREATE TABLE invest (
    spend date
    , description varchar
    , quantity varchar
    , symbol varchar
    , price decimal
    , commission decimal
    , amount decimal
);

-- td DATE,TRANSACTION ID,DESCRIPTION,QUANTITY,SYMBOL,PRICE,COMMISSION,AMOUNT,REG FEE,SHORT-TERM RDM FEE,FUND REDEMPTION FEE, DEFERRED SALES CHARGE
DROP TABLE IF EXISTS td_etl;
CREATE TABLE td_etl (
    spend date
    , transaction_id varchar
    , description varchar
    , quantity varchar
    , symbol varchar
    , price decimal
    , commission decimal
    , amount decimal
    , reg_fee decimal
    , str_fee decimal
    , fr_fee decimal
    , sales_charges decimal
);
