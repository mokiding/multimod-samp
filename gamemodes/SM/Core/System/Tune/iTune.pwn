//iTuning filterscript created by busternr !Do not remove the credits !
#include <a_samp>
#include <zcmd>
#include <sscanf2>
#include <streamer>
#include <mSelection>
#define COLOR_WHITE 0xFFFFFFFF
#define COLOR_GREY 0xAFAFAFFF
#define COLOR_YELLOW 0xFFFF00FF
#define DIALOG_TUNING 2105
new Vehicles = mS_INVALID_LISTID;
new FrontBumpers = mS_INVALID_LISTID;
new RearBumpers = mS_INVALID_LISTID;
new Roofs = mS_INVALID_LISTID;
new Hoods = mS_INVALID_LISTID;
new Spoilers = mS_INVALID_LISTID;
new SideSkirts = mS_INVALID_LISTID;
new Wheels = mS_INVALID_LISTID;
enum playerSets
{
	Float:AddSpeed,
	Float:FrontBumperX,
	Float:FrontBumperY,
	Float:FrontBumperZ,
	Float:FrontBumperRX,
	Float:FrontBumperRY,
	Float:FrontBumperRZ,
	FrontBumperID,
	FrontBumper,
	Float:RearBumperX,
	Float:RearBumperY,
	Float:RearBumperZ,
	Float:RearBumperRX,
	Float:RearBumperRY,
	Float:RearBumperRZ,
	RearBumperID,
	RearBumper,
	Float:RoofX,
	Float:RoofY,
	Float:RoofZ,
	Float:RoofRX,
	Float:RoofRY,
	Float:RoofRZ,
	RoofID,
	Roof,
	Float:HoodX,
	Float:HoodY,
	Float:HoodZ,
	Float:HoodRX,
	Float:HoodRY,
	Float:HoodRZ,
	HoodID,
	Hood,
	Float:SpoilerX,
	Float:SpoilerY,
	Float:SpoilerZ,
	Float:SpoilerRX,
	Float:SpoilerRY,
	Float:SpoilerRZ,
	SpoilerID,
	Spoiler,
	Float:WheelX,
	Float:WheelY,
	Float:WheelZ,
	Float:WheelRX,
	Float:WheelRY,
	Float:WheelRZ,
	WheelID,
	Wheel,
	Float:SideSkirt1X,
	Float:SideSkirt1Y,
	Float:SideSkirt1Z,
	Float:SideSkirt1RX,
	Float:SideSkirt1RY,
	Float:SideSkirt1RZ,
	SideSkirt1ID,
	SideSkirt1,
	Float:SideSkirt2X,
	Float:SideSkirt2Y,
	Float:SideSkirt2Z,
	Float:SideSkirt2RX,
	Float:SideSkirt2RY,
	Float:SideSkirt2RZ,
	SideSkirt2ID,
	SideSkirt2,
	EditingPart,
	PlayerVehicle,
	LeftRight,
	EditStatus,
	EditingTimer,
}
new PlayerData[MAX_PLAYERS][playerSets];
forward GetKeys(playerid);

public OnFilterScriptInit()
{
    print("\n----------------------------------");
    Vehicles = LoadModelSelectionMenu("Vehicles.txt");
    FrontBumpers = LoadModelSelectionMenu("Front Bumpers.txt");
	RearBumpers = LoadModelSelectionMenu("Rear Bumpers.txt");
	Roofs = LoadModelSelectionMenu("Roofs.txt");
	Hoods = LoadModelSelectionMenu("Hoods.txt");
	Spoilers = LoadModelSelectionMenu("Spoilers.txt");
	SideSkirts = LoadModelSelectionMenu("Side Skirts.txt");
	Wheels = LoadModelSelectionMenu("Wheels.txt");
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

public OnPlayerConnect(playerid)
{
    return 1;
}

stock SaveTuning(playerid)
{
    new string[128], File:tuning=fopen("Tuning.txt", io_append);
    if(tuning)
    {
        if(PlayerData[playerid][EditingPart] == 1) format(string, sizeof(string), "Front Bumper-vehicle id:%d|object id:%d|x:%f|y:%f|z:%f|rx:%f|ry:%f|rz:%f\r\n", PlayerData[playerid][PlayerVehicle] ,PlayerData[playerid][FrontBumperID], PlayerData[playerid][FrontBumperX], PlayerData[playerid][FrontBumperY], PlayerData[playerid][FrontBumperZ], PlayerData[playerid][FrontBumperRX], PlayerData[playerid][FrontBumperRY], PlayerData[playerid][FrontBumperRZ]);
    	else if(PlayerData[playerid][EditingPart] == 2) format(string, sizeof(string), "Rear Bumper-vehicle id:%d|object id:%d|x:%f|y:%f|z:%f|rx:%f|ry:%f|rz:%f\r\n", PlayerData[playerid][PlayerVehicle] ,PlayerData[playerid][RearBumperID], PlayerData[playerid][RearBumperX], PlayerData[playerid][RearBumperY], PlayerData[playerid][RearBumperZ], PlayerData[playerid][RearBumperRX], PlayerData[playerid][RearBumperRY], PlayerData[playerid][RearBumperRZ]);
    	else if(PlayerData[playerid][EditingPart] == 3) format(string, sizeof(string), "Roof-vehicle id:%d|object id:%d|x:%f|y:%f|z:%f|rx:%f|ry:%f|rz:%f\r\n", PlayerData[playerid][PlayerVehicle] ,PlayerData[playerid][RoofID], PlayerData[playerid][RoofX], PlayerData[playerid][RoofY], PlayerData[playerid][RoofZ], PlayerData[playerid][RoofRX], PlayerData[playerid][RoofRY], PlayerData[playerid][RoofRZ]);
    	else if(PlayerData[playerid][EditingPart] == 4) format(string, sizeof(string), "Hood-vehicle id:%d|object id:%d|x:%f|y:%f|z:%f|rx:%f|ry:%f|rz:%f\r\n", PlayerData[playerid][PlayerVehicle] ,PlayerData[playerid][HoodID], PlayerData[playerid][HoodX], PlayerData[playerid][HoodY], PlayerData[playerid][HoodZ], PlayerData[playerid][HoodRX], PlayerData[playerid][HoodRY], PlayerData[playerid][HoodRZ]);
    	else if(PlayerData[playerid][EditingPart] == 5) format(string, sizeof(string), "Spoiler-vehicle id:%d|object id:%d|x:%f|y:%f|z:%f|rx:%f|ry:%f|rz:%f\r\n", PlayerData[playerid][PlayerVehicle] ,PlayerData[playerid][SpoilerID], PlayerData[playerid][SpoilerX], PlayerData[playerid][SpoilerY], PlayerData[playerid][SpoilerZ], PlayerData[playerid][SpoilerRX], PlayerData[playerid][SpoilerRY], PlayerData[playerid][SpoilerRZ]);
    	else if(PlayerData[playerid][EditingPart] == 6) format(string, sizeof(string), "Side Skirt 1-vehicle id:%d|object id:%d|x:%f|y:%f|z:%f|rx:%f|ry:%f|rz:%f\r\n", PlayerData[playerid][PlayerVehicle] ,PlayerData[playerid][SideSkirt1ID], PlayerData[playerid][SideSkirt1X], PlayerData[playerid][SideSkirt1Y], PlayerData[playerid][SideSkirt1Z], PlayerData[playerid][SideSkirt1RX], PlayerData[playerid][SideSkirt1RY], PlayerData[playerid][SideSkirt1RZ]);
    	else if(PlayerData[playerid][EditingPart] == 6) format(string, sizeof(string), "Side Skirt 2-vehicle id:%d|object id:%d|x:%f|y:%f|z:%f|rx:%f|ry:%f|rz:%f\r\n", PlayerData[playerid][PlayerVehicle] ,PlayerData[playerid][SideSkirt2ID], PlayerData[playerid][SideSkirt2X], PlayerData[playerid][SideSkirt2Y], PlayerData[playerid][SideSkirt2Z], PlayerData[playerid][SideSkirt2RX], PlayerData[playerid][SideSkirt2RY], PlayerData[playerid][SideSkirt2RZ]);
    	else if(PlayerData[playerid][EditingPart] == 6) format(string, sizeof(string), "Wheel-vehicle id:%d|object id:%d|x:%f|y:%f|z:%f|rx:%f|ry:%f|rz:%f\r\n", PlayerData[playerid][PlayerVehicle] ,PlayerData[playerid][WheelID], PlayerData[playerid][WheelX], PlayerData[playerid][WheelY], PlayerData[playerid][WheelZ], PlayerData[playerid][WheelRX], PlayerData[playerid][WheelRY], PlayerData[playerid][WheelRZ]);
		fwrite(tuning, string);
		fclose(tuning);
    }
}

public OnPlayerModelSelection(playerid, response, listid, modelid)
{
	if(listid == FrontBumpers)
    {
    	if(response)
        {
            PlayerData[playerid][PlayerVehicle] = GetPlayerVehicleID(playerid);
	  	 	PlayerData[playerid][FrontBumper] = CreateObject(modelid, 0.0, 0.0, -14.0, 0.0, 0.0, 0.0);
	  	  	PlayerData[playerid][FrontBumperID] = modelid;
	  	  	PlayerData[playerid][FrontBumperX] = 0.0;
	  	  	PlayerData[playerid][FrontBumperY] = 0.0;
	  	  	PlayerData[playerid][FrontBumperZ] = 1.0;
	  	  	PlayerData[playerid][FrontBumperRX] = 0.0;
	  	  	PlayerData[playerid][FrontBumperRY] = 0.0;
	  	  	PlayerData[playerid][FrontBumperRZ] = 0.0;
			PlayerData[playerid][EditingPart] = 1;
			PlayerData[playerid][EditingTimer] = SetTimerEx("GetKeys", 30, true, "i", playerid);
        }
        else ShowPlayerDialog(playerid, DIALOG_TUNING, DIALOG_STYLE_LIST, "What would you like to tune ?", "Front Bumper\nRear Bumper\nRoof\nHood\nSpoilers\nSide Skirts\nWheels", "Select", "Exit");
        return 1;
    }
	if(listid == RearBumpers)
    {
    	if(response)
        {
			PlayerData[playerid][PlayerVehicle] = GetPlayerVehicleID(playerid);
	  	 	PlayerData[playerid][RearBumper] = CreateObject(modelid, 0.0, 0.0, -14.0, 0.0, 0.0, 0.0);
	  	  	PlayerData[playerid][RearBumperID] = modelid;
	  	  	PlayerData[playerid][RearBumperX] = 0.0;
	  	  	PlayerData[playerid][RearBumperY] = 0.0;
	  	  	PlayerData[playerid][RearBumperZ] = 1.0;
	  	  	PlayerData[playerid][RearBumperRX] = 0.0;
	  	  	PlayerData[playerid][RearBumperRY] = 0.0;
	  	  	PlayerData[playerid][RearBumperRZ] = 0.0;
			PlayerData[playerid][EditingPart] = 2;
			PlayerData[playerid][EditingTimer] = SetTimerEx("GetKeys", 30, true, "i", playerid);
        }
        else ShowPlayerDialog(playerid, DIALOG_TUNING, DIALOG_STYLE_LIST, "What would you like to tune ?", "Front Bumper\nRear Bumper\nRoof\nHood\nSpoilers\nSide Skirts\nWheels", "Select", "Exit");
        return 1;
    }
   	if(listid == Roofs)
    {
    	if(response)
        {
			PlayerData[playerid][PlayerVehicle] = GetPlayerVehicleID(playerid);
	  	 	PlayerData[playerid][Roof] = CreateObject(modelid, 0.0, 0.0, -14.0, 0.0, 0.0, 0.0);
	  	  	PlayerData[playerid][RoofID] = modelid;
	  	  	PlayerData[playerid][RoofX] = 0.0;
	  	  	PlayerData[playerid][RoofY] = 0.0;
	  	  	PlayerData[playerid][RoofZ] = 1.0;
	  	  	PlayerData[playerid][RoofRX] = 0.0;
	  	  	PlayerData[playerid][RoofRY] = 0.0;
	  	  	PlayerData[playerid][RoofRZ] = 0.0;
			PlayerData[playerid][EditingPart] = 3;
			PlayerData[playerid][EditingTimer] = SetTimerEx("GetKeys", 30, true, "i", playerid);
        }
        else ShowPlayerDialog(playerid, DIALOG_TUNING, DIALOG_STYLE_LIST, "What would you like to tune ?", "Front Bumper\nRear Bumper\nRoof\nHood\nSpoilers\nSide Skirts\nWheels", "Select", "Exit");
        return 1;
    }
    if(listid == Hoods)
    {
        if(response)
        {
			PlayerData[playerid][PlayerVehicle] = GetPlayerVehicleID(playerid);
	  	 	PlayerData[playerid][Hood] = CreateObject(modelid, 0.0, 0.0, -14.0, 0.0, 0.0, 0.0);
	  	  	PlayerData[playerid][HoodID] = modelid;
	  	  	PlayerData[playerid][HoodX] = 0.0;
	  	  	PlayerData[playerid][HoodY] = 0.0;
	  	  	PlayerData[playerid][HoodZ] = 1.0;
	  	  	PlayerData[playerid][HoodRX] = 0.0;
	  	  	PlayerData[playerid][HoodRY] = 0.0;
	  	  	PlayerData[playerid][HoodRZ] = 0.0;
			PlayerData[playerid][EditingPart] = 4;
			PlayerData[playerid][EditingTimer] = SetTimerEx("GetKeys", 30, true, "i", playerid);
        }
        else ShowPlayerDialog(playerid, DIALOG_TUNING, DIALOG_STYLE_LIST, "What would you like to tune ?", "Front Bumper\nRear Bumper\nRoof\nHood\nSpoilers\nSide Skirts\nWheels", "Select", "Exit");
        return 1;
    }
   	if(listid == Spoilers)
    {
        if(response)
        {
			PlayerData[playerid][PlayerVehicle] = GetPlayerVehicleID(playerid);
	  	 	PlayerData[playerid][Spoiler] = CreateObject(modelid, 0.0, 0.0, -14.0, 0.0, 0.0, 0.0);
	  	  	PlayerData[playerid][SpoilerID] = modelid;
	  	  	PlayerData[playerid][SpoilerX] = 0.0;
	  	  	PlayerData[playerid][SpoilerY] = 0.0;
	  	  	PlayerData[playerid][SpoilerZ] = 1.0;
	  	  	PlayerData[playerid][SpoilerRX] = 0.0;
	  	  	PlayerData[playerid][SpoilerRY] = 0.0;
	  	  	PlayerData[playerid][SpoilerRZ] = 0.0;
			PlayerData[playerid][EditingPart] = 5;
			PlayerData[playerid][EditingTimer] = SetTimerEx("GetKeys", 30, true, "i", playerid);
        }
        else ShowPlayerDialog(playerid, DIALOG_TUNING, DIALOG_STYLE_LIST, "What would you like to tune ?", "Front Bumper\nRear Bumper\nRoof\nHood\nSpoilers\nSide Skirts\nWheels", "Select", "Exit");
        return 1;
    }
	if(listid == SideSkirts)
    {
    	if(response)
        {
            if(!PlayerData[playerid][SideSkirt1])
            {
				PlayerData[playerid][PlayerVehicle] = GetPlayerVehicleID(playerid);
		  	 	PlayerData[playerid][SideSkirt1] = CreateObject(modelid, 0.0, 0.0, -14.0, 0.0, 0.0, 0.0);
		  	  	PlayerData[playerid][SideSkirt1ID] = modelid;
		  	  	PlayerData[playerid][SideSkirt1X] = 0.0;
		  	  	PlayerData[playerid][SideSkirt1Y] = 0.0;
		  	  	PlayerData[playerid][SideSkirt1Z] = 1.0;
		  	  	PlayerData[playerid][SideSkirt1RX] = 0.0;
		  	  	PlayerData[playerid][SideSkirt1RY] = 0.0;
		  	  	PlayerData[playerid][SideSkirt1RZ] = 0.0;
				PlayerData[playerid][EditingPart] = 6;
				PlayerData[playerid][EditingTimer] = SetTimerEx("GetKeys", 30, true, "i", playerid);
			}
			else
            {
                PlayerData[playerid][PlayerVehicle] = GetPlayerVehicleID(playerid);
		  	 	PlayerData[playerid][SideSkirt2] = CreateObject(modelid, 0.0, 0.0, -14.0, 0.0, 0.0, 0.0);
		  	  	PlayerData[playerid][SideSkirt2ID] = modelid;
		  	  	PlayerData[playerid][SideSkirt2X] = 0.0;
		  	  	PlayerData[playerid][SideSkirt2Y] = 0.0;
		  	  	PlayerData[playerid][SideSkirt2Z] = 1.0;
		  	  	PlayerData[playerid][SideSkirt2RX] = 0.0;
		  	  	PlayerData[playerid][SideSkirt2RY] = 0.0;
		  	  	PlayerData[playerid][SideSkirt2RZ] = 0.0;
				PlayerData[playerid][EditingPart] = 7;
				PlayerData[playerid][EditingTimer] = SetTimerEx("GetKeys", 30, true, "i", playerid);
            }
        }
        else ShowPlayerDialog(playerid, DIALOG_TUNING, DIALOG_STYLE_LIST, "What would you like to tune ?", "Front Bumper\nRear Bumper\nRoof\nHood\nSpoilers\nSide Skirts\nWheels", "Select", "Exit");
        return 1;
    }
    if(listid == Wheels)
    {
    	if(response)
        {
			PlayerData[playerid][PlayerVehicle] = GetPlayerVehicleID(playerid);
	  	 	PlayerData[playerid][Wheel] = CreateObject(modelid, 0.0, 0.0, -14.0, 0.0, 0.0, 0.0);
	  	  	PlayerData[playerid][WheelID] = modelid;
	  	  	PlayerData[playerid][WheelX] = 0.0;
	  	  	PlayerData[playerid][WheelY] = 0.0;
	  	  	PlayerData[playerid][WheelZ] = 1.0;
	  	  	PlayerData[playerid][WheelRX] = 0.0;
	  	  	PlayerData[playerid][WheelRY] = 0.0;
	  	  	PlayerData[playerid][WheelRZ] = 0.0;
			PlayerData[playerid][EditingPart] = 8;
			PlayerData[playerid][EditingTimer] = SetTimerEx("GetKeys", 30, true, "i", playerid);
		}
		else ShowPlayerDialog(playerid, DIALOG_TUNING, DIALOG_STYLE_LIST, "What would you like to tune ?", "Front Bumper\nRear Bumper\nRoof\nHood\nSpoilers\nSide Skirts\nWheels", "Select", "Exit");
		return 1;
    }
    if(listid == Vehicles)
	{
	    if(response)
	    {
	    	new Float:pos[3]; GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
	    	CreateVehicle(modelid, pos[0] + 2.5, pos[1], pos[2] + 2.5, 0.0, random(128), random(128), -1);
	    }
    	return 1;
	}
    return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_TUNING)
	{
	    if(response)
	    {
	        switch(listitem)
	        {
	            case 0:
	            {
             		ShowModelSelectionMenu(playerid, FrontBumpers, "Select Bumper");
	            }
	            case 1:
	            {
            		ShowModelSelectionMenu(playerid, RearBumpers, "Select Bumper");
	            }
	            case 2:
	            {
            		ShowModelSelectionMenu(playerid, Roofs, "Select Roof");
	            }
	            case 3:
	            {
            		ShowModelSelectionMenu(playerid, Hoods, "Select Hood");
	            }
	            case 4:
	            {
            		ShowModelSelectionMenu(playerid, Spoilers, "Select Spoiler");
	            }
	            case 5:
	            {
           			ShowModelSelectionMenu(playerid, SideSkirts, "Select Side Skirt");
	            }
	            case 6:
	            {
           			ShowModelSelectionMenu(playerid, Wheels, "Select Wheel");
	            }
	        }
	    }
	}
	return 1;
}

public GetKeys(playerid)
{
	new Keys, ud;
	PlayerData[playerid][AddSpeed] = 0.005;
    GetPlayerKeys(playerid,Keys,ud,PlayerData[playerid][LeftRight]);
    if(PlayerData[playerid][LeftRight] == 128)
    {
        switch(PlayerData[playerid][EditStatus])
        {
            case 1:
            {
				if(PlayerData[playerid][EditingPart] == 1)
	    		{
	    		    PlayerData[playerid][FrontBumperX] = floatadd(PlayerData[playerid][FrontBumperX], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 2)
	    		{
	    		    PlayerData[playerid][RearBumperX] = floatadd(PlayerData[playerid][RearBumperX], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 3)
	    		{
	    		    PlayerData[playerid][RoofX] = floatadd(PlayerData[playerid][RoofX], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 4)
	    		{
	    		    PlayerData[playerid][HoodX] = floatadd(PlayerData[playerid][HoodX], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 5)
	    		{
	    		    PlayerData[playerid][SpoilerX] = floatadd(PlayerData[playerid][SpoilerX], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 6)
	    		{
	    		    PlayerData[playerid][SideSkirt1X] = floatadd(PlayerData[playerid][SideSkirt1X], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 7)
	    		{
	    		    PlayerData[playerid][SideSkirt2X] = floatadd(PlayerData[playerid][SideSkirt2X], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 8)
	    		{
	    		    PlayerData[playerid][WheelX] = floatadd(PlayerData[playerid][WheelX], PlayerData[playerid][AddSpeed]);
	    		}
            }
            case 2:
            {
                if(PlayerData[playerid][EditingPart] == 1)
	    		{
	    		    PlayerData[playerid][FrontBumperY] = floatadd(PlayerData[playerid][FrontBumperY], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 2)
	    		{
	    		    PlayerData[playerid][RearBumperY] = floatadd(PlayerData[playerid][RearBumperY], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 3)
	    		{
	    		    PlayerData[playerid][RoofY] = floatadd(PlayerData[playerid][RoofY], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 4)
	    		{
	    		    PlayerData[playerid][HoodY] = floatadd(PlayerData[playerid][HoodY], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 5)
	    		{
	    		    PlayerData[playerid][SpoilerY] = floatadd(PlayerData[playerid][SpoilerY], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 6)
	    		{
	    		    PlayerData[playerid][SideSkirt1Y] = floatadd(PlayerData[playerid][SideSkirt1Y], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 7)
	    		{
	    		    PlayerData[playerid][SideSkirt2Y] = floatadd(PlayerData[playerid][SideSkirt2Y], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 8)
	    		{
	    		    PlayerData[playerid][WheelY] = floatadd(PlayerData[playerid][WheelY], PlayerData[playerid][AddSpeed]);
	    		}
            }
            case 3:
            {
                if(PlayerData[playerid][EditingPart] == 1)
	    		{
	    		    PlayerData[playerid][FrontBumperZ] = floatadd(PlayerData[playerid][FrontBumperZ], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 2)
	    		{
	    		    PlayerData[playerid][RearBumperZ] = floatadd(PlayerData[playerid][RearBumperZ], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 3)
	    		{
	    		    PlayerData[playerid][RoofZ] = floatadd(PlayerData[playerid][RoofZ], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 4)
	    		{
	    		    PlayerData[playerid][HoodZ] = floatadd(PlayerData[playerid][HoodZ], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 5)
	    		{
	    		    PlayerData[playerid][SpoilerZ] = floatadd(PlayerData[playerid][SpoilerZ], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 6)
	    		{
	    		    PlayerData[playerid][SideSkirt1Z] = floatadd(PlayerData[playerid][SideSkirt1Z], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 7)
	    		{
	    		    PlayerData[playerid][SideSkirt2Z] = floatadd(PlayerData[playerid][SideSkirt2Z], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 8)
	    		{
	    		    PlayerData[playerid][WheelZ] = floatadd(PlayerData[playerid][WheelZ], PlayerData[playerid][AddSpeed]);
	    		}
            }
            case 4:
            {
                if(PlayerData[playerid][EditingPart] == 1)
	    		{
	    		    PlayerData[playerid][FrontBumperRX] = floatadd(PlayerData[playerid][FrontBumperRX], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 2)
	    		{
	    		    PlayerData[playerid][RearBumperRX] = floatadd(PlayerData[playerid][RearBumperRX], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 3)
	    		{
	    		    PlayerData[playerid][RoofRX] = floatadd(PlayerData[playerid][RoofRX], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 4)
	    		{
	    		    PlayerData[playerid][HoodRX] = floatadd(PlayerData[playerid][HoodRX], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 5)
	    		{
	    		    PlayerData[playerid][SpoilerRX] = floatadd(PlayerData[playerid][SpoilerRX], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 6)
	    		{
	    		    PlayerData[playerid][SideSkirt1RX] = floatadd(PlayerData[playerid][SideSkirt1RX], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 7)
	    		{
	    		    PlayerData[playerid][SideSkirt2RX] = floatadd(PlayerData[playerid][SideSkirt2RX], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 8)
	    		{
	    		    PlayerData[playerid][WheelRX] = floatadd(PlayerData[playerid][WheelRX], PlayerData[playerid][AddSpeed]);
	    		}
            }
            case 5:
            {
                if(PlayerData[playerid][EditingPart] == 1)
	    		{
	    		    PlayerData[playerid][FrontBumperRY] = floatadd(PlayerData[playerid][FrontBumperRY], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 2)
	    		{
	    		    PlayerData[playerid][RearBumperRY] = floatadd(PlayerData[playerid][RearBumperRY], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 3)
	    		{
	    		    PlayerData[playerid][RoofRY] = floatadd(PlayerData[playerid][RoofRY], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 4)
	    		{
	    		    PlayerData[playerid][HoodRY] = floatadd(PlayerData[playerid][HoodRY], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 5)
	    		{
	    		    PlayerData[playerid][SpoilerRY] = floatadd(PlayerData[playerid][SpoilerRY], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 6)
	    		{
	    		    PlayerData[playerid][SideSkirt1RY] = floatadd(PlayerData[playerid][SideSkirt1RY], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 7)
	    		{
	    		    PlayerData[playerid][SideSkirt2RY] = floatadd(PlayerData[playerid][SideSkirt2RY], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 8)
	    		{
	    		    PlayerData[playerid][WheelRY] = floatadd(PlayerData[playerid][WheelRY], PlayerData[playerid][AddSpeed]);
	    		}
            }
            case 6:
            {
                if(PlayerData[playerid][EditingPart] == 1)
	    		{
	    		    PlayerData[playerid][FrontBumperRZ] = floatadd(PlayerData[playerid][FrontBumperRZ], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 2)
	    		{
	    		    PlayerData[playerid][RearBumperRZ] = floatadd(PlayerData[playerid][RearBumperRZ], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 3)
	    		{
	    		    PlayerData[playerid][RoofRZ] = floatadd(PlayerData[playerid][RoofRZ], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 4)
	    		{
	    		    PlayerData[playerid][HoodRZ] = floatadd(PlayerData[playerid][HoodRZ], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 5)
	    		{
	    		    PlayerData[playerid][SpoilerRZ] = floatadd(PlayerData[playerid][SpoilerRZ], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 6)
	    		{
	    		    PlayerData[playerid][SideSkirt1RZ] = floatadd(PlayerData[playerid][SideSkirt1RZ], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 7)
	    		{
	    		    PlayerData[playerid][SideSkirt2RZ] = floatadd(PlayerData[playerid][SideSkirt2RZ], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 8)
	    		{
	    		    PlayerData[playerid][WheelRZ] = floatadd(PlayerData[playerid][WheelRZ], PlayerData[playerid][AddSpeed]);
	    		}
            }
		}
	}
	else if(PlayerData[playerid][LeftRight] == -128)
	{
     switch(PlayerData[playerid][EditStatus])
        {
            case 1:
            {
				if(PlayerData[playerid][EditingPart] == 1)
	    		{
	    		    PlayerData[playerid][FrontBumperX] = floatsub(PlayerData[playerid][FrontBumperX], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 2)
	    		{
	    		    PlayerData[playerid][RearBumperX] = floatsub(PlayerData[playerid][RearBumperX], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 3)
	    		{
	    		    PlayerData[playerid][RoofX] = floatsub(PlayerData[playerid][RoofX], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 4)
	    		{
	    		    PlayerData[playerid][HoodX] = floatsub(PlayerData[playerid][HoodX], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 5)
	    		{
	    		    PlayerData[playerid][SpoilerX] = floatsub(PlayerData[playerid][SpoilerX], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 6)
	    		{
	    		    PlayerData[playerid][SideSkirt1X] = floatsub(PlayerData[playerid][SideSkirt1X], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 7)
	    		{
	    		    PlayerData[playerid][SideSkirt2X] = floatsub(PlayerData[playerid][SideSkirt2X], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 8)
	    		{
	    		    PlayerData[playerid][WheelX] = floatsub(PlayerData[playerid][WheelX], PlayerData[playerid][AddSpeed]);
	    		}
            }
            case 2:
            {
                if(PlayerData[playerid][EditingPart] == 1)
	    		{
	    		    PlayerData[playerid][FrontBumperY] = floatsub(PlayerData[playerid][FrontBumperY], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 2)
	    		{
	    		    PlayerData[playerid][RearBumperY] = floatsub(PlayerData[playerid][RearBumperY], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 3)
	    		{
	    		    PlayerData[playerid][RoofY] = floatsub(PlayerData[playerid][RoofY], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 4)
	    		{
	    		    PlayerData[playerid][HoodY] = floatsub(PlayerData[playerid][HoodY], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 5)
	    		{
	    		    PlayerData[playerid][SpoilerY] = floatsub(PlayerData[playerid][SpoilerY], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 6)
	    		{
	    		    PlayerData[playerid][SideSkirt1Y] = floatsub(PlayerData[playerid][SideSkirt1Y], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 7)
	    		{
	    		    PlayerData[playerid][SideSkirt2Y] = floatsub(PlayerData[playerid][SideSkirt2Y], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 8)
	    		{
	    		    PlayerData[playerid][WheelY] = floatsub(PlayerData[playerid][WheelY], PlayerData[playerid][AddSpeed]);
	    		}
            }
            case 3:
            {
                if(PlayerData[playerid][EditingPart] == 1)
	    		{
	    		    PlayerData[playerid][FrontBumperZ] = floatsub(PlayerData[playerid][FrontBumperZ], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 2)
	    		{
	    		    PlayerData[playerid][RearBumperZ] = floatsub(PlayerData[playerid][RearBumperZ], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 3)
	    		{
	    		    PlayerData[playerid][RoofZ] = floatsub(PlayerData[playerid][RoofZ], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 4)
	    		{
	    		    PlayerData[playerid][HoodZ] = floatsub(PlayerData[playerid][HoodZ], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 5)
	    		{
	    		    PlayerData[playerid][SpoilerZ] = floatsub(PlayerData[playerid][SpoilerZ], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 6)
	    		{
	    		    PlayerData[playerid][SideSkirt1Z] = floatsub(PlayerData[playerid][SideSkirt1Z], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 7)
	    		{
	    		    PlayerData[playerid][SideSkirt2Z] = floatsub(PlayerData[playerid][SideSkirt2Z], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 8)
	    		{
	    		    PlayerData[playerid][WheelZ] = floatsub(PlayerData[playerid][WheelZ], PlayerData[playerid][AddSpeed]);
	    		}
            }
            case 4:
            {
                if(PlayerData[playerid][EditingPart] == 1)
	    		{
	    		    PlayerData[playerid][FrontBumperRX] = floatsub(PlayerData[playerid][FrontBumperRX], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 2)
	    		{
	    		    PlayerData[playerid][RearBumperRX] = floatsub(PlayerData[playerid][RearBumperRX], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 3)
	    		{
	    		    PlayerData[playerid][RoofRX] = floatsub(PlayerData[playerid][RoofRX], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 4)
	    		{
	    		    PlayerData[playerid][HoodRX] = floatsub(PlayerData[playerid][HoodRX], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 5)
	    		{
	    		    PlayerData[playerid][SpoilerRX] = floatsub(PlayerData[playerid][SpoilerRX], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 6)
	    		{
	    		    PlayerData[playerid][SideSkirt1RX] = floatsub(PlayerData[playerid][SideSkirt1RX], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 7)
	    		{
	    		    PlayerData[playerid][SideSkirt2RX] = floatsub(PlayerData[playerid][SideSkirt2RX], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 8)
	    		{
	    		    PlayerData[playerid][WheelRX] = floatsub(PlayerData[playerid][WheelRX], PlayerData[playerid][AddSpeed]);
	    		}
            }
            case 5:
            {
                if(PlayerData[playerid][EditingPart] == 1)
	    		{
	    		    PlayerData[playerid][FrontBumperRY] = floatsub(PlayerData[playerid][FrontBumperRY], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 2)
	    		{
	    		    PlayerData[playerid][RearBumperRY] = floatsub(PlayerData[playerid][RearBumperRY], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 3)
	    		{
	    		    PlayerData[playerid][RoofRY] = floatsub(PlayerData[playerid][RoofRY], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 4)
	    		{
	    		    PlayerData[playerid][HoodRY] = floatsub(PlayerData[playerid][HoodRY], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 5)
	    		{
	    		    PlayerData[playerid][SpoilerRY] = floatsub(PlayerData[playerid][SpoilerRY], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 6)
	    		{
	    		    PlayerData[playerid][SideSkirt1RY] = floatsub(PlayerData[playerid][SideSkirt1RY], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 7)
	    		{
	    		    PlayerData[playerid][SideSkirt2RY] = floatsub(PlayerData[playerid][SideSkirt2RY], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 8)
	    		{
	    		    PlayerData[playerid][WheelRY] = floatsub(PlayerData[playerid][WheelRY], PlayerData[playerid][AddSpeed]);
	    		}
            }
            case 6:
            {
                if(PlayerData[playerid][EditingPart] == 1)
	    		{
	    		    PlayerData[playerid][FrontBumperRZ] = floatsub(PlayerData[playerid][FrontBumperRZ], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 2)
	    		{
	    		    PlayerData[playerid][RearBumperRZ] = floatsub(PlayerData[playerid][RearBumperRZ], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 3)
	    		{
	    		    PlayerData[playerid][RoofRZ] = floatsub(PlayerData[playerid][RoofRZ], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 4)
	    		{
	    		    PlayerData[playerid][HoodRZ] = floatsub(PlayerData[playerid][HoodRZ], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 5)
	    		{
	    		    PlayerData[playerid][SpoilerRZ] = floatsub(PlayerData[playerid][SpoilerRZ], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 6)
	    		{
	    		    PlayerData[playerid][SideSkirt1RZ] = floatsub(PlayerData[playerid][SideSkirt1RZ], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 7)
	    		{
	    		    PlayerData[playerid][SideSkirt2RZ] = floatsub(PlayerData[playerid][SideSkirt2RZ], PlayerData[playerid][AddSpeed]);
	    		}
	    		else if(PlayerData[playerid][EditingPart] == 8)
	    		{
	    		    PlayerData[playerid][WheelRZ] = floatsub(PlayerData[playerid][WheelRZ], PlayerData[playerid][AddSpeed]);
	    		}
            }
		}
	}
	if(PlayerData[playerid][EditingPart] == 1)
	{
 		AttachObjectToVehicle(PlayerData[playerid][FrontBumper], PlayerData[playerid][PlayerVehicle], PlayerData[playerid][FrontBumperX], PlayerData[playerid][FrontBumperY], PlayerData[playerid][FrontBumperZ], PlayerData[playerid][FrontBumperRX], PlayerData[playerid][FrontBumperRY], PlayerData[playerid][FrontBumperRZ]);
	}
	else if(PlayerData[playerid][EditingPart] == 2)
	{
 		AttachObjectToVehicle(PlayerData[playerid][RearBumper], PlayerData[playerid][PlayerVehicle], PlayerData[playerid][RearBumperX], PlayerData[playerid][RearBumperY], PlayerData[playerid][RearBumperZ], PlayerData[playerid][RearBumperRX], PlayerData[playerid][RearBumperRY], PlayerData[playerid][RearBumperRZ]);
	}
	else if(PlayerData[playerid][EditingPart] == 3)
	{
 		AttachObjectToVehicle(PlayerData[playerid][Roof], PlayerData[playerid][PlayerVehicle], PlayerData[playerid][RoofX], PlayerData[playerid][RoofY], PlayerData[playerid][RoofZ], PlayerData[playerid][RoofRX], PlayerData[playerid][RoofRY], PlayerData[playerid][RoofRZ]);
	}
	else if(PlayerData[playerid][EditingPart] == 4)
	{
		 AttachObjectToVehicle(PlayerData[playerid][Hood], PlayerData[playerid][PlayerVehicle], PlayerData[playerid][HoodX], PlayerData[playerid][HoodY], PlayerData[playerid][HoodZ], PlayerData[playerid][HoodRX], PlayerData[playerid][HoodRY], PlayerData[playerid][HoodRZ]);
	}
	else if(PlayerData[playerid][EditingPart] == 5)
	{
 		AttachObjectToVehicle(PlayerData[playerid][Spoiler], PlayerData[playerid][PlayerVehicle], PlayerData[playerid][SpoilerX], PlayerData[playerid][SpoilerY], PlayerData[playerid][SpoilerZ], PlayerData[playerid][SpoilerRX], PlayerData[playerid][SpoilerRY], PlayerData[playerid][SpoilerRZ]);
	}
	else if(PlayerData[playerid][EditingPart] == 6)
	{
 		AttachObjectToVehicle(PlayerData[playerid][SideSkirt1], PlayerData[playerid][PlayerVehicle], PlayerData[playerid][SideSkirt1X], PlayerData[playerid][SideSkirt1Y], PlayerData[playerid][SideSkirt1Z], PlayerData[playerid][SideSkirt1RX], PlayerData[playerid][SideSkirt1RY], PlayerData[playerid][SideSkirt1RZ]);
	}
	else if(PlayerData[playerid][EditingPart] == 7)
	{
		 AttachObjectToVehicle(PlayerData[playerid][SideSkirt2], PlayerData[playerid][PlayerVehicle], PlayerData[playerid][SideSkirt2X], PlayerData[playerid][SideSkirt2Y], PlayerData[playerid][SideSkirt2Z], PlayerData[playerid][SideSkirt2RX], PlayerData[playerid][SideSkirt2RY], PlayerData[playerid][SideSkirt2RZ]);
	}
	else if(PlayerData[playerid][EditingPart] == 8)
	{
 		AttachObjectToVehicle(PlayerData[playerid][Wheel], PlayerData[playerid][PlayerVehicle], PlayerData[playerid][WheelX], PlayerData[playerid][WheelY], PlayerData[playerid][WheelZ], PlayerData[playerid][WheelRX], PlayerData[playerid][WheelRY], PlayerData[playerid][WheelRZ]);
	}
    return 1;
}
CMD:tuning(playerid, params[])
{
    if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, COLOR_GREY, "You are not driving a vehicle.");
	ShowPlayerDialog(playerid, DIALOG_TUNING, DIALOG_STYLE_LIST, "What would you like to tune ?", "Front Bumper\nRear Bumper\nRoof\nHood\nSpoiler\nSide Skirt\nWheel", "Select", "Cancel");
	return 1;
}
CMD:etuning(playerid, params[])
{
	if(sscanf(params, "s[16]", params))
	{
	    SendClientMessage(playerid, COLOR_WHITE, "[Usage]: /etuning [option]");
	    SendClientMessage(playerid, COLOR_WHITE, "OPTIONS: x | y | z | done");
	}
	else if(!strcmp(params, "x", true))
	{
		PlayerData[playerid][EditStatus] = 1;
	}
	else if(!strcmp(params, "y", true))
	{
		PlayerData[playerid][EditStatus] = 2;
	}
	else if(!strcmp(params, "z", true))
	{
		PlayerData[playerid][EditStatus] = 3;
	}
	/*else if(!strcmp(params, "rx", true))
	{
		PlayerData[playerid][EditStatus] = 4;
	}
	else if(!strcmp(params, "ry", true))
	{
		PlayerData[playerid][EditStatus] = 5;
	}
	else if(!strcmp(params, "rz", true))
	{
		PlayerData[playerid][EditStatus] = 6;
	}*/
	else if(!strcmp(params, "done", true))
	{
		PlayerData[playerid][EditStatus] = 0;
		KillTimer(PlayerData[playerid][EditingTimer]);
		SaveTuning(playerid);
	}
	return 1;
}
CMD:rtuning(playerid, params[])
{
	DestroyObject(PlayerData[playerid][FrontBumper]);
	DestroyObject(PlayerData[playerid][RearBumper]);
	DestroyObject(PlayerData[playerid][Roof]);
	DestroyObject(PlayerData[playerid][Hood]);
	DestroyObject(PlayerData[playerid][Spoiler]);
	DestroyObject(PlayerData[playerid][SideSkirt1]);
	DestroyObject(PlayerData[playerid][SideSkirt2]);
	DestroyObject(PlayerData[playerid][Wheel]);
	PlayerData[playerid][FrontBumper] = 0;
	PlayerData[playerid][FrontBumperID] = 0;
	PlayerData[playerid][FrontBumperX] = 0.0;
	PlayerData[playerid][FrontBumperY] = 0.0;
	PlayerData[playerid][FrontBumperZ] = 0.0;
	PlayerData[playerid][FrontBumperRX] = 0.0;
	PlayerData[playerid][FrontBumperRY] = 0.0;
	PlayerData[playerid][FrontBumperRZ] = 0.0;
	PlayerData[playerid][RearBumper] = 0;
	PlayerData[playerid][RearBumperID] = 0;
	PlayerData[playerid][RearBumperX] = 0.0;
	PlayerData[playerid][RearBumperY] = 0.0;
	PlayerData[playerid][RearBumperZ] = 0.0;
	PlayerData[playerid][RearBumperRX] = 0.0;
	PlayerData[playerid][RearBumperRY] = 0.0;
	PlayerData[playerid][RearBumperRZ] = 0.0;
	PlayerData[playerid][Roof] = 0;
	PlayerData[playerid][RoofID] = 0;
	PlayerData[playerid][RoofX] = 0.0;
	PlayerData[playerid][RoofY] = 0.0;
	PlayerData[playerid][RoofZ] = 0.0;
	PlayerData[playerid][RoofRX] = 0.0;
	PlayerData[playerid][RoofRY] = 0.0;
	PlayerData[playerid][RoofRZ] = 0.0;
	PlayerData[playerid][Hood] = 0;
	PlayerData[playerid][HoodID] = 0;
	PlayerData[playerid][HoodX] = 0.0;
	PlayerData[playerid][HoodY] = 0.0;
	PlayerData[playerid][HoodZ] = 0.0;
	PlayerData[playerid][HoodRX] = 0.0;
	PlayerData[playerid][HoodRY] = 0.0;
	PlayerData[playerid][HoodRZ] = 0.0;
	PlayerData[playerid][Spoiler] = 0;
	PlayerData[playerid][SpoilerID] = 0;
	PlayerData[playerid][SpoilerX] = 0.0;
	PlayerData[playerid][SpoilerY] = 0.0;
	PlayerData[playerid][SpoilerZ] = 0.0;
	PlayerData[playerid][SpoilerRX] = 0.0;
	PlayerData[playerid][SpoilerRY] = 0.0;
	PlayerData[playerid][SpoilerRZ] = 0.0;
	PlayerData[playerid][SideSkirt1] = 0;
	PlayerData[playerid][SideSkirt1ID] = 0;
	PlayerData[playerid][SideSkirt1X] = 0.0;
	PlayerData[playerid][SideSkirt1Y] = 0.0;
	PlayerData[playerid][SideSkirt1Z] = 0.0;
	PlayerData[playerid][SideSkirt1RX] = 0.0;
	PlayerData[playerid][SideSkirt1RY] = 0.0;
	PlayerData[playerid][SideSkirt1RZ] = 0.0;
	PlayerData[playerid][SideSkirt2] = 0;
	PlayerData[playerid][SideSkirt2ID] = 0;
	PlayerData[playerid][SideSkirt2X] = 0.0;
	PlayerData[playerid][SideSkirt2Y] = 0.0;
	PlayerData[playerid][SideSkirt2Z] = 0.0;
	PlayerData[playerid][SideSkirt2RX] = 0.0;
	PlayerData[playerid][SideSkirt2RY] = 0.0;
	PlayerData[playerid][SideSkirt2RZ] = 0.0;
	PlayerData[playerid][Wheel] = 0;
	PlayerData[playerid][WheelID] = 0;
	PlayerData[playerid][WheelX] = 0.0;
	PlayerData[playerid][WheelY] = 0.0;
	PlayerData[playerid][WheelZ] = 0.0;
	PlayerData[playerid][WheelRX] = 0.0;
	PlayerData[playerid][WheelRY] = 0.0;
	PlayerData[playerid][WheelRZ] = 0.0;
	PlayerData[playerid][EditingPart] = 0;
	PlayerData[playerid][PlayerVehicle] = 0;
	PlayerData[playerid][AddSpeed] = 0.005;
	return 1;
}
CMD:vehicle(playerid, params[])
{
 	ShowModelSelectionMenu(playerid, Vehicles, "Vehicles");
	return 1;
}
CMD:tuningcmds(playerid, params[])
{
 	SendClientMessage(playerid,COLOR_YELLOW,"/tuning /etuning /rtuning /vehicle");
 	SendClientMessage(playerid,COLOR_YELLOW,"After using /tuning use /etuning X/Y/Z/RX/RY/RZ and then use A and D to move the object.");
	return 1;
}
