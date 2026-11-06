Var TimeH_prXX=0;
Var TimeD_prXX=0;
Var Date_Tmp_prXX=0;

if "[Date_Tmp_prXX]"<>"[prdata_prXX]" then
{
SetChenjPer([prdata_prXX],[prdata_prXX]);

/*Раздница времени прибора и заданной для опроса в часах*/
DateDecDateChanj([TimeH_prXX]®[prdata_prXX]®[DateStartOpros_prXX]®h);
DateDecDateChanj([TimeD_prXX]®[prdata_prXX]®[DateStartOpros_prXX]®d);
/*Раздница текущей по указателя и количества часов*/
/*Часы*/
RunFormChenj([StartH_prXX]=[adrch_prXX]-([TimeH_prXX]));
if [StartH_prXX] < 18464 then
{
/*19967-18464=1503*/
RunFormChenj([StartH_prXX]=[StartH_prXX]+1503);
}
if [StartH_prXX] > 19967 then
{
/*19967-18464=1503*/
RunFormChenj([StartH_prXX]=[StartH_prXX]-1503);
}
/*Сутки*/
RunFormChenj([StartD_prXX]=[adrsy_prXX]-([TimeD_prXX]));
if [StartD_prXX] < 19968 then
{
/*20352-19968=384*/
RunFormChenj([StartD_prXX]=[StartD_prXX]+384);
}
if [StartD_prXX] > 20352 then
{
/*20352-19968=384*/
RunFormChenj([StartD_prXX]=[StartD_prXX]-384);
}
}