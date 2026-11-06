Var TMP_DATE_prXX=0;
Var TimeOut_SY_prXX=0;
Var TimeOut_CH_prXX=0;

if "[CHOtvet_prXX]"="0" then
{
/*Переходим к следующие записи*/
IF [CHNUM_ZAP_prXX] > -1 THEN
	{
/****************************************************************************************************************************************************/
	 SQLExcec([run], UPDATE [GAZ]..[UUGDataProverka] SET [Date_Update] = '[CompDateAndTime]' WHERE [IDObj] = '[Base_prXX]');
	 SQLExcec([run], UPDATE [GAZ]..[UUGDataProverka] SET [DateSys] = '[CompDateAndTime]' WHERE [IDObj] = '[Base_prXX]');
	 SQLExcec([run], UPDATE [GAZ]..[UUGDataProverka] SET [DatePrib] = '[RDateTime_prXX]' WHERE [IDObj] = '[Base_prXX]');
/****************************************************************************************************************************************************/

		if "StrToDateTime[RDateTime_prXX]" > "StrToDateTime[CHDateTime_prXX]" then
		{
		RunFormChenj([CHNUM_ZAP_prXX]=[CHNUM_ZAP_prXX]-1);
		/*Запись в SQL часовки*/
		if[RDateTime_prXX] > [CHDateTime_prXX]{
		SQLExcec([run], set dateformat dmy delete from [Base_prXX] where dates='[CHDateTime_prXX]' and ([ID] = 0 or [ID] is NULL));
		SQLExcec([run], set dateformat dmy Insert into [Base_prXX] (Dates,Qru,V,Vru,Q,ID) values('[CHDateTime_prXX]',cast(replace('[CHRashod_prXX]', ',','.') as float),cast(replace('[CHPerepad_prXX]', ',','.') as float),cast(replace('[CHDavlenie_prXX]', ',','.') as float),cast(replace('[CHTemperetura_prXX]', ',','.') as float),0));
		}
		SetChenjPer([CHNUM_prXX],[CHNUM_ZAP_prXX]);}
	}
IF [CHNUM_ZAP_prXX] < 0 THEN
{SetChenjPer([CHNUM_ZAP_prXX],0);}
if [CHNUM_ZAP_prXX] = 0 then
{
if [TimeOut_CH_prXX] > 10 then
	{
	SetChenjPer([CHNUM_ZAP_prXX],48);
	SetChenjPer([CHNUM_prXX],[CHNUM_ZAP_prXX]);
	SetChenjPer([TimeOut_CH_prXX],0);
	}
RunFormChenj([TimeOut_CH_prXX]=[TimeOut_CH_prXX]+1);
}
SetChenjPer([CHOtvet_prXX],1);
}