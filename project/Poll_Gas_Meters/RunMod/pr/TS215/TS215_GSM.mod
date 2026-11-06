if "[NameObj_prXX]" <> "" then 
{
	if [Date_prXX] > 24 then
	{
		/*TC-215*/
		SetChenjPer([TimeZvonka_prXX],00:05:30);
		SetChenjPer([_Date_prXX],[CompDateAndTime:1 2 3 4 5 6 7 8 9 10] 09:00:00);
	}
    DateDecDateChanj([Date_prXX]®[CompDateAndTime]®[_Date_prXX]®h);
}