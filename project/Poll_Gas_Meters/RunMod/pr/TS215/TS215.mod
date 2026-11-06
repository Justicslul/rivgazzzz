/*Var timeout_ek=5000;*/
Var DelayedPerformance_prXX=0;
/*Если ответ от архива*/
if [Otvetarh_prXX]=0 then
{
if [DelayedPerformance_prXX] > 1 then
{
        /*задержка выполнения*/
	SetChenjPer([DelayedPerformance_prXX],0);
/****************************************************************************************************************************************************/
	 SQLExcec([run], UPDATE [GAZ]..[UUGDataProverka] SET [Date_Update] = '[CompDateAndTime]' WHERE [IDObj] = '[table_prXX]');
	 SQLExcec([run], UPDATE [GAZ]..[UUGDataProverka] SET [DateSys] = '[CompDateAndTime]' WHERE [IDObj] = '[table_prXX]');
	 SQLExcec([run], UPDATE [GAZ]..[UUGDataProverka] SET [DatePrib] = '[DeteTimePR_prXX]' WHERE [IDObj] = '[table_prXX]');
/****************************************************************************************************************************************************/

/*SetChenjPer([Otvetarh_prXX],1);*/
	/*дата текущая прибора > дата запрошенного часа ЕК */
	if "StrToDateTime[DateDec_prXX]">"StrToDateTime[DateChag_prXX]" then
		{
			/*Записываем в SQL*/
			if "[DatePrib_prXX]" <> "#0103:00" then
				{
			SQLExcec([run], delete from [table_prXX] where dates='[DatePrib_prXX]' and SerialNumber = [Serial_prXX]);
			SQLExcec([run], Insert into [table_prXX] (Dates,V,Vru,Qru,Q,P,T,SerialNumber,DateSave) values('[DatePrib_prXX]',cast(replace('[VstNev_prXX]', ',','.') as float), cast(replace('[VstOb_prXX]', ',','.') as float),  cast(replace('[VrabOb_prXX]', ',','.') as float),  cast(replace('[VrabNev_prXX]', ',','.') as float),  cast(replace('[Pbar_prXX]', ',','.') as float),  cast(replace('[Tc_prXX]', ',','.') as float),[Serial_prXX],'[CompDateAndTime]'));
				}
			/*Прибавляем 1 день*/
			DateSumDateChanj([DateChag_prXX]®[DateChag_prXX]®1®d);
		}
/*Следим за приделами даты, что бы не перескочить текущую*/
if "StrToDateTime[DateDec_prXX]"<"StrToDateTime[DateChag_prXX]" then
		{
			SetChenjPer([DateChag_prXX],[DateDec_prXX]);
		}
}
else 
{
RunFormChenj([DelayedPerformance_prXX]=[DelayedPerformance_prXX]+1);
}
}

if "StrToDateTime[DateDec_prXX]"="StrToDateTime[DateChag_prXX]" then
{
	DateSumDateChanj([DateChag_prXX]®[DateChag_prXX]®-2®d);
}
