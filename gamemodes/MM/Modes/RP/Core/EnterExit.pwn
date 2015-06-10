#include <YSI\y_hooks>

#define MAX_ENTER_EXITS 100
#define MOVEMENT_SPEED 0.8 //slican default gta:sa
#define HEIGHT 1.0

hook OnGameModeInit()
{
	print("\n[OnGameModeInit] Initialising 'System/EnterExit'...");
	mysql_tquery(handle, "SELECT * FROM `EnterExit`", "LoadEnterExit", "");
}

forward LoadEnterExit();

enum EnterExitInfo
{
	E_ID,
	E_object,
	E_area,
	bool:E_exist,
	Float:E_x,
	Float:E_y,
	Float:E_z,
	Float:E_enterx,
	Float:E_entery,
	Float:E_enterz,
	E_enterinterior,
	E_enterworld,
	bool:E_movedup,
}

new gEnterExit[MAX_ENTER_EXITS][EnterExitInfo];
new gPlayerEntering[MAX_PLAYERS];
new gPlayerPoint[MAX_PLAYERS];
new Text3D:gPlayerDebugEE[MAX_PLAYERS][MAX_ENTER_EXITS];

hook OnPlayerConnect(playerid)
{
	gPlayerPoint[playerid] = -1;
	gPlayerEntering[playerid] = 0;
}

hook OnPlayerDisconnect(playerid, reason)
{
	gPlayerPoint[playerid] = -1;
	gPlayerEntering[playerid] = 0;
}

public OnDynamicObjectMoved(objectid)
{
	for(new enterexitid; enterexitid < MAX_ENTER_EXITS; enterexitid++)
	{
		if(gEnterExit[enterexitid][E_exist])
		{
			if(objectid == gEnterExit[enterexitid][E_object])
			{
				if(gEnterExit[enterexitid][E_movedup])
				{
					gEnterExit[enterexitid][E_movedup] = false;
					return MoveDynamicObject(gEnterExit[enterexitid][E_object], gEnterExit[enterexitid][E_x], gEnterExit[enterexitid][E_y], gEnterExit[enterexitid][E_z], MOVEMENT_SPEED);
				}
				else if(! gEnterExit[enterexitid][E_movedup])
				{
					gEnterExit[enterexitid][E_movedup] = true;
					return MoveDynamicObject(gEnterExit[enterexitid][E_object], gEnterExit[enterexitid][E_x], gEnterExit[enterexitid][E_y], gEnterExit[enterexitid][E_z] + HEIGHT, MOVEMENT_SPEED);
				}
				else return 0;
			}
		}
	}
	return 1;
}

public OnPlayerEnterDynamicArea(playerid, areaid)
{
	if(gPlayerEntering[playerid] == 0)
	{
		if(IsAreaEnterExit(areaid))
		{
			gPlayerEntering[playerid] = 2;
			gPlayerPoint[playerid] = GetEnterExitID(areaid);
			FadePlayerScreen(playerid);
		}
	}
	return 1;
}

public OnPlayerLeaveDynamicArea(playerid, areaid)
{
	if(gPlayerEntering[playerid] != 0)
	{
		gPlayerEntering[playerid] = gPlayerEntering[playerid] - 1;
	}
	return 1;
}

CreateEnter(id,Float:x, Float:y, Float:z, Float:enterx, Float:entery, Float:enterz, interior)
{
	for(new enterexitid = 0; enterexitid < MAX_ENTER_EXITS; enterexitid++)
	{
		if(! gEnterExit[enterexitid][E_exist])
		{
			gEnterExit[enterexitid][E_ID] = id;
			gEnterExit[enterexitid][E_object] = CreateDynamicObject(19198, x, y, z, 0.0, 0.0, 0.0, 0, 0, -1, 200, 200);
			gEnterExit[enterexitid][E_area] = CreateDynamicCircle(x, y, 1, 0, 0, -1);
			gEnterExit[enterexitid][E_exist] = true;
			gEnterExit[enterexitid][E_x] = x;
			gEnterExit[enterexitid][E_y] = y;
			gEnterExit[enterexitid][E_z] = z;
			gEnterExit[enterexitid][E_enterx] = enterx;
			gEnterExit[enterexitid][E_entery] = entery;
			gEnterExit[enterexitid][E_enterz] = enterz;
			gEnterExit[enterexitid][E_enterinterior] = interior;
			gEnterExit[enterexitid][E_enterworld] = 1;
			MoveDynamicObject(gEnterExit[enterexitid][E_object], x, y, z + HEIGHT, MOVEMENT_SPEED);
			gEnterExit[enterexitid][E_movedup] = true;
			return enterexitid;
		}
	}
	return -1;
}

CreateExit(id,Float:x, Float:y, Float:z, Float:enterx, Float:entery, Float:enterz, interior)
{
	for(new enterexitid = 0; enterexitid < MAX_ENTER_EXITS; enterexitid++)
	{	
		if(! gEnterExit[enterexitid][E_exist])
		{
			gEnterExit[enterexitid][E_ID] = id;
			gEnterExit[enterexitid][E_object] = CreateDynamicObject(19198, x, y, z, 0.0, 0.0, 0.0, 1, interior, -1, 200, 200);
			gEnterExit[enterexitid][E_area] = CreateDynamicCircle(x, y, 1, 1, interior, -1);
			gEnterExit[enterexitid][E_exist] = true;
			gEnterExit[enterexitid][E_x] = x;
			gEnterExit[enterexitid][E_y] = y;
			gEnterExit[enterexitid][E_z] = z;
			gEnterExit[enterexitid][E_enterx] = enterx;
			gEnterExit[enterexitid][E_entery] = entery;
			gEnterExit[enterexitid][E_enterz] = enterz;
			gEnterExit[enterexitid][E_enterinterior] = 0;
			gEnterExit[enterexitid][E_enterworld] = 0;
			MoveDynamicObject(gEnterExit[enterexitid][E_object], x, y, z + HEIGHT, MOVEMENT_SPEED);
			gEnterExit[enterexitid][E_movedup] = true;
			return enterexitid;
		}
	}
	return -1;
}

IsValidEnterExit(enterexitid)
{
	if(enterexitid >= MAX_ENTER_EXITS || enterexitid < 0)
	{
	    printf("Error::IsValidEnterExit()::Out Of Bounds::%i", enterexitid);
	    return false;
	}
	return gEnterExit[enterexitid][E_exist];
}

DbgEnter(playerid,onoff)
{
	
	if(onoff == 1)//on
	{
		for(new enterexit = 0; enterexit < MAX_ENTER_EXITS; enterexit++)
		{
			if(IsValidEnterExit(enterexit))
			{
				new string[64];
				format(string, sizeof(string), "EnterExit ID(mysql): %i", gEnterExit[enterexit][E_ID]);
				gPlayerDebugEE[playerid][enterexit] = CreateDynamic3DTextLabel(string, 0x008080FF, gEnterExit[enterexit][E_x], gEnterExit[enterexit][E_y], gEnterExit[enterexit][E_z], 100, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, playerid, 100);
			}
		}
	}
	else if(onoff == 0)//of
	{
		for(new enterexit = 0; enterexit < MAX_ENTER_EXITS; enterexit++)
		{
			if(IsValidEnterExit(enterexit))
			{
				DestroyDynamic3DTextLabel(gPlayerDebugEE[playerid][enterexit]);
			}
		}
	}
	return 1;
}

ReloadEnterExtis()
{
	for(new enterexit = 0; enterexit < MAX_ENTER_EXITS; enterexit++)
	{
		DestoryEnterExit(enterexit);
	}
	return mysql_tquery(handle, "SELECT * FROM `EnterExit`", "LoadEnterExit", "");
}

DestoryEnterExit(enterexitid)
{
	if(! IsValidEnterExit(enterexitid)) return false;
	DestroyDynamicObject(gEnterExit[enterexitid][E_object]);
	DestroyDynamicArea(gEnterExit[enterexitid][E_area]);
	gEnterExit[enterexitid][E_ID] = -1;
	gEnterExit[enterexitid][E_exist] = false;
	gEnterExit[enterexitid][E_x] = 0.0;
	gEnterExit[enterexitid][E_y] = 0.0;
	gEnterExit[enterexitid][E_z] = 0.0;
	gEnterExit[enterexitid][E_enterx] = 0.0;
	gEnterExit[enterexitid][E_entery] = 0.0;
	gEnterExit[enterexitid][E_enterz] = 0.0;
	gEnterExit[enterexitid][E_enterinterior] = -1;
	gEnterExit[enterexitid][E_enterworld] = -1;
	return 1;
}

DeleteEnterExit(enterexitid)
{
	if(! IsValidEnterExit(enterexitid)) return false;

	DestroyDynamicObject(gEnterExit[enterexitid][E_object]);
	DestroyDynamicArea(gEnterExit[enterexitid][E_area]);
	gEnterExit[enterexitid][E_ID] = -1;
	gEnterExit[enterexitid][E_exist] = false;
	gEnterExit[enterexitid][E_x] = 0.0;
	gEnterExit[enterexitid][E_y] = 0.0;
	gEnterExit[enterexitid][E_z] = 0.0;
	gEnterExit[enterexitid][E_enterx] = 0.0;
	gEnterExit[enterexitid][E_entery] = 0.0;
	gEnterExit[enterexitid][E_enterz] = 0.0;
	gEnterExit[enterexitid][E_enterinterior] = -1;
	gEnterExit[enterexitid][E_enterworld] = -1;
	new query[512];
	mysql_format(handle, query, sizeof(query) ,"DELETE FROM `EnterExit` WHERE `id` = '%d'", enterexitid);
	mysql_tquery(handle, query);
	return true;
}

CountAllEnterExits()
{
	new count = 0;
    for(new enterexit = 0; enterexit < MAX_ENTER_EXITS; enterexit++)
	{
		if(IsValidEnterExit(enterexit))
		{
			count ++;
		}
	}
	return count;
}

IsAreaEnterExit(areaid)
{
	for(new enterexitid; enterexitid < MAX_ENTER_EXITS; enterexitid++)
	{
		if(gEnterExit[enterexitid][E_exist])
		{
			if(gEnterExit[enterexitid][E_area] == areaid) return true;
		}
	}
	return false;
}

GetEnterExitID(areaid)
{
	for(new enterexitid; enterexitid < MAX_ENTER_EXITS; enterexitid++)
	{
		if(gEnterExit[enterexitid][E_exist])
		{
			if(gEnterExit[enterexitid][E_area] == areaid) return enterexitid;
		}
	}
	return false;
}

hook OnPlayerFadeFinish(playerid)
{
	if(gPlayerPoint[playerid] != -1)
	{
		gPlayerPoint[playerid] = -1;
		TogglePlayerControllable(playerid, true);
	}
}


hook OnPlayerFadeMiddle(playerid)
{
	if(gPlayerPoint[playerid] != -1)
	{
		new enterexitid = gPlayerPoint[playerid];
		TogglePlayerControllable(playerid, false);
		SetPlayerPos(playerid, gEnterExit[enterexitid][E_enterx], gEnterExit[enterexitid][E_entery], gEnterExit[enterexitid][E_enterz]);
		SetCameraBehindPlayer(playerid);
		SetPlayerInterior(playerid, gEnterExit[enterexitid][E_enterinterior]);
		SetPlayerVirtualWorld(playerid, gEnterExit[enterexitid][E_enterworld]);
	}
}

public LoadEnterExit()
{
	if(!cache_get_row_count()) return print("\n[ERROR] Failed to initialise 'System/EnterExit'...");
	new ID,Float:EX,Float:EY,Float:EZ,Float:RX,Float:RY,Float:RZ,EI;
	cache_get_data(rows, fields, handle);
	for(new i, j = cache_get_row_count(); i < j ; i++)
	{
		ID = cache_get_field_content_int(i, "ID");
		EX = cache_get_field_content_float(i, "EnterX");
		EY = cache_get_field_content_float(i, "EnterY");
		EZ = cache_get_field_content_float(i, "EnterZ");
		RX = cache_get_field_content_float(i, "ExitX");
		RY = cache_get_field_content_float(i, "ExitY");
		RZ = cache_get_field_content_float(i, "ExitZ");
		EI = cache_get_field_content_int(i, "Inter");
		CreateEnter(ID,EX, EY, EZ, RX, RY, RZ, EI);
		CreateExit(ID,RX, RY, RZ, EX, EY, EZ, EI);
		printf("EnterExit %d created", i);
	}
	return true;
}