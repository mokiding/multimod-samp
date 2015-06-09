#include <YSI\y_hooks>

hook OnGameModeInit()
{
	print("\n[OnGameModeInit] Initialising 'System/Fade'...");
}

new PlayerText:gFader;
new gFadeLevel[MAX_PLAYERS];
new gFadeTimer[MAX_PLAYERS];
new gFadeType[MAX_PLAYERS];

FadePlayerScreen(playerid)
{
	gFadeLevel[playerid] = 0;
	gFadeType[playerid] = 1;
	gFadeTimer[playerid] = SetTimerEx("OnPlayerFadeUpdate", 2, true, "i", playerid);
	return true;
}

hook OnPlayerConnect(playerid)
{
	gFadeLevel[playerid] = -1;
	gFadeTimer[playerid] = -1;
	gFadeType[playerid] = -1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	gFadeLevel[playerid] = -1;
	gFadeTimer[playerid] = -1;
	gFadeType[playerid] = -1;
}

forward OnPlayerFadeFinish(playerid);
public OnPlayerFadeFinish(playerid)
{
	return 1;
}

forward OnPlayerFadeMiddle(playerid);
public OnPlayerFadeMiddle(playerid)
{
	return 1;
}

forward OnPlayerFadeUpdate(playerid);
public OnPlayerFadeUpdate(playerid)
{
	if(gFadeType[playerid] == 1)
	{
		gFadeLevel[playerid] += 2;

		PlayerTextDrawDestroy(playerid, gFader);
		gFader = CreatePlayerTextDraw(playerid,0.000000, 1.000000, "blankscreen");
		PlayerTextDrawBackgroundColor(playerid,gFader, 255);
		PlayerTextDrawLetterSize(playerid,gFader, 0.000000, 51.099998);
		PlayerTextDrawColor(playerid,gFader, -1);
		PlayerTextDrawUseBox(playerid,gFader, 1);
		PlayerTextDrawBoxColor(playerid,gFader, gFadeLevel[playerid]);
		PlayerTextDrawTextSize(playerid,gFader, 640.000000, 0.000000);
		PlayerTextDrawShow(playerid,gFader);

		if(gFadeLevel[playerid] > 255)
		{
			gFadeType[playerid] = 2;
			gFadeLevel[playerid] = 255;
		}
	}
	else if(gFadeType[playerid] == 2)
	{
		CallLocalFunction("OnPlayerFadeMiddle", "i", playerid);
		gFadeType[playerid] = 0;
	}
	else if(gFadeType[playerid] == 0)
	{
		
		gFadeLevel[playerid] -= 2;
		PlayerTextDrawDestroy(playerid, gFader);
		gFader = CreatePlayerTextDraw(playerid,0.000000, 1.000000, "blankscreen");
		PlayerTextDrawBackgroundColor(playerid,gFader, 255);
		PlayerTextDrawLetterSize(playerid,gFader, 0.000000, 51.099998);
		PlayerTextDrawColor(playerid,gFader, -1);
		PlayerTextDrawUseBox(playerid,gFader, 1);
		PlayerTextDrawBoxColor(playerid,gFader, gFadeLevel[playerid]);
		PlayerTextDrawTextSize(playerid,gFader, 640.000000, 0.000000);
		PlayerTextDrawShow(playerid,gFader);

		if(gFadeLevel[playerid] < 0)
		{
			PlayerTextDrawDestroy(playerid, gFader);
			gFadeLevel[playerid] = -1;
			gFadeType[playerid] = -1;
			KillTimer(gFadeTimer[playerid]);
			CallLocalFunction("OnPlayerFadeFinish", "i", playerid);
		}
	}
	return 1;
}