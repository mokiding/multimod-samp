#include <YSI\y_hooks>

hook OnGameModeInit()
{
	print("\n[OnGameModeInit] Initialising 'Timers/Player'...");
}

ptask MoneyTimer[1000](playerid)
{
	if(IsPlayerConnected(playerid))
	{
		if(GetPlayerCash(playerid) != GetPlayerMoney(playerid))
		{
			ResetMoneyBar(playerid);
			UpdateMoneyBar(playerid, GetPlayerCash(playerid));
			new hack = GetPlayerMoney(playerid) - GetPlayerCash(playerid);
			printf("%s has picked up/atgTempted to spawn $%d.", GetNick(playerid), hack);
		}
	}
}

ptask OtherTimer[1000](playerid)
{
	if(TutorialTime[playerid]  >= 1)
	{
		TutorialTime[playerid] += 1;
		if(TutorialTime[playerid] == 3)
		{
			SendClientMessage(playerid, COLOR_WHITE, "ovde ce biti tutorial");
		}
		else if(TutorialTime[playerid] == 5)
		{
			SendClientMessage(playerid, COLOR_WHITE, "ovde ce biti tutorial 2");

			TutorialTime[playerid] = 0; PlayerInfo[playerid][pTutorial] = 1;
			Update(playerid, pTutorialu);

			PlayerInfo[playerid][pLevel] = 1;
 			Update(playerid, pLevelu);
			PlayerInfo[playerid][pRegistred] = 1;
			Update(playerid, pRegistredu);
			PlayerInfo[playerid][pAdmin] = 0;
			Update(playerid, pAdminu);

			new randomphonenumber = 1000000 + random(9999999);
			PlayerInfo[playerid][pPhoneNumber] = randomphonenumber;
			Update(playerid, pPhoneNumberu);

			PlayerInfo[playerid][pInterior] = 0;

			SetSpawnInfo(playerid, 0, PlayerInfo[playerid][pSkin], 1204.6595,-1745.1508,13.5924,54.2058, 0, 0, 0, 0, 0, 0);
			SpawnPlayer(playerid);

			new query[128];
			mysql_format(handle, query, sizeof(query), "SELECT * FROM `players` WHERE `username`='%e'", GetNick(playerid));
			mysql_tquery(handle, query, "WhenPlayerLogin", "i", playerid);

	 	}
	}
	if(ReportTime[playerid] > 0)
	{
		ReportTime[playerid]--;
	}
}