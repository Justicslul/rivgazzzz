Var Max_ch=19967;
Var Min_ch=18464;
Var Max_sy=20352;
Var Min_sy=19968;
Var ukazatel_prXX=0; 
Var chasplusone_prXX=0;
Var step_prXX=0;

/*Часовые (переходный момент)*/
if [StartH_prXX] < [Min_ch] then {SetChenjPer([StartH_prXX],[Min_ch]);}

/*Суточные (переходный момент)*/
if [StartD_prXX] < [Min_sy] then {SetChenjPer([StartD_prXX],[Min_sy]);}

/***********************************************************************/
if "[otvet_prXX]" = "0" then
{
	SetChenjPer([Time_otv_prXX],0);
	if [step_prXX] > 4 then
	{
	SetChenjPer([step_prXX],-1);
		if [Potok_prXX] > 6 then{	
/*			SetChenjPer([StartH_prXX],[adrch_prXX]);*/
/*			SetChenjPer([StartD_prXX],[adrsy_prXX]);*/
			RunFormChenj([StartH_prXX]=[StartH_prXX]+1);	
			SetChenjPer([zapardch_prXX],32768);
			SetChenjPer([ukazatel_prXX],0);	
		}
	}RunFormChenj([step_prXX]=[step_prXX]+1);

/*Часовки*/
	if "[ukazatel_prXX]" = "1" then
	{
         if [Potok_prXX]=3 then 
	 {
 	
	 RunFormChenj([StartH_prXX]=[StartH_prXX]+1);
	 if [StartH_prXX]>[Max_ch] then {SetChenjPer([StartH_prXX],[Min_ch]);}

	 SetChenjPer([zapardch_prXX],32768);
	 SetChenjPer([ukazatel_prXX],0);

/*Запись часовки*/
	 if "[pzapch_prXX]"<>"255255255" then
	 {
	 SQLExcec([run], delete from [table_prXX] where dates='[prdata_prXX]' and [Truba] = 'Truba1ch' and [ID] IS NULL or [ID] != 1 and [SerialNumber] = [SerialNum_prXX]);
	 SQLExcec([run], delete from [table_prXX] where dates='[prdata_prXX]' and [Truba] = 'Truba2ch' and [ID] IS NULL or [ID] != 1 and [SerialNumber] = [SerialNum_prXX]);
	 SQLExcec([run], Insert into [table_prXX] ([Dates],V,Vru,Qru,Q,P,T,[Truba],[DateSave],[SerialNumber]) values('[prdata_prXX]',cast(replace('[G1r_prXX]', ',','.') as float),cast(replace('[V1r_prXX]', ',','.') as float),cast(replace('[Gi1r_prXX]', ',','.') as float),cast(replace('[Vi1r_prXX]', ',','.') as float),cast(replace('[P1r_prXX]', ',','.') as float),cast(replace('[T1r_prXX]', ',','.') as float),'Truba1ch','[CompDateAndTime]','[SerialNum_prXX]'));
	 SQLExcec([run], Insert into [table_prXX] ([Dates],V,Vru,Qru,Q,P,T,[Truba],[DateSave],[SerialNumber]) values('[prdata_prXX]',cast(replace('[G2r_prXX]', ',','.') as float),cast(replace('[V2r_prXX]', ',','.') as float),cast(replace('[Gi2r_prXX]', ',','.') as float),cast(replace('[Vi2r_prXX]', ',','.') as float),cast(replace('[P2r_prXX]', ',','.') as float),cast(replace('[T2r_prXX]', ',','.') as float),'Truba2ch','[CompDateAndTime]','[SerialNum_prXX]'));
	 }
	}
        }

/*Суточные************************************************************************************************/
	if "[ukazatel_prXX]" = "2" then
	{
	if [Potok_prXX]=4 then 
	 {
	RunFormChenj([StartD_prXX]=[StartD_prXX]+1);
	if  [StartD_prXX] > [Max_sy] then{SetChenjPer([StartD_prXX],[Min_sy]);}
	SetChenjPer([zapardch_prXX],32768);
	SetChenjPer([ukazatel_prXX],0);

/*Запись суточных*/
	if "[pzapch_prXX]"<>"255255255" then
	{
	SQLExcec([run], delete from [table_prXX] where dates='[prdata_prXX]' and [Truba] = 'Truba1sy' and [ID] = 1 or [ID] != 1 and [SerialNumber] = [SerialNum_prXX]);
	SQLExcec([run], delete from [table_prXX] where dates='[prdata_prXX]' and [Truba] = 'Truba2sy' and [ID] = 1 or [ID] != 1 and [SerialNumber] = [SerialNum_prXX]);
	SQLExcec([run], Insert into [table_prXX] ([Dates],V,Vru,Qru,Q,P,T,[Truba],[DateSave],[ID],[SerialNumber]) values('[prdata_prXX]',cast(replace('[G1r_prXX]', ',','.') as float),cast(replace('[V1r_prXX]', ',','.') as float),cast(replace('[Gi1r_prXX]', ',','.') as float),cast(replace('[Vi1r_prXX]', ',','.') as float),cast(replace('[P1r_prXX]', ',','.') as float),cast(replace('[T1r_prXX]', ',','.') as float),'Truba1sy','[CompDateAndTime]',1,'[SerialNum_prXX]'));
	SQLExcec([run], Insert into [table_prXX] ([Dates],V,Vru,Qru,Q,P,T,[Truba],[DateSave],[ID],[SerialNumber]) values('[prdata_prXX]',cast(replace('[G2r_prXX]', ',','.') as float),cast(replace('[V2r_prXX]', ',','.') as float),cast(replace('[Gi2r_prXX]', ',','.') as float),cast(replace('[Vi2r_prXX]', ',','.') as float),cast(replace('[P2r_prXX]', ',','.') as float),cast(replace('[T2r_prXX]', ',','.') as float),'Truba2sy','[CompDateAndTime]',1,'[SerialNum_prXX]'));
	}
	}
}
/*Реальные************************************************************************************************/
	if "[ukazatel_prXX]" = "0" then
	{       
	RunFormChenj([chasplusone_prXX]=[adrsy_prXX]+1);
	if "[chasplusone_prXX]" <> "[StartD_prXX]" then{SetChenjPer([zapardch_prXX],[StartD_prXX]); SetChenjPer([ukazatel_prXX],2);}
	RunFormChenj([chasplusone_prXX]=[adrch_prXX]+1);
	if "[chasplusone_prXX]" <> "[StartH_prXX]" then{SetChenjPer([zapardch_prXX],[StartH_prXX]);  SetChenjPer([ukazatel_prXX],1);}
	}
}