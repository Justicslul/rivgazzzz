/* otvet ot pribora*/
if "[answer_dvcXX]"="0" then
{
  SetChenjPer([time_last_dvcXX],0);
}
/*real data*/
if [delay1_dvcXX]>4 then
{
	SetChenjPer([delay1_dvcXX],0);
	if "[RecordSQL]"="0" then{
   SQLExcec([run], INSERT [db_name_dvcXX] (date_record,F0,F1,F2,F3,F4,F5,F6,F7,F8,F9,F10) values(CONVERT(datetime,'[datetime]',104),'[i_a_dvcXX]','[i_b_dvcXX]','[i_c_dvcXX]','[reason_on_dvcXX]','[reason_off_dvcXX]','[error1_dvcXX]','[error2_dvcXX]','[u_a_dvcXX]','[u_b_dvcXX]','[u_c_dvcXX]','[error3_dvcXX]'));}


} 
