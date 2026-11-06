if "[Otvet2_mosh_PrXX]"="0" then
{
SetChenjPer([Otvet2_mosh_PrXX],1);
	if "[Save_BD_Otvet1_PrXX]"="0" then
	{
	SetChenjPer([Total_sec_PrXX],0);
	SetChenjPer([Save_BD_Otvet1_PrXX],1);

/*Останавливаем индексирование архива*/
	DateDecDateChanj([Date_Dec_Date_PrXX]®[Date_And_Time_PrXX]®[DateTime_Srez_PrXX]®m) ;

	if [Date_Dec_Date_PrXX]>91 then
	{
/*Запись в БД архива мощьности*/
	SQLExcec([run],set dateformat dmy delete Energetika..[BD_PrXX]Che where [DateAndTime]='[DateTime_Srez_PrXX]:30:00');
	SQLExcec([run],set dateformat dmy insert Energetika..[BD_PrXX]Che ([DateAndTime],F002,F003,F004,F005,F008,F009,F010,F011,F012,F013,F014,F015,F016,F017,F018,F019,F022,F024) values('[DateTime_Srez_PrXX]:30:00','[Systime_PrXX]','[Date_And_Time_PrXX]','[Serial_Nom_PrXX]','[Date_Statr_PrXX]','[Chislo_Temper_1_PrXX]','[Koef_fransf_napr_PrXX]','[Koef_fransf_toc_PrXX]','[Koef_transf_PrXX]','[Klass_Ap_PrXX]','[Klass_Rp_PrXX]','[Namin_Napr_PrXX]','[Namin_Toc_PrXX]','[Post_sch_PrXX]','[Chislo_Temper_PrXX]','[Chislo_Napr_PrXX]','[Chislo_Faz_PrXX]','[Ti_me_srez_PrXX]','1'));
	
	SQLExcec([run],set dateformat dmy update Energetika..[BD_PrXX]Che  set F025=cast(replace('[Ok_Apl_PrXX]', ',','.') as float), F026=cast(replace('[Ok_Amn_PrXX]', ',','.') as float), F027=cast(replace('[Ok_Rpl_PrXX]', ',','.') as float), F028=cast(replace('[Ok_Rmn_PrXX]', ',','.') as float) where DateAndTime='[DateTime_Srez_PrXX]:30:00');

	SQLExcec([run],set dateformat dmy delete Energetika..[BD_PrXX]Che where [DateAndTime]='[DateTime_Srez_PrXX]:00:00');
	SQLExcec([run],set dateformat dmy insert Energetika..[BD_PrXX]Che ([DateAndTime],F002,F003,F004,F005,F008,F009,F010,F011,F012,F013,F014,F015,F016,F017,F018,F019,F022,F024) values('[DateTime_Srez_PrXX]:00:00','[Systime_PrXX]','[Date_And_Time_PrXX]','[Serial_Nom_PrXX]','[Date_Statr_PrXX]','[Chislo_Temper_1_PrXX]','[Koef_fransf_napr_PrXX]','[Koef_fransf_toc_PrXX]','[Koef_transf_PrXX]','[Klass_Ap_PrXX]','[Klass_Rp_PrXX]','[Namin_Napr_PrXX]','[Namin_Toc_PrXX]','[Post_sch_PrXX]','[Chislo_Temper_PrXX]','[Chislo_Napr_PrXX]','[Chislo_Faz_PrXX]','[Ti_me_srez_PrXX]','1'));
	
	SQLExcec([run],set dateformat dmy update Energetika..[BD_PrXX]Che  set F025=cast(replace('[Save_Byte_PrXX]', ',','.') as float), F026=cast(replace('[Save_Byte1_PrXX]', ',','.') as float), F027=cast(replace('[Save_Byte2_PrXX]', ',','.') as float), F028=cast(replace('[Save_Byte3_PrXX]', ',','.') as float) where DateAndTime='[DateTime_Srez_PrXX]:00:00');

/*Индексируем архив*/
	RunFormChenj([A_Dr_PrXX]=[A_Dr_PrXX]+24);
	RunFormChenj([A_Dr_data_PrXX]=[A_Dr_PrXX]+16);
	SetChenjPer([A_Dres_PrXX],[A_Dr_PrXX]);
	SetChenjPer([A_Dres1_PrXX],[A_Dr_data_PrXX]);
	}
	if [A_Dr_data_PrXX]>[Count_Arh_ivw_PrXX] then
	{
	SetChenjPer([A_Dr_PrXX],0);
	SetChenjPer([A_Dr_data_PrXX],0);
	}
}
}