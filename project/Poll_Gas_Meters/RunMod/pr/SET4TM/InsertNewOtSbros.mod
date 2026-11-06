/*Делаем вставку от сброса если сменилась дата опроса*/
if "[BD_insert_PrXX]"<>"[BD_insert_real_PrXX]" then
{
	SetChenjPer([Tarif_PrXX],1);
	SetChenjPer([Arhive_PrXX],0);
	SetChenjPer([Arh_send_PrXX],[Arhive_PrXX]);
	SetChenjPer([BD_insert_real_PrXX],[BD_insert_PrXX]);
	LoocDriverf([run],Driver_PrXX);
	SQLExcec([run],set dateformat dmy delete Energetika..[BD_PrXX] where [dates]='[BD_insert_real_PrXX] 00:00:01');
	SQLExcec([run],set dateformat dmy insert Energetika..[BD_PrXX] ([Dates],F002,F003,F004,F005,F008,F009,F010,F011,F012,F013,F014,F015,F016,F017,F018,F019,F022,F024) values('[BD_insert_real_PrXX] 00:00:01','[Systime_PrXX]','[Date_And_Time_PrXX]','[Serial_Nom_PrXX]','[Date_Statr_PrXX]','[Chislo_Temper_1_PrXX]','[Koef_fransf_napr_PrXX]','[Koef_fransf_toc_PrXX]','[Koef_transf_PrXX]','[Klass_Ap_PrXX]','[Klass_Rp_PrXX]','[Namin_Napr_PrXX]','[Namin_Toc_PrXX]','[Post_sch_PrXX]','[Chislo_Temper_PrXX]','[Chislo_Napr_PrXX]','[Chislo_Faz_PrXX]','[Ti_me_srez_PrXX]','1'));

	SQLExcec([run],set dateformat dmy insert Energetika..[BD_PrXX] ([Dates],F002,F003,F004,F005,F008,F009,F010,F011,F012,F013,F014,F015,F016,F017,F018,F019,F022,F024) values('[BD_insert_real_PrXX] 00:00:01','[Systime_PrXX]','[Date_And_Time_PrXX]','[Serial_Nom_PrXX]','[Date_Statr_PrXX]','[Chislo_Temper_1_PrXX]','[Koef_fransf_napr_PrXX]','[Koef_fransf_toc_PrXX]','[Koef_transf_PrXX]','[Klass_Ap_PrXX]','[Klass_Rp_PrXX]','[Namin_Napr_PrXX]','[Namin_Toc_PrXX]','[Post_sch_PrXX]','[Chislo_Temper_PrXX]','[Chislo_Napr_PrXX]','[Chislo_Faz_PrXX]','[Ti_me_srez_PrXX]','2'));

	SQLExcec([run],set dateformat dmy insert Energetika..[BD_PrXX] ([Dates],F002,F003,F004,F005,F008,F009,F010,F011,F012,F013,F014,F015,F016,F017,F018,F019,F022,F024) values('[BD_insert_real_PrXX] 00:00:01','[Systime_PrXX]','[Date_And_Time_PrXX]','[Serial_Nom_PrXX]','[Date_Statr_PrXX]','[Chislo_Temper_1_PrXX]','[Koef_fransf_napr_PrXX]','[Koef_fransf_toc_PrXX]','[Koef_transf_PrXX]','[Klass_Ap_PrXX]','[Klass_Rp_PrXX]','[Namin_Napr_PrXX]','[Namin_Toc_PrXX]','[Post_sch_PrXX]','[Chislo_Temper_PrXX]','[Chislo_Napr_PrXX]','[Chislo_Faz_PrXX]','[Ti_me_srez_PrXX]','3'));

	SQLExcec([run],set dateformat dmy update Analyse..WayPortal set Temperatura='[Chislo_Temper_1_PrXX]', NameURL='[N_A_M_E_PrXX]', DateRes='[BD_insert_PrXX]', DateTimeServer='[Systime_PrXX]',DateTimeClient='[Date_And_Time_PrXX]', SerialNom='[Serial_Nom_PrXX]', DateIzgot='[Date_Statr_PrXX]', TypePr='[Type_sch_PrXX]', NomTelef='[Nom_Tel_PrXX]',NumPR='_PrXX' where [Table]='[BD_PrXX]');
}