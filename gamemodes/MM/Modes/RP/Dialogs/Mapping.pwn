#include <YSI\y_hooks>

hook OnGameModeInit()
{
	print("\n[OnGameModeInit] Initialising 'Dialogs/Mapping'...");
}

Dialog:ObjectProperties(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		//CreateHouse(playerid,-1, HC[playerid][ExteriorX], HC[playerid][ExteriorY],HC[playerid][ExteriorZ], HC[playerid][InteriorX], HC[playerid][InteriorY],HC[playerid][InteriorZ], HC[playerid][InteriorInt], 1);
	}
	return 1;
}
