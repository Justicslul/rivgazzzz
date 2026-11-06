
Var Date2_prXX=0;
Var mails_prXX=0;
Var times_prXX=0;


/*****************************************************************************************************************************************************/


if "[Otvet1_prXX]" = "0" then 
{   
	
	RunFormChenj([razTmWh_prXX]=[RealTmWh_prXX]-[ArchTmWh_prXX]);
	DateSumDateChanj([DTArch_prXX]®[Date_sob_prXX]®-[razTmWh_prXX]®h); 

	if "[ArchTmWh_prXX]" = "NAN" then 
	{
		SetChenjPer([ArchTmWh_prXX],[RealTmWh_prXX]);
		SetChenjPer([th1_prXX],0);
		SetChenjPer([ph1_prXX],0);
		SetChenjPer([vh1_prXX],0);
		SetChenjPer([V1_prXX],0);
		SetChenjPer([G1_prXX],0);
		SetChenjPer([th2_prXX],0);
		SetChenjPer([ph2_prXX],0);
		SetChenjPer([vh2_prXX],0);
		SetChenjPer([V2_prXX],0);
		SetChenjPer([G2_prXX],0);
	}
-
	if "[razTmWh_prXX]" = "0" then {}
	
	if "[razTmWh_prXX]" <> "0" then 
	{
		
		SQLExcec([run], delete from [table_prXX] where dates='[DTArch_prXX]' and [Truba] = 'Truba1ch');
		SQLExcec([run], delete from [table_prXX] where dates='[DTArch_prXX]' and [Truba] = 'Truba2ch');

		SQLExcec([run], Insert into [table_prXX] ([Dates],V,Vru,Qru,P,T,[Truba],[DateSave]) values('[DTArch_prXX]',cast(replace('[G1_prXX]', ',','.') as float),cast(replace('[V1_prXX]', ',','.') as float),cast(replace('[vh1_prXX]', ',','.') as float),cast(replace('[ph1_prXX]', ',','.') as float),cast(replace('[th1_prXX]', ',','.') as float),'Truba1ch','[CompDateAndTime]'));
		SQLExcec([run], Insert into [table_prXX] ([Dates],V,Vru,Qru,P,T,[Truba],[DateSave]) values('[DTArch_prXX]',cast(replace('[G2_prXX]', ',','.') as float),cast(replace('[V2_prXX]', ',','.') as float),cast(replace('[vh2_prXX]', ',','.') as float),cast(replace('[ph2_prXX]', ',','.') as float),cast(replace('[th2_prXX]', ',','.') as float),'Truba2ch','[CompDateAndTime]'));
		
		SetChenjPer([mails_prXX],[ArchMode_prXX]);
		RunFormChenj([ArchMode_prXX]=[mails_prXX] + 1);
	}
}


