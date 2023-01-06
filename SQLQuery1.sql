select * from Project..Data

-- total episodes
select count(distinct [Ep# No#]) from Project..data

--pitches
select count(distinct (Brand)) from Project..data

--pitches converted
select cast(sum(converted_not_converted) as float)/cast(count(*)  as float) from(
select [Amount Invested lakhs] , case when [Amount Invested lakhs]>0 then 1 else 0 end as converted_not_converted from project..data)b

--total male
select sum(male) from Project..Data

--total female
select sum(female) from Project..Data

--gender ratio
select sum(female)/sum(male) from Project..Data

-- total investded amount
select sum([Amount Invested lakhs]) from Project..data

--avg equity taken
select AVG(a.[Equity Taken %]) from
(select * from Project..Data where [Equity Taken %]>0)a

--highest deal taken
select max("Amount Invested lakhs") from Project..data

--highest equity taken
select max("Equity Taken %") from Project..Data

--startup having at least women
select sum(a.female_count) from (
select female,case when female>0 then 1 else 0 end as female_count from Project..Data) a

-- pitche converted having at least women
select * from Project..Data

select sum(b.female_count) from (
select case when a.female>0 then 1 else 0 end as female_count from (
(select * from Project..Data where deal!= 'No deal')) a)b


-- avg  team members
select avg("teammembers") from Project..Data

--amount invested per deal
select AVG(a.[Amount Invested lakhs]) amount_invested_per_deal from 
(select * from Project..Data where Deal!='No Deal') a

--avg age group of contestants 

select [Avg age], count([Avg age]) cnt from Project..Data group by [Avg age] order by cnt desc


--loaction  group of contestants 

select Location, count([Location]) cnt from Project..Data group by [Location] order by cnt desc

--Sector group of contestant
select Sector, count([Sector]) cnt from Project..Data group by [Sector] order by cnt desc

--Partner Deals
select Partners,COUNT(Partners) as cnt from Project..Data  where Partners!='-' group by Partners order by cnt DESC


--making the matrix
select * from Project..Data

select 'Ashneer' as keyy,count([Ashneer Amount Invested]) from Project..Data where [Ashneer Amount Invested] is not null

select 'Ashneer' as keyy,count([Ashneer Amount Invested]) from Project..Data where [Ashneer Amount Invested] is not null and [Ashneer Amount Invested]!=0

select 'Ashneer' as keyy,sum(c.[Ashneer Amount Invested]),Avg(c.[Ashneer Equity Taken %])
from (select * from Project..Data where [Ashneer Equity Taken %] is Not NUll and [Ashneer Equity Taken %]!=0) c



select m.keyy,m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_Equity_taken from 
(select a.keyy,a.total_deals_present,b.total_deals from (
select 'Ashneer' as keyy,count([Ashneer Amount Invested]) total_deals_present from Project..Data where [Ashneer Amount Invested] is not null) a
inner join (
select 'Ashneer' as keyy,count([Ashneer Amount Invested]) total_deals from Project..Data where [Ashneer Amount Invested] is not null and [Ashneer Amount Invested]!=0) b

on a.keyy=b.keyy) m
inner join 
(select 'Ashneer' as keyy,sum(c.[Ashneer Amount Invested]) total_amount_invested,
Avg(c.[Ashneer Equity Taken %]) avg_Equity_taken
from (select * from Project..Data where [Ashneer Equity Taken %] is Not NUll and [Ashneer Equity Taken %]!=0) c) n

on m.keyy=n.keyy

select * from Project..Data

--which is the startup  in which the  highest amount invested in  each sector
select c. * from
(select brand,Sector,[Amount Invested lakhs],rank() over(partition by sector order by [Amount Invested Lakhs] desc)rnk
from Project..Data) c
where c.rnk=1


--making the matrix
select * from Project..Data

select 'Anupam' as keyy,count([Anupam Amount Invested]) from Project..Data where [Anupam Amount Invested] is not null

select 'Anupam' as keyy,count([Anupam Amount Invested]) from Project..Data where [Anupam Amount Invested] is not null and [Anupam Amount Invested]!=0

select 'Anupam' as keyy, sum(c.[Anupam Amount Invested],Avg(c.[Anupam Equity Taken %])
from (select * from Project..Data where [Anupam Equity Taken %] is Not NUll and [Anupam Equity Taken %]) c



select m.keyy,m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_Equity_taken from 
(select a.keyy,a.total_deals_present,b.total_deals from (
select 'Anupam' as keyy,count([Anupam Amount Invested]) total_deals_present from Project..Data where [Anupam Amount Invested] is not null) a
inner join (
select 'Anupam' as keyy,count([Anupam Amount Invested]) total_deals from Project..Data where [Anupam Amount Invested] is not null and [Anupam Amount Invested]!=0) b

on a.keyy=b.keyy) m
inner join 
(select 'Anupam' as keyy,sum(c.[Anupam Amount Invested]) total_amount_invested,
Avg(c.[Anupam Equity Taken %]) avg_Equity_taken
from (select * from Project..Data where [Anupam Equity Taken %] is Not NUll and [Anupam Equity Taken %]!=0) c) n

on m.keyy=n.keyy

select * from Project..Data


