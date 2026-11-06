Var Dates_tmp_prXX=0;
if "StrToDateTime[Dates_tmp_prXX]"<>"StrToDateTime[DateTimeStart_prXX]" then			
{
			SetChenjPer([Day_prXX],[DateTimeStart_prXX:1 2]);
			SetChenjPer([Month_pr1],[DateTimeStart_prXX:4 5]);
			SetChenjPer([Year_pr1],[DateTimeStart_prXX:7 8 9 10]);
			SetChenjPer([Hour_pr1],[DateTimeStart_prXX:12 13]);
			SetChenjPer([Dates_tmp_prXX],[DateTimeStart_prXX])
}