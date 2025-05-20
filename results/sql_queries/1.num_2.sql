select *
from print_directory
where print not in (
	select print from product_directory where print is not null
)

