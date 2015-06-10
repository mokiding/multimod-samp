#include <YSI\y_hooks>

#define HOUSE_WW 300
#define MAX_HOUSES 300
#define HD HouseData
#define HC HouseCreating

new CreatedHouses = 0;

hook OnGameModeInit()
{
	print("\n[OnGameModeInit] Initialising 'System/House'...");
	mysql_tquery(handle, "SELECT * FROM `Houses`", "LoadHouses", "");
}

enum HouseInfo {
	ID,
	Owner[MAX_PLAYER_NAME],
	Price,
	Float:ExteriorX,
	Float:ExteriorY,
	Float:ExteriorZ,
	Float:InteriorX,
	Float:InteriorY,
	Float:InteriorZ,
	InteriorInt,
	Locked
}

enum CreatingHouse {
	Float:ExteriorX,
	Float:ExteriorY,
	Float:ExteriorZ,
	Float:InteriorX,
	Float:InteriorY,
	Float:InteriorZ,
	InteriorInt
}

new HouseCreating[MAX_PLAYERS][CreatingHouse];
new HouseData[MAX_HOUSES][HouseInfo];
//new InsideHouse[MAX_PLAYERS];

forward CreateHouse(playerid, hPrice, Float:hExteriorX, Float:hExteriorY, Float:hExteriorZ, Float:hInteriorX, Float:hInteriorY, Float:hInteriorZ, hInteriorInt, hLocked);
forward LoadHouses();

public OnPlayerPickUpDynamicPickup(playerid, pickupid)
{
	new string[128];
	for(new h; h < MAX_HOUSES; h++)
	{
		if(IsPlayerInRangeOfPoint(playerid, 3.5, HD[h][ExteriorX], HD[h][ExteriorY], HD[h][ExteriorZ]))
		{
			format(string, sizeof(string), "HID: %d", HD[h][ID]);
			SendClientMessage(playerid, WHITE, string);
			if(strcmp(HD[h][Owner], "", true) == 0)
			{
				format(string, sizeof(string), "Na kupnji\n~R~/nekakomanda~w~ da kupis za %d $", HD[h][Price]);
				GameTextForPlayer(playerid, string, 5000, 5);
			}
			else
			{
				if(HD[h][Locked] == 1)
				{
					format(string, sizeof(string), "%'s Kuca\n~r~Zakljucana", HD[h][Price]);
				}
				else
				{
					format(string, sizeof(string), "%'s Kuca\n~g~Otkljucana", HD[h][Price]);
				}
				GameTextForPlayer(playerid, string, 5000, 5);
			}
		}
	}
	return 1;
}

public LoadHouses()
{
	if(!cache_get_row_count()) return print("\n[ERROR] Failed to initialise 'System/House'...");
	cache_get_data(rows, fields, handle);
	for(new i, j = cache_get_row_count(); i < j ; i++)
	{
		HD[i][ID] = cache_get_field_content_int(i, "ID");
		cache_get_field_content(i, "Owner", HD[i][Owner]);
		HD[i][Price] = cache_get_field_content_int(i, "Price");
		HD[i][ExteriorX] = cache_get_field_content_float(i, "ExteriorX");
		HD[i][ExteriorY] = cache_get_field_content_float(i, "ExteriorY");
		HD[i][ExteriorZ] = cache_get_field_content_float(i, "ExteriorZ");
		HD[i][InteriorX] = cache_get_field_content_float(i, "InteriorX");
		HD[i][InteriorY] = cache_get_field_content_float(i, "InteriorY");
		HD[i][InteriorZ] = cache_get_field_content_float(i, "InteriorZ");
		HD[i][InteriorInt] = cache_get_field_content_int(i, "InteriorInt");
		HD[i][Locked] = cache_get_field_content_int(i, "Locked");
	
		if(strlen(HD[i][Owner]) > 0)
		{
			CreateDynamicPickup(1273, 1, HD[i][ExteriorX], HD[i][ExteriorY], HD[i][ExteriorZ], -1);
		}
		else
		{
			CreateDynamicPickup(1272, 1, HD[i][ExteriorX], HD[i][ExteriorY], HD[i][ExteriorZ], -1);
		}
	
		printf("House %d created", i);
		CreatedHouses++;
	}
	return true;
}

public CreateHouse(playerid, hPrice, Float:hExteriorX, Float:hExteriorY, Float:hExteriorZ, Float:hInteriorX, Float:hInteriorY, Float:hInteriorZ, hInteriorInt, hLocked)
{
	new HouseID = CreatedHouses + 1;
	if(HouseID < MAX_HOUSES)
	{
		new query[256];
		mysql_format(handle, query, sizeof(query), "INSERT INTO Houses (ID, Owner, Price, ExteriorX, ExteriorY, ExteriorZ, InteriorX, InteriorY, InteriorZ, InteriorInt, Locked) VALUES ('%d', '', %d, %f, %f, %f, %f, %f, %f, %d, '1')", HouseID, hPrice, hExteriorX, hExteriorY, hExteriorZ, hInteriorX, hInteriorY, hInteriorZ, hInteriorInt);
		mysql_tquery(handle, query, "", "");
		CreateDynamicPickup(1272, 1, hExteriorX, hExteriorY, hExteriorZ, 0);
		printf("House %d created", HouseID);
		HD[HouseID][ID] = HouseID;
		HD[HouseID][Price] = hPrice;
	 	HD[HouseID][ExteriorX] = hExteriorX;
		HD[HouseID][ExteriorY] = hExteriorY;
		HD[HouseID][ExteriorZ] = hExteriorZ;
		HD[HouseID][InteriorX] = hInteriorX;
		HD[HouseID][InteriorY] = hInteriorY;
		HD[HouseID][InteriorZ] = hInteriorZ;
		HD[HouseID][InteriorInt] = hInteriorInt;
		HD[HouseID][Locked] = hLocked;
		format(HD[HouseID][Owner], 24, "");
		SendClientMessage(playerid, -1,""#SMCOLOR"[SM] {FFFF00}Kuca kreirana !");
		CreatedHouses = HouseID;
	}
	else
	{
		SendClientMessage(playerid, -1,""#SMCOLOR"[SM] {FFFF00}MAX_HOUSES je pun ... Obavesti mokija o ovoj gresci !");
	}
	return true;
}