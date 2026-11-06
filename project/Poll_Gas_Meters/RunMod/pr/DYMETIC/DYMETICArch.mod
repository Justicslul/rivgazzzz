Var mails_prXX=0;
/***********************************************************************************************************************************************/
if [Raznica_prXX] > 0 then
{
	if [Otvet1_prXX] = 0 then 
		{   

/****************************************************************************************************************************************************/
	 SQLExcec([run], UPDATE [GAZ]..[UUGDataProverka] SET [Date_Update] = '[CompDateAndTime]' WHERE [IDObj] = '[Table_prXX]');
	 SQLExcec([run], UPDATE [GAZ]..[UUGDataProverka] SET [DateSys] = '[CompDateAndTime]' WHERE [IDObj] = '[Table_prXX]');
	 SQLExcec([run], UPDATE [GAZ]..[UUGDataProverka] SET [DatePrib] = '[RealDatePr_prXX]' WHERE [IDObj] = '[Table_prXX]');
/****************************************************************************************************************************************************/




/*************************************************************************************************************************************************/			    
/*Если дата с прибора и записанная в архив разные и в приборе нет данных, пишем нули*/
			if [Date_Otv_prXX] = 0 then
				{
				  SQLExcec([run], delete from [Table_prXX] where dates='[ChDate_prXX]');
		    		  SQLExcec([run], Insert into [Table_prXX] (Dates,V,Vru,Q,Qru,P,T,DateSave) values('[ChDate_prXX]',cast(replace('[Vru_prXX]', ',','.') as float),cast(replace('[Vsu_prXX]', ',','.') as float),cast(replace('[Vru_prXX]', ',','.') as float),cast(replace('[Vsu_prXX]', ',','.') as float),cast(replace('[DavlSQL_prXX]', ',','.') as float),cast(replace('[Temper_prXX]', ',','.') as float),'[CompDateAndTime]'));
			   	  DateSumDateChanj([ChDate_prXX]®[ChDate_prXX]®1®h);
				}
/*************************************************************************************************************************************************/
/*Идем в нормальном режиме*/
		else
			{
			DateDecDateChanj([RazDat_prXX]®[ChDate_prXX]®[Date_sob_prXX]®m);
		        if [RazDat_prXX] = 0 then
			    {	
			 	SQLExcec([run], delete from [Table_prXX] where dates='[Date_sob_prXX]');
				SQLExcec([run], Insert into [Table_prXX] (Dates,V,Vru,Q,Qru,P,T,DateSave) values('[Date_sob_prXX]',cast(replace('[Vru_prXX]', ',','.') as float),cast(replace('[Vsu_prXX]', ',','.') as float),cast(replace('[Vru_prXX]', ',','.') as float),cast(replace('[Vsu_prXX]', ',','.') as float),cast(replace('[DavlSQL_prXX]', ',','.') as float),cast(replace('[Temper_prXX]', ',','.') as float),'[CompDateAndTime]'));
		   	        DateSumDateChanj([ChDate_prXX]®[ChDate_prXX]®1®h);
		    }
		}
/*************************************************************************************************************************************************/
	}	
}
/**************************************************************************************************************************************************/
