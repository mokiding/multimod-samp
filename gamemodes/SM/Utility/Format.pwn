#include <YSI\y_hooks>

hook OnGameModeInit()
{
	print("\n[OnGameModeInit] Initialising 'Utility/Format'...");
}


FormatNumber(number)
{
	new Str[15];
	format(Str, 15, "%d", number);

	if (strlen(Str) < sizeof(Str))
	{
	if (number >= 1000 && number < 10000)
		strins( Str, ",", 1, sizeof(Str));

	else if (number >= 10000 && number < 100000)
			strins(Str, ",", 2, sizeof(Str));

	else if (number >= 100000 && number < 1000000)
			strins(Str, ",", 3, sizeof(Str));

	else if (number >= 1000000 && number < 10000000)
			strins(Str, ",", 1, sizeof(Str)),strins(Str, ",", 5, sizeof(Str));

	else if (number >= 10000000 && number < 100000000)
			strins(Str, ",", 2, sizeof(Str)),strins(Str, ",", 6, sizeof(Str));

	else if (number >= 100000000 && number < 1000000000)
			strins(Str, ",", 3, sizeof(Str)),strins(Str, ",", 7, sizeof(Str));

	else if (number >= 1000000000 && number < 10000000000)
			strins(Str, ",", 1, sizeof(Str)),
			strins(Str, ",", 5, sizeof(Str)),
			strins(Str, ",", 9, sizeof(Str));
	else format(Str, 10, "%d", number);
	}
	else  format( Str, 15, "<BUG>" );
	return Str;
}

PhoneFormat(phonenumber)
{
	new number[16],negativ = 0, sep[2], tmp; sep = "-";
	if(phonenumber < 0) negativ = 1;
	format(number, sizeof(number), "%d", phonenumber);
	for(new i = strlen(number); i > negativ + 1; i--)
	{
		tmp++;
		if(tmp == 4)
		{
	strins(number, sep, i - 1); tmp  = 0; }
		}
	return number;
}
