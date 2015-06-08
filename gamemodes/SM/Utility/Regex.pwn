#include <YSI\y_hooks>

hook OnGameModeInit()
{
	print("\n[OnGameModeInit] Initialising 'Utility/Regx'...");
}

hook OnGameModeExit()
{
	regex_end();
}

ValidEmail(string[])
{
	if(strlen(string) < 4 || strlen(string) > 50) return false;
	new EmailRegex[] = "[a-zA-Z0-9_\\.]+@([a-zA-Z0-9\\-]+\\.)+[a-zA-Z]{2,4}";
	if(regex_match(string, EmailRegex)>=0)
	{
		return true;
	}
	else
	{
		return false;
	}
}

ValidRPName(string[])
{	
	new RPNameRegex[] = "([A-Z]{1,1})[a-z]{2,9}+_([A-Z]{1,1})[a-z]{2,9}";
	if(regex_match(string, RPNameRegex)>=0)
	{
		return true;
	}
	else
	{
		return false;
	}
}