Var Max_ch=19967;
Var Min_ch=18464;
Var Max_sy=20351;/*Заканчивается 4F7F,а не 4E7F*/
Var Min_sy=19968;
Var ukazatel_prXX=0; 
Var chasplusone_prXX=0;
Var Bool_prXX=0;


/***********************************************************************/
if "[otvet_prXX]" = "0" then
{
	SetChenjPer([Time_otv_prXX],0);

/*Реальные************************************************************************************************/
        SetChenjPer([zapardch_prXX],32768);
	SetChenjPer([ukazatel_prXX],0);

	RunFormChenj([chasplusone_prXX]=[adrch_prXX]+1);
	if [chasplusone_prXX] > [Max_ch] then{SetChenjPer([chasplusone_prXX],[Min_ch]);}
	if "[chasplusone_prXX]" <> "[StartH_prXX]" then{SetChenjPer([zapardch_prXX],[StartH_prXX]);  SetChenjPer([ukazatel_prXX],1);}

	RunFormChenj([chasplusone_prXX]=[adrsy_prXX]+1);
        if [chasplusone_prXX] > [Max_sy] then{SetChenjPer([chasplusone_prXX],[Min_sy]);}
	if "[chasplusone_prXX]" <> "[StartD_prXX]" then{SetChenjPer([zapardch_prXX],[StartD_prXX]);  SetChenjPer([ukazatel_prXX],2);}

/*Суточные************************************************************************************************/
	if "[ukazatel_prXX]" = "2" then
	{
         SetChenjPer([Bool_prXX],0);
         if [Potok_prXX]=4  then {SetChenjPer([Bool_prXX],4);}
         if [Potok_prXX]=20 then {SetChenjPer([Bool_prXX],4);}
	 if [Potok_prXX]=84 then {SetChenjPer([Bool_prXX],4);}
	 

	 if [Bool_prXX]=4 then 
	 {
          RunFormChenj([StartD_prXX]=[StartD_prXX]+1);

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



/*Часовки*/
	if "[ukazatel_prXX]" = "1" then
	{
         SetChenjPer([Bool_prXX],0);
         if [Potok_prXX]=3  then {SetChenjPer([Bool_prXX],3);}
         if [Potok_prXX]=19 then {SetChenjPer([Bool_prXX],3);}
         if [Potok_prXX]=83 then {SetChenjPer([Bool_prXX],3);}


	 if [Bool_prXX]=3 then 
	 {
	 RunFormChenj([StartH_prXX]=[StartH_prXX]+1);

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

}

/*Часовые (переходный момент)*/
if [StartH_prXX] < [Min_ch] then {SetChenjPer([StartH_prXX],[Min_ch]);}
if [StartH_prXX]>[Max_ch] then {SetChenjPer([StartH_prXX],[Min_ch]);}

/*Суточные (переходный момент)*/
if [StartD_prXX] < [Min_sy] then {SetChenjPer([StartD_prXX],[Min_sy]);}
if [StartD_prXX] > [Max_sy] then{SetChenjPer([StartD_prXX],[Min_sy]);}