-- 1
select sum(amount) as 'total amount of Deposit' from transaction
where type='Deposit';

-- 2
select id,amount,tdate,type from transaction where account_num=1111222233331441
and tdate between '2019-09-01' and '2019-09-30';


-- 3

select sum(amount) as 'Balance' from transaction where account_num=1111222233331441
and tdate<'2019-09-01';

-- 4

select name,amount from customer inner join account
on customer.ssn=account.owner_ssn
inner join transaction on account.number=transaction.account_num
group by name
having amount=(select max(amount) from transaction where type='Deposit');

-- 5
select cmr.name "Owners Name" from customer cmr,account aut
where cmr.ssn=aut.owner_ssn
and cmr.sex='M' and aut.type like 'Checking';

-- 6
select aut.number "Account Number" from customer cmr,account aut
where cmr.ssn=aut.owner_ssn and cmr.name like 'Alexander Felix';

-- 7

select aut.number "Account Number",aut.type "Account Type" , sum(tan.amount) "Balance"
from customer cmr,account aut,transaction tan
where cmr.ssn=aut.owner_ssn and aut.number=tan.account_num
and cmr.name like 'Alexander Felix'
group by aut.number
union
select tan.account_num "Account Number",tan.type "Account Type" , sum(tan.amount) "Balance"
from customer cmr,account aut,transaction tan
where cmr.ssn=aut.owner_ssn and aut.number=tan.account_num
and cmr.name like 'Alexander Felix'
group by aut.number;

-- 8

select cmr.name "Owners Name" from customer cmr,account aut,transaction tan
where cmr.ssn=aut.owner_ssn and aut.number=tan.account_num
group by cmr.name
having sum(tan.amount)>=1000;
