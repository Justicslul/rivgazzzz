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
    SQLExcec([run], INSERT [db_name_dvcXX]_arhiv (DateAndTime,F0,F1,F2,F4,F5,F6,F7,F8,F9,F10,F11,F14,F15,F16,F17,F18,F19,F22,F23,F24,F25,F26,F27,F28,F29,F30,F31,F32,F33,F34,F35,F36,F37,F38,F39,F40,F41,F42,F43,F44,F45,F46,F47,F48,F49) values('[a_dt_off_dvcXX]','[a_reason_off_dvcXX]','[a_kz_dvcXX]','[a_ikz_dvcXX]','[a_time_off_dvcXX]','[a_time_def_dvcXX]','[a_reason_on_dvcXX]','[a_dt_on_dvcXX]','[a_ia_dvcXX]','[a_ib_dvcXX]','[a_ic_dvcXX]','[a_i2_dvcXX]','[a_iax_dvcXX]','[a_iay_dvcXX]','[a_ibx_dvcXX]','[a_iby_dvcXX]','[a_icx_dvcXX]','[a_icy_dvcXX]','[a_tumb_dvcXX]','[a_ua_dvcXX]','[a_ub_dvcXX]','[a_uc_dvcXX]','[a_uab_dvcXX]','[a_ubc_dvcXX]','[a_uca_dvcXX]','[a_uabv_dvcXX]','[a_ubcv_dvcXX]','[a_ucav_dvcXX]','[a_3u0_dvcXX]','[a_u2_dvcXX]','[a_uax_dvcXX]','[a_uay_dvcXX]','[a_ubx_dvcXX]','[a_uby_dvcXX]','[a_ucx_dvcXX]','[a_ucy_dvcXX]','[a_uabx_dvcXX]','[a_uaby_dvcXX]','[a_ubcx_dvcXX]','[a_ubcy_dvcXX]','[a_uabxv_dvcXX]','[a_uabyv_dvcXX]','[a_ubcxv_dvcXX]','[a_ubcyv_dvcXX]','[a_ucaxv_dvcXX]','[a_ucayv_dvcXX]'));
	}
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