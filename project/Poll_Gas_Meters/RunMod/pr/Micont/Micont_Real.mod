if "[otvet_prXX]" = "0" then
{

	SetChenjPer([Time_otv_prXX],0);
/**********************************Запись в базу о сотоянии прибора***********************************************************************************/
	 SQLExcec([run], UPDATE [GAZ]..[UUGDataProverka] SET [Date_Update] = '[CompDateAndTime]' WHERE [IDObj] = '[Table_prXX]');
	 SQLExcec([run], UPDATE [GAZ]..[UUGDataProverka] SET [DateSys] = '[CompDateAndTime]' WHERE [IDObj] = '[Table_prXX]');
	 SQLExcec([run], UPDATE [GAZ]..[UUGDataProverka] SET [DatePrib] = '[RealDatePr_prXX]' WHERE [IDObj] = '[Table_prXX]');
/*****************************************************************************************************************************************************/


}
if "[timesReplase_prXX]" = "0" then {
	
	/***********************************Запись часовок*******************************************************************************************/
	  	SQLExcec([run], delete from [table_prXX] where dates='[prdata_prXX]' and [Truba] = 'Truba1ch' and [ID] != 1 );
	  	SQLExcec([run], delete from [table_prXX] where dates='[prdata_prXX]' and [Truba] = 'Truba2ch' and [ID] != 1 );
	 
	  	SQLExcec([run], Insert into [table_prXX] ([Dates],V,Vru,Qru,Q,P,T,[Truba],[DateSave]) values('[prdata_prXX]',cast(replace('[Gn1_prXX]', ',','.') as float),cast(replace('[Vn1_prXX]', ',','.') as float),cast(replace('[gi1_prXX]', ',','.') as float),cast(replace('[vi1_prXX]', ',','.') as float),cast(replace('[pi1_prXX]', ',','.') as float),cast(replace('[ti1_prXX]', ',','.') as float),'Truba1ch','[CompDateAndTime]'));
	  	SQLExcec([run], Insert into [table_prXX] ([Dates],V,Vru,Qru,Q,P,T,[Truba],[DateSave]) values('[prdata_prXX]',cast(replace('[Gn2_prXX]', ',','.') as float),cast(replace('[Vn2_prXX]', ',','.') as float),cast(replace('[gi2_prXX]', ',','.') as float),cast(replace('[vi2_prXX]', ',','.') as float),cast(replace('[pi2_prXX]', ',','.') as float),cast(replace('[ti2_prXX]', ',','.') as float),'Truba2ch','[CompDateAndTime]'));

}
	
/***********************************Запись суточных*********************************************************************************************/
if "[timesReplase_prXX]" = "0" then {
	
	if "[TimeArch_prXX]" = "0" then {
	/***********************************Запись суточных******************************************************************************************/
		SQLExcec([run], delete from [table_prXX] where dates='[prdata_prXX]' and [Truba] = 'Truba1sy' and [ID] = 1);
	  	SQLExcec([run], delete from [table_prXX] where dates='[prdata_prXX]' and [Truba] = 'Truba2sy' and [ID] = 1);
	
	  	SQLExcec([run], Insert into [table_prXX] ([Dates],V,Vru,Qru,Q,P,T,[Truba],[DateSave],[ID]) values('[prdata_prXX]',cast(replace('[Gn1_prXX]', ',','.') as float),cast(replace('[Vn1_prXX]', ',','.') as float),cast(replace('[gi1_prXX]', ',','.') as float),cast(replace('[vi1_prXX]', ',','.') as float),cast(replace('[pi1_prXX]', ',','.') as float),cast(replace('[ti1_prXX]', ',','.') as float),'Truba1sy','[CompDateAndTime]',1));
	  	SQLExcec([run], Insert into [table_prXX] ([Dates],V,Vru,Qru,Q,P,T,[Truba],[DateSave],[ID]) values('[prdata_prXX]',cast(replace('[Gn2_prXX]', ',','.') as float),cast(replace('[Vn2_prXX]', ',','.') as float),cast(replace('[gi2_prXX]', ',','.') as float),cast(replace('[vi2_prXX]', ',','.') as float),cast(replace('[pi2_prXX]', ',','.') as float),cast(replace('[ti2_prXX]', ',','.') as float),'Truba2sy','[CompDateAndTime]',1));
	}
	
}