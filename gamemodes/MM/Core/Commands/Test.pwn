#include <YSI\y_hooks>
hook OnGameModeInit()
{
	print("\n[OnGameModeInit] Initialising 'Commands/Test'...");
	
}

YCMD:gotospawn(playerid, params[], help)
{
	SetPlayerPos(playerid, 1204.67639, -1747.03857, 40.58402);
	return 1;
}

YCMD:testplace(playerid, params[], help)
{
	SetPlayerPos(playerid, 333.4093,-101.3542,1.4156);
	return 1;
}

YCMD:ptest(playerid, params[], help)
{	
	SetVehicleParamsCarWindows(GetPlayerVehicleID(playerid), 0, 0, 0, 0);
	return 1;
}

YCMD:getweapon(playerid, params[], help)
{
	GivePlayerWeapon(playerid, 24, 100);
	return 1;
}


YCMD:ct(playerid, params[], help)
{
	new Lala[3];
	if(sscanf(params, "i",Lala[0])) return SendClientMessage(playerid, -1, "Format: /ct vehid");
	TogglePlayerSpectating(playerid, 1);
	PlayerSpectateVehicle(playerid, Lala[0],SPECTATE_MODE_SIDE);
	return 1;
}

YCMD:veh(playerid, params[], help)
{
	new Float:x,Float:y,Float:z;
	new Float:facing;
	new Float:distance;

	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, facing);

	new Float:size_x,Float:size_y,Float:size_z;
	GetVehicleModelInfo(411, VEHICLE_MODEL_INFO_SIZE, size_x, size_y, size_z);
	
	distance = size_x + 0.5;

	x += (distance * floatsin(-facing, degrees));
	y += (distance * floatcos(-facing, degrees));

	facing += 90.0;
	if(facing > 360.0) facing -= 360.0;
	
	return PutPlayerInVehicle(playerid, CreateVehicle(411, x, y, z + (size_z * 0.25), facing, 1, 1, -1), 0);
}