clear all
set more off

local datapath "C:\Users\brewe\Dropbox\teaching\Courses\BrewerPhDEnv\Homeworks\phdee-2023-db\homework5"
local outputpath "C:\Users\brewe\Dropbox\teaching\Courses\BrewerPhDEnv\Homeworks\phdee-2023-db\homework6\output"

* Load data

	cd "`datapath'"

	import delimited "C:\Users\brewe\Dropbox\teaching\Courses\BrewerPhDEnv\Homeworks\phdee-2023-db\homework5\instrumentalvehicles.csv"

	cd "`outputpath'"
	
* Method one: Fuzzy option
	
	* rdrobust

		rdrobust price length, c(225) p(1) fuzzy(mpg) bwselect(mserd) covs(car)
		
	* rdplot

		rdplot price length, c(225) p(1) fuzzy(mpg) bwselect(mserd) covs(car) graph_options(legend(pos(6)) ytitle(Vehicle price) xtitle(Vehicle length))
		
		graph export "hw6_p2q1.pdf", replace
	
* Method two: by hand
	
	rdplot mpg length, c(225) p(1) bwselect(mserd) covs(car) graph_options(legend(pos(6))) genvars

	reg price rdplot_hat_y car
	
* Each method gives somewhat different results--I would have to dig into the documenation for rdrobust to figure out exactly why