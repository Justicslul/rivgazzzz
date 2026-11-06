/*arhiv*/
/* otvet ot pribora*/
if "[newoff_dvcXX]"="1" then
{
   if "[answer_flag_dvcXX]"="0" then
   {
	if "[RecordSQL]"="0" then{
   	SetChenjPer([val_byte_dvcXX],0);
  	SetChenjPer([numb_func_dvcXX],5);
   	SQLExcec([run], DELETE from [db_name_dvcXX]_arhiv WHERE DateAndTime='[a_dt_off_dvcXX]');
   	SQLExcec([run], INSERT [db_name_dvcXX]_arhiv (DateAndTime,F0,F1,F2,F3,F4,F5,F6,F7,F8,F9,F10,F11,F12,F13,F14,F15,F16,F17,F18,F19,F20,F21,F22) values('[a_dt_off_dvcXX]','[a_reason_off_dvcXX]','[a_kz_dvcXX]','[a_ikz_dvcXX]','[a_len_kz_dvcXX]','[a_time_off_dvcXX]','[a_time_def_dvcXX]','[a_reason_on_dvcXX]','[a_dt_on_dvcXX]','[a_ia_dvcXX]','[a_ib_dvcXX]','[a_ic_dvcXX]','[a_i2_dvcXX]','[a_i01_dvcXX]','[a_i0v_dvcXX]','[a_iax_dvcXX]','[a_iay_dvcXX]','[a_ibx_dvcXX]','[a_iby_dvcXX]','[a_icx_dvcXX]','[a_icy_dvcXX]','[a_i2x_dvcXX]','[a_i2y_dvcXX]','[a_tumb_dvcXX]'));}
   }
}
if "[newoff_dvcXX]"="0" then
{
   if "[answer_flag_dvcXX]"="0" then
   {
   	SetChenjPer([numb_func_dvcXX],1);
   	SetChenjPer([val_byte_dvcXX],1);
   	RunFormChenj([adr_rec_dvcXX]=[adr_rec_dvcXX]+4);
   	RunFormChenj([adr_flag_dvcXX]=[adr_flag_dvcXX]+1);
   	if [adr_rec_dvcXX]>128 then
   	{
		SetChenjPer([adr_rec_dvcXX],96);
  		SetChenjPer([adr_flag_dvcXX],0);
   	}
   }  
}