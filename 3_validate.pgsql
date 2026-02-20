/*---------------------------
Check the data
---------------------------*/
--select * from amex_etl limit 5;

--select * from amex_expense limit 5;

--select *, coalesce(debit,credit) as amount from capital_expenses limit 5;

select count(*), max(spend), min(spend) from bank limit 5;
select count(*), max(spend), min(spend) from credit_cards limit 5;
select count(*), max(spend), min(spend) from mortgage limit 5;

select 
    extract(year from spend) as year
    ,extract(quarter from spend) as quarter
    , card
from credit_cards
group by 1,2,3
order by 3,1,2;

select count(*), max(spend), min(spend) from mortgage limit 5;

select count(*), max(spend), min(spend) from bank limit 5;

--select * from invest;