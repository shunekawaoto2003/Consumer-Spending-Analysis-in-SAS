proc import out=mall
	datafile="C:\Users\kawao\Documents\CSULB\2025 Spring\STAT 560\Project\Mall_Customers.csv"
	dbms=csv
	replace;
	getnames=yes;
run;
/* Spending_Score is from 1-100*/
/* Annual_Income is in k$*/

title "EDA for Gender";
/* ANOVA with residuals and predicted values */
proc glm data=mall;
	class Gender;
	model Spending_Score = Gender;
	output out=DiagOutGender r=Residual p=Predicted;
run;
quit;

/* Normality of residuals */
proc univariate data=DiagOutGender normal;
	var Residual;
	histogram Residual / normal;
	qqplot Residual / normal(mu=est sigma=est);
run;

/* Residuals vs. predicted plot */
proc sgplot data=DiagOutGender;
	scatter x=Predicted y=Residual;
	refline 0 / axis=y lineattrs=(color=red);
	title "Residuals vs. Predicted Values";
run;

/* Homogeneity of variances */
proc glm data=mall;
	class Gender;
	model Spending_Score = Gender;
	means Gender / hovtest=levene;
run;
quit;

title "Do the spending scores differ across both genders?";
proc glm data=mall;
	class Gender;
	model Spending_Score = Gender;
run;

/* Wilcoxon Rank Sum Test */
proc npar1way data=mall wilcoxon;
	class Gender;
	var Spending_Score;
run;

title "EDA for Age_Group";
data mall;
	set mall;
	if Age < 25 then Age_Group = "Under 25";
	else if Age < 40 then Age_Group = "25-39";
	else if Age < 60 then Age_Group = "40-59";
	else Age_Group = "60+";
run;

/* Run ANOVA with residuals and predicted values */
proc glm data=mall;
	class Age_Group;
	model Spending_Score = Age_Group;
	output out=DiagOutAge r=Residual p=Predicted;
run;
quit;

/* Normality of residuals */
proc univariate data=DiagOutAge normal;
	var Residual;
	histogram Residual / normal;
	qqplot Residual / normal(mu=est sigma=est);
run;

/* Residuals vs. Predicted Plot */
proc sgplot data=DiagOutAge;
	scatter x=Predicted y=Residual;
	refline 0 / axis=y lineattrs=(color=red);
	title "Residuals vs. Predicted Values";
run;

/* Homogeneity of variances */
proc glm data=mall;
	class Age_Group;
	model Spending_Score = Age_Group;
	means Age_Group / hovtest=levene;
run;
quit;

title "Do the annual spendings differ across age groups?";
proc glm data=mall;
	class Age_Group;
	model Spending_Score = Age_Group;
run;

/* Kruskal-Wallis Test*/
proc npar1way data=mall wilcoxon;
	class Age_Group;
	var Spending_Score;
run;










title "Wilcoxon Rank Sum Test between the age groups";
/* Under 25 vs 25-39 */
proc npar1way data=mall wilcoxon;
	where Age_Group in ("Under 25", "25-39");
	class Age_Group;
	var Spending_Score;
	title "Wilcoxon: Under 25 vs 25-39";
run;

/* Under 25 vs 40-59 */
proc npar1way data=mall wilcoxon;
	where Age_Group in ("Under 25", "40-59");
	class Age_Group;
	var Spending_Score;
	title "Wilcoxon: Under 25 vs 40-59";
run;

/* Under 25 vs 60+ */
proc npar1way data=mall wilcoxon;
	where Age_Group in ("Under 25", "60+");
	class Age_Group;
	var Spending_Score;
	title "Wilcoxon: Under 25 vs 60+";
run;

/* 25-39 vs 40-59 */
proc npar1way data=mall wilcoxon;
	where Age_Group in ("25-39", "40-59");
	class Age_Group;
	var Spending_Score;
	title "Wilcoxon: 25-39 vs 40-59";
run;

/* 25-39 vs 60+ */
proc npar1way data=mall wilcoxon;
	where Age_Group in ("25-39", "60+");
	class Age_Group;
	var Spending_Score;
	title "Wilcoxon: 25-39 vs 60+";
run;

/* 40-59 vs 60+ */
proc npar1way data=mall wilcoxon;
	where Age_Group in ("40-59", "60+");
	class Age_Group;
	var Spending_Score;
	title "Wilcoxon: 40-59 vs 60+";
run;


title "ANOVA between age groups";
proc glm data=mall;
	class Age_Group;
	model Spending_Score = Age_Group;
	means Age_Group / tukey cldiff alpha=0.05;
	title "Tukey HSD Post-Hoc for Age_Group ANOVA";
run;
quit;
