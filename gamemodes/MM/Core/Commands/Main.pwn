#include <YSI\y_hooks>

hook OnGameModeInit()
{
	print("\n[OnGameModeInit] Initialising 'Commands/Main'...");
}

public e_COMMAND_ERRORS:OnPlayerCommandReceived(playerid, cmdtext[], e_COMMAND_ERRORS:success)
{
	if(success != COMMAND_OK)
	{
		new string[128]; 
		format(string, sizeof(string), ""#SMCOLOR"[SM] {FF0000}Komanda %s ne postoji. Kucaj /help za listu komandi !", cmdtext);
		SendClientMessage(playerid,-1, string); 
		return COMMAND_OK;
	}
	return COMMAND_OK;
}