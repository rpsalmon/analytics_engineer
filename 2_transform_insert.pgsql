/*---------------------------
Transform and insert 
---------------------------*/
INSERT INTO amex_expense ( 
    SELECT distinct *, 'Gold' as card
    FROM amex_etl
);

INSERT INTO credit_cards (
    SELECT distinct spend, card, description, amount 
    FROM amex_expense
    UNION
    SELECT distinct spend, card, description, coalesce(debit, -1*credit) as amount
    FROM capital_expenses
);

--mortgage
INSERT INTO mortgage (
    SELECT spend 
    , description 
    , credit 
    , balance 
    , principle
    , interest 
    FROM mortgage_etl
);

--banking
INSERT INTO sccu_etl (
    SELECT 'SCCU_chk' as account 
    , spend 
    , description 
    , memo 
    , balance 
    , amount
    FROM sccu_chk
    UNION ALL
    SELECT 'SCCU_sav' as account 
    , spend 
    , description 
    , memo
    , balance 
    , amount 
    FROM sccu_sav
);

INSERT INTO sccu_etl (
    SELECT 'SCCU_chk' as account 
    , spend 
    , memo as description 
    , transact as memo 
    , null as balance 
    , amount
    FROM sccu_chk1
    UNION ALL
    SELECT 'SCCU_sav' as account 
    , spend 
    , memo as description 
    , transact as memo 
    , null as balance 
    , amount 
    FROM sccu_sav1
);

INSERT INTO dccu_etl (
    SELECT 'DCCU_chk' as account 
    , spend 
    , description 
    , memo 
    , balance 
    , principle as amount
    FROM dccu_chk
    UNION ALL
    SELECT 'DCCU_sav' as account 
    , spend 
    , description 
    , memo
    , balance 
    , principle as amount 
    FROM dccu_sav
);

INSERT INTO bank (
    SELECT account 
    , spend 
    , description 
    , memo 
    , balance 
    , amount
    FROM sccu_etl
    UNION ALL
    SELECT account 
    , spend 
    , description 
    , memo
    , balance
    , principle as amount 
    FROM dccu_etl
);

--td investment
/*INSERT INTO invest (
    SELECT spend 
    , description 
    , quantity 
    , symbol 
    , price 
    , amount 
    FROM td_etl
);*/