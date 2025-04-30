-- this dataset provides information related to online shopping across various e-commerce platforms in the United States.
-- This dataset is designed to support research, analysis, and business insights in the e-commerce industry.

-- [Data cleaning]
-- first I modify the data in excel - update the column names and generate ids,
-- then in mySQL, create a new schema, then import the data from excel into mySQL

-- convert field types to varchar
alter table online_shopping
modify column company_name varchar(50),
modify column industry varchar(50),
modify column revenue_USD_millions int,
modify column revenue_growth varchar(50),
modify column employees varchar(50),
modify column headquarters varchar(50)
;

-- create an industries table
create table industries(
industry_id int not null,
industry varchar(50) not null,
primary key (industry_id)
);


-- each industry has a unique id, the ids were made in excel and are nonoverlapping with the rankings
-- The choice to start from 110 was arbitrary
insert into industries(industry_id, industry)
values
(110,'Aerospace and defense'),
(111,'Agriculture cooperative'),
(112,'Agriculture manufacturing'),
(113,'Airline'),
(114,'Apparel'),
(115,'Automotive'),
(116,'Automotive and Energy'),
(117,'Automotive industry'),
(118,'Beverage'),
(119,'Chemical industry'),
(120,'Conglomerate'),
(121,'Consumer products Manufacturing'),
(122,'Electronics industry'),
(123,'Financial'),
(124,'Financial services'),
(125,'Financials'),
(126,'Food industry'),
(127,'Food Processing'),
(128,'Food Service'),
(129,'Health'),
(130,'Health Insurance'),
(131,'Healthcare'),
(132,'Infotech'),
(133,'Insurance'),
(134,'Laboratory instruments'),
(135,'Logistics'),
(136,'Machinery'),
(137,'Media'),
(138,'Petroleum industry'),
(139,'Petroleum industry and Logistics'),
(140,'Pharmaceutical industry'),
(141,'Retail'),
(142,'Retail and Cloud Computing'),
(143,'Technology'),
(144,'Telecom Hardware Manufacturing'),
(145,'Telecommunications'),
(146,'Transportation')
;


-- use a cte to display the industries and the counts for revenue per industry
with cte_industry as
(
select industry, count(revenue_USD_millions) revenue_count_per_industry
from online_shopping
group by industry
order by industry asc
)
-- join the industries table to get a full view of the industry information, the industry column appears twice because its in both tables
select *
from cte_industry
join industries
	on cte_industry.industry = industries.industry
;


 -- show the cleaned data
select * from online_shopping;
select * from industries;



