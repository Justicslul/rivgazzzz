Var windowHour = "8";
if "[SystemHour]" = [windowHour] then {
	SetChenjPer([Driver_PrXX], E.inf);
}
else {
	SetChenjPer([Driver_PrXX], EK270_fast.inf);
}