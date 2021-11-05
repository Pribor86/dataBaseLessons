select vend_id, prod_price, prod_name
from products
where vend_id <> 'DLL01'
order by prod_price;