*****************************************************************************************************
** Joint effort by the NCCC170: "Research Advances in Agricultural Statistics"
** Project title: Informing best practices for GLMM implementation
*****************************************************************************************************

*****************************************************************************************************
** This resource was created by a joint effort of NCCC170 members 
** and [will be / is] provided free of charge with absolutely no warranty  					
** [Please use and redistribute this resource with no restrictions                                  
*****************************************************************************************************

*****************************************************************************************************
Contributors to this code: 
	- ...
	- ... 
	- ...
*****************************************************************************************************

*****************************************************************************************************
* Example X: Title [use wording consistent with Word documentation];
* Source: [Cite example source, as appropriate]
*****************************************************************************************************
/*--- Import Data Set:   ---*/;
	* Avoid copy-and-paste data practices; 
	* Use proc import to refer to a common date source in .csv format;
proc import out=ExampleX_Data
    datafile = "[...path...]/ExampleX Data.csv"
    dbms = csv
    replace;
    getnames = yes;
run;


/*--- Data checks/exploration:   ---*/
  	* If appropriate, use proc freq/univariate/means to highlight an aspect of the data 
	* relevant to the GLMM challenge illustrated by the example;
	* Make sure to comment the code;



/*--- GLMM implementation   ---*/
	* Use proc GLIMMIX [MIXED if/where appropriate] calls to illustrate the problem and/or alternative approaches; 
	* Make sure to comment the code appropriately;
proc glimmix data=ExampleX_Data  ... ;
	class  ... ; 
	model ... / ...;
	random ... / 

	[other statements relevant to the example];

run;



