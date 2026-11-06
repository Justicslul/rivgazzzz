/*Если ответ от архива*/
if [Otvet_day_arh_prXX]=0 then
{
RunFormChenj([Next_prXX]=[Next_prXX]+1);
/****************************************************************************************************************************************************/
if [Next_prXX] > 5 then
{
			/*Прибавляем 1 час*/
			DateSumDateChanj([DateTimeStart_prXX]®[DateTimeStart_prXX]®1®h);
			SetChenjPer([Day_prXX],[DateTimeStart_prXX:1 2]);
			SetChenjPer([Month_prXX],[DateTimeStart_prXX:4 5]);
			SetChenjPer([Year_prXX],[DateTimeStart_prXX:7 8 9 10]);
			SetChenjPer([Hour_prXX],[DateTimeStart_prXX:12 13]);
			SetChenjPer([Next_prXX],0);
}
/****************************************************************************************************************************************************/

SetChenjPer([TimeOut_day_arh_prXX],0);
     /*Записываем в SQL*/
      SQLExcec([run], delete from [table_prXX] where Dates='[Date_day_arh_prXX]' and [ID] = 1);
      SQLExcec([run], Insert into [table_prXX] (Dates,V,Vru,Qru,P,T,DateSave,ID) values('[Date_day_arh_prXX]',cast(replace('[V_day_arh_prXX]', ',','.') as float), cast(replace('[Vp_day_arh_prXX]', ',','.') as float),  cast(replace('[dP_day_arh_prXX]', ',','.') as float),  cast(replace('[P_day_arh_prXX]', ',','.') as float),  cast(replace('[T_day_arh_prXX]', ',','.') as float), '[CompDateAndTime]',1));
}

