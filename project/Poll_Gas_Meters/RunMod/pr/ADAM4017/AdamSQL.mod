Var Temp_pressure_prXX=0;

if [Temp_pressure_prXX]  > 4 then
{
SQLExcec([run], set dateformat dmy  Insert into [Table_prXX] ([Dates],[P],[Truba]) values('[CompDataTime]',cast(replace('[pressure_prXX]', ',','.') as float),'Real'));
SetChenjPer([Temp_pressure_prXX],0);
}else
{
RunFormChenj([Temp_pressure_prXX]=[Temp_pressure_prXX]+1);
}
