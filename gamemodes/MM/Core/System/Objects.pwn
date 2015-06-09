#include <YSI\y_hooks>

#define MAXOBJ 40000

hook OnGameModeInit()
{
	print("\n[OnGameModeInit] Initialising 'System/Objects'...");
	mysql_tquery(handle, "SELECT * FROM `Objects`", "LoadObjects", "");
}


#define GetDynamicObjectModel(%0) Streamer_GetIntData(STREAMER_TYPE_OBJECT, %0, E_STREAMER_MODEL_ID)
#define GetDynamicObjectVW(%0) Streamer_GetIntData(STREAMER_TYPE_OBJECT, %0, E_STREAMER_WORLD_ID)
#define GetDynamicObjectInt(%0) Streamer_GetIntData(STREAMER_TYPE_OBJECT, %0, E_STREAMER_INTERIOR_ID)

new Object[MAXOBJ];

forward LoadObjects();
public LoadObjects()
{
	if(!cache_get_row_count()) return print("\n[ERROR] Failed to initialise 'System/Objects'...");
	cache_get_data(rows, fields, handle);
	new model,Float:oX,Float:oY,Float:oZ,Float:rX,Float:rY,Float:rZ,WorldID,InteriorID,Stream,Draw;
	for(new i, j = cache_get_row_count(); i < j ; i++)
	{
		model = cache_get_field_content_int(i, "ModelID");
		oX = cache_get_field_content_float(i, "CordX");
		oY= cache_get_field_content_float(i, "CordY");
		oZ = cache_get_field_content_float(i, "CordZ");
		rX = cache_get_field_content_float(i, "RotationX");
		rY = cache_get_field_content_float(i, "RotationY");
		rZ = cache_get_field_content_float(i, "RotationZ");
		WorldID = cache_get_field_content_int(i, "WorldID");
		InteriorID = cache_get_field_content_int(i, "InteriorID");
		Stream = cache_get_field_content_int(i, "Stream");
		Draw = cache_get_field_content_int(i, "Draw");

		Object[i] = CreateDynamicObject(model, oX, oY, oZ, rX, rY, rZ, WorldID, InteriorID, -1, Stream, Draw);
		#if defined GMDEBUG
		printf("Object %d created", i);
		#endif
	}
	mysql_tquery(handle, "SELECT * FROM `ObjectMaterials`", "LoadMaterials", "");
	return true;
}

forward LoadMaterials();
public LoadMaterials()
{
	if(!cache_get_row_count()) return print("\n[ERROR] Failed to initialise 'System/Objects - Material'...");
	cache_get_data(rows, fields, handle);
	new objectid,materialindex,modelid,materialcolor,txdname[64],texturename[64];
	for(new i, j = cache_get_row_count(); i < j ; i++)
	{
		objectid = cache_get_field_content_int(i, "ObjectID");
		materialindex = cache_get_field_content_int(i, "MaterialIndex");
		modelid = cache_get_field_content_int(i, "ModelID");
		cache_get_field_content(i, "TXDName", txdname);
		cache_get_field_content(i, "TextureName", texturename);
		materialcolor = cache_get_field_content_int(i, "MaterialColor");

		SetDynamicObjectMaterial(Object[objectid], materialindex, modelid, txdname, texturename, materialcolor);
		#if defined GMDEBUG
		printf("Material %d for object %d created", i,objectid);
		#endif
	}
	return true;
}

hook OnPlayerConnect(playerid)
{
	mysql_tquery(handle, "SELECT * FROM `RemoveBuilding`", "RemoveBuilding", "d",playerid);
}

forward RemoveBuilding(playerid);
public RemoveBuilding(playerid)
{
	if(!cache_get_row_count()) return print("\n[ERROR] Failed to initialise 'System/Objects - RemoveBuilding'...");
	cache_get_data(rows, fields, handle);
	new ModelID,Float:CordY,Float:CordX,Float:CordZ,Float:Radius;
	for(new i, j = cache_get_row_count(); i < j ; i++)
	{
		ModelID = cache_get_field_content_int(i, "ModelID");
		CordX = cache_get_field_content_float(i, "CordX");
		CordY = cache_get_field_content_float(i, "CordY");
		CordZ = cache_get_field_content_float(i, "CordZ");
		Radius = cache_get_field_content_float(i, "Radius");
		RemoveBuildingForPlayer(playerid, ModelID, CordX, CordY, CordZ, Radius);
		#if defined GMDEBUG
		printf("Bulding %d removed for %d player !", i,playerid);
		#endif
	}
	return true;
}

public OnPlayerSelectDynamicObject(playerid, objectid, modelid, Float:x, Float:y, Float:z)
{
	new string[128];
	format(string, sizeof(string), "Izabrao si objekat %i", objectid);
	SendClientMessageToAll(-1, string);
	return 1;
}

YCMD:selobject(playerid, params[], help)
{
	SelectObject(playerid);
	return 1;
}

