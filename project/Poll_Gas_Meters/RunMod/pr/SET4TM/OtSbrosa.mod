Var Arhive_PrXX=0;

if [Tarif_PrXX]=4 then
{
	if [Otvet_PrXX]=0 then
	{
	SetChenjPer([Total_sec_PrXX],0);
	SetChenjPer([Tarif_PrXX],0);
	RunFormChenj([Arhive_PrXX]=[Arhive_PrXX]+1);
	if [Arhive_PrXX]>2 then 
		{
		LoocDrivert([run],Driver_PrXX);
		SetChenjPer([Arhive_PrXX],2);
		}
	SetChenjPer([Arh_send_PrXX],[Arhive_PrXX]);
	ItemIndexToText([Arh_send_PrXX],[Arh_send_x]);
	if "[Arh_send_PrXX]"="48" then {RunFormChenj([Arh_send_PrXX]=[Arh_send_PrXX]+[BD_insert_Pr1:4 5]);}
	}
}
else
{
/*Обрабатываем архив от сброса*/
	if "[Otvet_PrXX]"="0" then
	{
	SetChenjPer([Total_sec_PrXX],0);
	if "[Arhive_PrXX]"="0" then{
	SQLExcec([run],set dateformat dmy update Energetika..[BD_PrXX]  set F025=cast(replace('[A_pl_PrXX]', ',','.') as float), F026=cast(replace('[A_min_PrXX]', ',','.') as float), F027=cast(replace('[R_pl_PrXX]', ',','.') as float), F028=cast(replace('[R_min_PrXX]', ',','.') as float) where [Dates]='[BD_insert_real_PrXX] 00:00:01' and F024=[Tarif_PrXX]);}
	if "[Arhive_PrXX]"="1" then{
	SQLExcec([run],set dateformat dmy update Energetika..[BD_PrXX]  set F033=cast(replace('[A_pl_PrXX]', ',','.') as float), F034=cast(replace('[A_min_PrXX]', ',','.') as float), F035=cast(replace('[R_pl_PrXX]', ',','.') as float), F036=cast(replace('[R_min_PrXX]', ',','.') as float) where [Dates]='[BD_insert_real_PrXX] 00:00:01' and F024=[Tarif_PrXX]);}
	RunFormChenj([Tarif_PrXX]=[Tarif_PrXX]+1);
	}
}