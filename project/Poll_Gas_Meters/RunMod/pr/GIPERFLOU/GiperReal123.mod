Var DateTemp_prXX=0;
Var RazdDate_prXX=0;

if "[DateTemp_prXX]"<>"[DateStart_prXX]" then
{
	SetChenjPer([DateTemp_prXX],[DateStart_prXX]);
	DateDecDateChanj([RazdDate_prXX]®[CompDateAndTime]®[DateStart_prXX]®h);	
	RunFormChenj([CHNUM_ZAP_prXX]=[RazdDate_prXX]);

	SetChenjPer([DateTemp_prXX],[DateStart_prXX]);
	DateDecDateChanj([RazdDate_prXX]®[CompDateAndTime]®[DateStart_prXX]®d);	
	RunFormChenj([SYNUM_ZAP_prXX]=[RazdDate_prXX]);
}

if "[OtvetReal_prXX]" = "0" then
{
	SetChenjPer([TimeOut_prXX],0);
}