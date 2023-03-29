clear all
set more off

local datapath "C:\Users\brewe\Dropbox\teaching\Courses\BrewerPhDEnv\Homeworks\phdee-2023-db\homework5"
local outputpath "C:\Users\brewe\Dropbox\teaching\Courses\BrewerPhDEnv\Homeworks\phdee-2023-db\homework6\output"

* Load data

	cd "`datapath'"

	import delimited "C:\Users\brewe\Dropbox\teaching\Courses\BrewerPhDEnv\Homeworks\phdee-2023-db\homework5\instrumentalvehicles.csv"

	cd "`outputpath'"
	

* Method two: by hand
	
	rdplot mpg length, c(225) p(1) bwselect(mserd) covs(car) graph_options(legend(pos(6)) ytitle(MPG) xtitle(Vehicle length)) genvars
	
	graph export "hw6_p2q1.pdf", replace

	reg price rdplot_hat_y car
	
* Note: it turns out that if you use rdrobust/rdplot with the fuzzy option, it does not include the control variables in both stages, giving you invalid results.