-- create a new schema, then import the data into mySQL
-- observe the distinct industries in the data, ordered in ascending order
-- after observing the output, export this recordset, open it in excel and save it as its own table

select distinct Industry
from usa_online_shopping_raw
order by Industry;

-- this recordset can be used to observe the companies which operate within distinct industries
-- for example, companies in the Retail industry can be shown by

select *
from usa_online_shopping_raw
where industry = 'Retail'
;



