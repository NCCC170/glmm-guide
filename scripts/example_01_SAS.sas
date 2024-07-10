/*
*****************************************************************************************************
* This resource was created by NCCC-170 and is provided free of charge with absolutely no warranty.  *
* Please use and redistribute this resource with no restrictions.                                    *
******************************************************************************************************
*/

/* Example 1: Negative variance component estimates for block effects;
/* Source: SAS for Mixed Models by Stroup, Milliken, Claassen, Wolfinger, 2018.
/* 	Chp2, Section 2.5:

 /*---Data Set: RCBD with Negative Variance Estimate   ---*/
data Example1Data;
   input block trt Y;
datalines;
1 1 24.739
1 2 22.719
1 3 27.247
1 4 28.45
1 5 30.202
1 6 30.422
2 1 27.921
2 2 29.419
2 3 27.025
2 4 30.467
2 5 23.334
2 6 23.299
3 1 24.064
3 2 22.945
3 3 26.169
3 4 30.414
3 5 28.661
3 6 29.571
4 1 25.102
4 2 28.342
4 3 29.337
4 4 23.714
4 5 33.414
4 6 26.563
5 1 22.352
5 2 30.348
5 3 23.798
5 4 29.197
5 5 30.625
5 6 27.528
;
run;
* Problem:;
proc glimmix data=Example1Data;
   class block trt;
   model y = trt;
   random block;
run;
* Understanding the issue;
proc mixed data=Example1Data method=type3;
   class block trt;
   model y = trt;
   random block;
  * ods select type3;
run;

* Alternative 1: Override restrictions; 
proc glimmix data=Example1Data nobound;
   class block trt;
   model y = trt;
   random block;
run;

* Alternative 2: Reparameterize model to marginal;
proc glimmix data=Example1Data;
   class block trt;
   model y = trt;
   random trt / subject=block type=cs residual v vcorr;
run;
