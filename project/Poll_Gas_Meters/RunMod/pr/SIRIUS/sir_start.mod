/* otvet ot pribora*/
if "[answer_dvcXX]"="0" then
{
  SetChenjPer([time_last_dvcXX],0);
}
/*real data*/
if [delay1_dvcXX]>10 then
{
   SetChenjPer([delay1_dvcXX],0);
    SQLExcec([run], INSERT [db_name_dvcXX] (date_record,F0,F1,F2,F3,F4,F5,F6) values(CONVERT(datetime,'[datetime]',104),'[i_a_dvcXX]','[i_b_dvcXX]','[i_c_dvcXX]','[reason_on_dvcXX]','[reason_off_dvcXX]','[error1_dvcXX]','[error2_dvcXX]'));	 
} 
/*arhiv*/
if "[command_answer_dvcXX]"="3" then
{
  if "[a_dt_off_dvcXX]"<>"0.0.0 0:0:0" then
  {
     SQLExcec([run], DELETE from [db_name_dvcXX]_arhiv WHERE DateAndTime='[a_dt_off_dvcXX]');
     SQLExcec([run], INSERT [db_name_dvcXX]_arhiv (DateAndTime,F0,F1,F2,F3,F4,F5,F6,F7,F8,F9,F10,F11,F12,F13,F14,F15,F16,F17,F18,F19,F20,F21,F22) values('[a_dt_off_dvcXX]','[a_reason_off_dvcXX]','[a_kz_dvcXX]','[a_ikz_dvcXX]','[a_len_kz_dvcXX]','[a_time_off_dvcXX]','[a_time_def_dvcXX]','[a_reason_on_dvcXX]','[a_dt_on_dvcXX]','[a_ia_dvcXX]','[a_ib_dvcXX]','[a_ic_dvcXX]','[a_i2_dvcXX]','[a_i01_dvcXX]','[a_i0v_dvcXX]','[a_iax_dvcXX]','[a_iay_dvcXX]','[a_ibx_dvcXX]','[a_iby_dvcXX]','[a_icx_dvcXX]','[a_icy_dvcXX]','[a_i2x_dvcXX]','[a_i2y_dvcXX]','[a_tumb_dvcXX]'));	  
  }
  SetChenjPer([command_dvcXX],9);
}
/*correct reading arhiv*/
if "[command_answer_dvcXX]"="9" then
{
  SetChenjPer([command_dvcXX],3);
}