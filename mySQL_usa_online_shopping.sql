-- make a schema, then import 'usa_online_shopping' into mySQL
-- check the distinct industries in the table, ordered in ascending order
-- after checking the output, export the recordset, open it in excel and save it as its own table

select distinct Industry
from usa_online_shopping_raw
order by Industry;

-- this recordset can be used to observe the companies which operate within distinct industries
-- for example, companies in the Retail industry can be seen by:

select *
from usa_online_shopping_raw
where industry = 'Retail'
;



