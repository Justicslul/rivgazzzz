Var TMP_DATE_prXX=0;
Var TimeOut_SY_prXX=0;
Var TimeOut_CH_prXX=0;

if "[SYOtvet_prXX]"="0" then
{
/*Переходим к следующие записи*/
IF [SYNUM_ZAP_prXX] > -1 THEN
{

		if "StrToDateTime[RDateTime_prXX]" > "StrToDateTime[SYDateTime_prXX]" then
		{
		RunFormChenj([SYNUM_ZAP_prXX]=[SYNUM_ZAP_prXX]-1);
		/*Запись в SQL сутки*/
		if"[Date_SUT_prXX]" = "[SYDateTime_prXX]"{
		SQLExcec([run], set dateformat dmy delete from [Base_prXX] where dates='[SYDateTime_prXX]' and [ID]=1);
		SQLExcec([run], set dateformat dmy Insert into [Base_prXX] (Dates,V,Vru,Q,Qru,ID) values('[SYDateTime_prXX]',cast(replace('[SYPerepad_prXX]', ',','.') as float),cast(replace('[SYDavlenie_prXX]', ',','.') as float),cast(replace('[SYTemperetura_prXX]', ',','.') as float),cast(replace('[SYRashod_prXX]', ',','.') as float),1));
		}
		SetChenjPer([SYNUM_prXX],[SYNUM_ZAP_prXX]);
		}
}
IF [SYNUM_ZAP_prXX]< 0 THEN
{SetChenjPer([SYNUM_ZAP_prXX],0);}
if [SYNUM_ZAP_prXX] = 0 then
{
if [TimeOut_SY_prXX] > 10 then
	{
	SetChenjPer([SYNUM_ZAP_prXX],5);
	SetChenjPer([SYNUM_prXX],[SYNUM_ZAP_prXX]);
	SetChenjPer([TimeOut_SY_prXX],0);
	}
RunFormChenj([TimeOut_SY_prXX]=[TimeOut_SY_prXX]+1);
}
SetChenjPer([SYOtvet_prXX],1);
}
/*Старт от заданной даты*/
if "[TMP_DATE_prXX]"<>"[DateStart_prXX]" then
{
	SetChenjPer([TMP_DATE_prXX],[DateStart_prXX]);
	DateDecDate([CHNUM_ZAP_prXX]®[RDateTime_prXX]®[DateStart_prXX]®h);
	DateDecDate([SYNUM_ZAP_prXX]®[RDateTime_prXX]®[DateStart_prXX]®d);
	SetChenjPer([CHNUM_prXX],[CHNUM_ZAP_prXX]);
	SetChenjPer([SYNUM_prXX],[SYNUM_ZAP_prXX]);
}