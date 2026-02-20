select distinct spend, card, description, amount
    , case when extract(month from spend) in ('6','7','8') then round(amount/2,2)
    else amount end as amount_adj
    from credit_cards
    where description like ('%BNB%')
    and extract(year from spend) > 2022
    and card = '0434'
    group by 1,2,3,amount
    having amount > 0
;

select distinct 
    spend, memo, amount
    from bank
    where memo like ('%ZELLE%')
    and memo not like ('%PORTIA%')
    and memo like ('%BRIANAH%')
    group by 1,2,3
    having cast(amount as decimal) >499
;

WITH credit as 
(
    select distinct spend, card, description, amount
    , case when extract(month from spend) in ('6','7','8') then round(amount/2,2)
    else amount end as amount_adj
    from credit_cards
    where description like ('%BNB%')
    and extract(year from spend) > 2022
    and card = '0434'
    group by 1,2,3,amount
    having amount > 0
)
, bank as (
    select distinct 
    spend, memo, amount
    from bank
    where memo like ('%ZELLE%')
    and memo not like ('%PORTIA%')
    and memo like ('%BRIANAH%')
    group by 1,2,3
    having cast(amount as decimal) >499
)

select round(sum(c.amount_adj),2) as bnb_spend
, sum(cast(b.amount as decimal)) as zelle_back
, round(sum(c.amount_adj)-sum(cast(b.amount as decimal)),2) as balance
from credit as c
FULL JOIN
bank as b on c.spend = b.spend
;


    /*or description like ('%PARK%')
    or description like ('%PET%')
    or description like ('%VET%')
    or description like ('%RAW%')
    or description like ('%K9%')
    or description like ('%ANIMAL%')
    or description like ('%GROOM%')
    or description like ('%LOYAL%')*/