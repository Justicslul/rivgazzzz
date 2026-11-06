Var Next_prXX=0;
/*Если ответ от архива*/
if [Otvet_ch_arh_prXX]=0 then
{
	SetChenjPer([Next_prXX],0);
	SetChenjPer([TimeOut_ch_arh_prXX],0);
/****************************************************************************************************************************************************/
	 SQLExcec([run], UPDATE [GAZ]..[UUGDataProverka] SET [Date_Update] = '[CompDateAndTime]' WHERE [IDObj] = '[table_prXX]');
	 SQLExcec([run], UPDATE [GAZ]..[UUGDataProverka] SET [DateSys] = '[CompDateAndTime]' WHERE [IDObj] = '[table_prXX]');
	 SQLExcec([run], UPDATE [GAZ]..[UUGDataProverka] SET [DatePrib] = '[Date_Real_prXX]' WHERE [IDObj] = '[table_prXX]');
/****************************************************************************************************************************************************/

/*SetChenjPer([Otvetarh_prXX],1);*/
	/*дата текущая прибора > дата запрошенного часа СПГ761 */
	if "StrToDateTime[DateDec_ch_prXX]">"StrToDateTime[DateTimeStart_prXX]" then
		{
			/*Записываем в SQL*/
			SQLExcec([run], delete from [table_prXX] where dates='[Date_ch_Arc_prXX]' and [ID] = 0);
			SQLExcec([run], Insert into [table_prXX] (Dates,V,Vru,Qru,P,T,DateSave,ID) values('[Date_ch_Arc_prXX]',cast(replace('[V_ch_arh_prXX]', ',','.') as float), cast(replace('[Vp_ch_arh_prXX]', ',','.') as float),  cast(replace('[dP_ch_arh_prXX]', ',','.') as float),  cast(replace('[P_ch_arh_prXX]', ',','.') as float),  cast(replace('[T_ch_arh_prXX]', ',','.') as float), '[CompDateAndTime]',0));

			/*Прибавляем 1 час*/
			DateSumDateChanj([DateTimeStart_prXX]®[DateTimeStart_prXX]®1®h);
			SetChenjPer([Day_prXX],[DateTimeStart_prXX:1 2]);
			SetChenjPer([Month_prXX],[DateTimeStart_prXX:4 5]);
			SetChenjPer([Year_prXX],[DateTimeStart_prXX:7 8 9 10]);
			SetChenjPer([Hour_prXX],[DateTimeStart_prXX:12 13]);
/*Day_prXX,Month_prXX,Year_prXX,Hour_prXX*/

		}

/*Следим за приделами даты, что бы не перескочить текущую*/
if "StrToDateTime[DateDec_prXX]"<"StrToDateTime[DateChag_prXX]" then
		{
			SetChenjPer([DateTimeStart_prXX],[DateDec_ch_prXX]);
		}
}
