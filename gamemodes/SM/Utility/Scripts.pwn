#include <YSI\y_hooks>

hook OnGameModeInit()
{
	print("\n[OnGameModeInit] Initialising 'Utility/Scripts'...");
}

Port(playerid, Float:x, Float:y, Float:z, vw= 0, interior = 0)
{
	SetPlayerVirtualWorld(playerid,vw);
	SetPlayerInterior(playerid, interior);
	if(GetPlayerState(playerid) == 2)
	{
		SetVehiclePos(GetPlayerVehicleID(playerid), x,y,z);
		SetVehicleVirtualWorld(GetPlayerVehicleID(playerid), vw);
		LinkVehicleToInterior(GetPlayerVehicleID(playerid), interior);
	}
	else
	{
		SetPlayerPos(playerid, x,y,z);
	}
	return true;
}

GetNick(playerid)
{
	new pName[MAX_PLAYER_NAME];
	GetPlayerName(playerid, pName, sizeof(pName));
	return pName;
}