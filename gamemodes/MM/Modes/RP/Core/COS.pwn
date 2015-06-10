#include <YSI\y_hooks>

#define VD VehData
#define VTYPE_RENT 1
#define VTYPE_ORG 2
#define VTYPE_PRIVATE 3
#define VTYPE_ADMIN 4
#define VTYPE_JOB 5
#define VTYPE_SHOW 6

new CreatedVehicles = 0;

hook OnGameModeInit()
{
	print("\n[OnGameModeInit] Initialising 'System/COS'...");
	mysql_tquery(handle, "SELECT * FROM `vehicles`", "LoadVehicles", "");
}

enum VehInfo {
	ID,
	GameID,
	Model,
	Owner[MAX_PLAYER_NAME],
	Float:PosX,
	Float:PosY,
	Float:PosZ,
	Float:Angle,
	Color1,
	Color2,
	Int,
	VW,
	Locked,
	Fuel,
	Siren,
	Type,
	TypeID
}

new VehData[MAX_VEHICLES][VehInfo];

forward LoadVehicles();
public LoadVehicles()
{
	if(!cache_get_row_count()) return print("\n[ERROR] Failed to nitialise 'System/COS'...");
	cache_get_data(rows, fields, handle);
	for(new i, j = cache_get_row_count(); i < j ; i++)
	{
		VD[i][ID] = cache_get_field_content_int(i, "ID");
		cache_get_field_content(i, "Owner", VD[i][Owner]);
		VD[i][Model] = cache_get_field_content_int(i, "Model");
		VD[i][PosX] = cache_get_field_content_float(i, "PosX");
		VD[i][PosY] = cache_get_field_content_float(i, "PosY");
		VD[i][PosZ] = cache_get_field_content_float(i, "PosZ");
		VD[i][Angle] = cache_get_field_content_float(i, "Angle");
		VD[i][Color1] = cache_get_field_content_int(i, "Color1");
		VD[i][Color2] = cache_get_field_content_int(i, "Color2");
		VD[i][Int] = cache_get_field_content_int(i, "Int");
		VD[i][VW] = cache_get_field_content_int(i, "VW");
		VD[i][Locked] = cache_get_field_content_int(i, "Locked");
		VD[i][Fuel] = cache_get_field_content_int(i, "Fuel");
		VD[i][Type] = cache_get_field_content_int(i, "Type");
		VD[i][TypeID] = cache_get_field_content_int(i, "TypeID");
		VD[i][Siren] = cache_get_field_content_int(i, "Siren");
		VD[i][GameID] = AddStaticVehicle(VD[i][Model], VD[i][PosX],VD[i][PosY],VD[i][PosZ], VD[i][Angle], VD[i][Color1], VD[i][Color2]);
		printf("Vehicle %d loaded", i);
		CreatedVehicles++;
	}
	return true;
}
