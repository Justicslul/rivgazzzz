if "[D1_prXX]"<>"[D2_prXX]" then
{
/*Раздница времени прибора и заданной для опроса в часах*/
DateDecDateChanj([D3_prXX]®[D1_prXX]®[D2_prXX]®h);
RunFormChenj([D4_prXX]=[D4_prXX]-([D3_prXX]));
}