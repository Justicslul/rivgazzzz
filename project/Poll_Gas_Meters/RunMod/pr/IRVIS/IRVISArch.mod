Var Date1_prXX=0;
Var Date2_prXX=0;
Var Zaderg_Error_prXX=30;
Var DelayedPerformance_prXX=0;
/*Анализ переменной [TipeIrvis_prXX] и выбор драйвера для опроса*/
if "[TipeIrvis_prXX]"="Ri4" then
{SetChenjPer([RI_prXX],0)}
else {SetChenjPer([RI_prXX],1)}
	if [Next_Real_prXX] = 0 then
	{
	SetChenjPer([driver_prXX],Irvis.inf);
	}
	else
	{
	SetChenjPer([driver_prXX],Irvis_next.inf);
	}

	
if [OtvetPr_prXX]=0 then
{
if [DelayedPerformance_prXX] > 0 then
{
        /*задержка выполнения*/
	SetChenjPer([DelayedPerformance_prXX],0);
/****************************************************************************************************************************************************/
	 SQLExcec([run], UPDATE [GAZ]..[UUGDataProverka] SET [Date_Update] = '[CompDateAndTime]' WHERE [IDObj] = '[Table_prXX]');
	 SQLExcec([run], UPDATE [GAZ]..[UUGDataProverka] SET [DateSys] = '[CompDateAndTime]' WHERE [IDObj] = '[Table_prXX]');
	 SQLExcec([run], UPDATE [GAZ]..[UUGDataProverka] SET [DatePrib] = '[RDTime_prXX]' WHERE [IDObj] = '[Table_prXX]');
/****************************************************************************************************************************************************/


/*Присваиваем даты(прибора и ту которую опрашиваем)*/
SetChenjPer([Date1_prXX],[RDTime_prXX:1 2 3 4 5 6 7 8]);
SetChenjPer([Date2_prXX],[DateAndTime_Driver_prXX:1 2 3 4 5 6 9 10]);

	if [Next_Real_prXX]=0 then
	{
	 SetChenjPer([Next_Real_prXX],1);
	}
	 SetChenjPer([TimeOutArch_prXX],0);
}
else 
{
RunFormChenj([DelayedPerformance_prXX]=[DelayedPerformance_prXX]+1);
}
}


if "[Date1_prXX]"="[Date2_prXX]" then
{
	if "[Vlojch_prXX]"="0" then
	{
	SetChenjPer([Vlojch_prXX],5);
	if [TimeOut_Error_prXX]  > [Zaderg_Error_prXX] then 
	 {
	 DateSumDateChanj([DateAndTime_Driver_prXX]®[DateAndTime_Driver_prXX]®-2®d);
 	 SetChenjPer([TimeOut_Error_prXX],0);
	 }
	SetChenjPer([DateStArh_prXX],[DateAndTime_Driver_prXX:1 2 3 4 5 6 9 10]);
	SetChenjPer([Next_Real_prXX],0);
	
	}
}
else
{
	if "[Vlojch_prXX]"="0" then
	{
	 SetChenjPer([Vlojch_prXX],5);
	if [TimeOut_Error_prXX] > [Zaderg_Error_prXX] then
	 {
	  DateSumDateChanj([DateAndTime_Driver_prXX]®[DateAndTime_Driver_prXX]®1®d);
 	  SetChenjPer([TimeOut_Error_prXX],0);
	 }
	 SetChenjPer([Next_Real_prXX],0);
	 SetChenjPer([DateStArh_prXX],[DateAndTime_Driver_prXX:1 2 3 4 5 6 9 10]);	
	}
}


/*Если дата запроса перескочит дату прибора, то возвращаемся*/
if [RAZDAT_prXX] < 0 then
{
 DateSumDateChanj([DateAndTime_Driver_prXX]®[DateAndTime_Driver_prXX]®-2®d);
 SetChenjPer([TimeOut_Error_prXX],0);
}

if "StrToDateTime[RDTime_prXX]" > "StrToDateTime[DatePr0SQL_prXX]" then
{
/*Запись в SQL0*/
if "[DatePr0SQL_prXX]"<>"[DateSQL0_prXX]" then
{

SQLExcec([run], set dateformat dmy  delete from [Table_prXX] where dates='[DatePr0SQL_prXX]' and SerialNumber = [Serial_prXX]);
SQLExcec([run], set dateformat dmy  Insert into [Table_prXX] (Dates,V,Vru,Qru,Q,P,T,SerialNumber,DateSave) values('[DatePr0SQL_prXX]',cast(replace('[Vsy0_prXX]', ',','.') as float),cast(replace('[Vry0_prXX]', ',','.') as float),cast(replace('[Qry0_prXX]', ',','.') as float),cast(replace('[Qsy0_prXX]', ',','.') as float),cast(replace('[PSQL0_prXX]', ',','.') as float),cast(replace('[T0_prXX]', ',','.') as float),[Serial_prXX],'[CompDateAndTime]'));
SetChenjPer([DateSQL0_prXX],[DatePr0SQL_prXX]);
}
/*Запись в SQL1*/
if "[DatePr1SQL_prXX]"<>"[DateSQL1_prXX]" then
{
SQLExcec([run], set dateformat dmy  delete from [Table_prXX] where dates='[DatePr1SQL_prXX]');
SQLExcec([run], set dateformat dmy  Insert into [Table_prXX] (Dates,V,Vru,Qru,Q,P,T,SerialNumber,DateSave) values('[DatePr1SQL_prXX]',cast(replace('[Vsy1_prXX]', ',','.') as float),cast(replace('[Vry1_prXX]', ',','.') as float),cast(replace('[Qry1_prXX]', ',','.') as float),cast(replace('[Qsy1_prXX]', ',','.') as float),cast(replace('[PSQL1_prXX]', ',','.') as float),cast(replace('[T1_prXX]', ',','.') as float),[Serial_prXX],'[CompDateAndTime]'));
SetChenjPer([DateSQL1_prXX],[DatePr1SQL_prXX]);
}
/*Запись в SQL2*/
if "[DatePr2SQL_prXX]"<>"[DateSQL2_prXX]" then
{
SQLExcec([run], set dateformat dmy  delete from [Table_prXX] where dates='[DatePr2SQL_prXX]');
SQLExcec([run], set dateformat dmy  Insert into [Table_prXX] (Dates,V,Vru,Qru,Q,P,T,SerialNumber,DateSave) values('[DatePr2SQL_prXX]',cast(replace('[Vsy2_prXX]', ',','.') as float),cast(replace('[Vry2_prXX]', ',','.') as float),cast(replace('[Qry2_prXX]', ',','.') as float),cast(replace('[Qsy2_prXX]', ',','.') as float),cast(replace('[PSQL2_prXX]', ',','.') as float),cast(replace('[T2_prXX]', ',','.') as float),[Serial_prXX],'[CompDateAndTime]'));
SetChenjPer([DateSQL2_prXX],[DatePr2SQL_prXX]);
}
}