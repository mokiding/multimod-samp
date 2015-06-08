#include <YSI\y_hooks>

hook OnGameModeInit()
{
	print("\n[OnGameModeInit] Initialising 'Utility/Check'...");
}

IsPAdmin(playerid,level)
{
	if(PlayerInfo[playerid][pAdmin] >= level)
	{
		return true;
	}
	else
	{
		return false;
	}
}

IsPMember(playerid,factionid)
{
	if(PlayerInfo[playerid][pMember] == factionid | PlayerInfo[playerid][pLeader] == factionid)
	{
		return true;
	}
	else
	{
		return false;
	}
}

IsPRank(rankid)
{
	if(PlayerInfo[playerid][pRank] >= rankid)
	{
		return true;
	}
	else
	{
		return false;
	}
}

IsPlayerLogged(playerid)
{
	if(IsPlayerConnected(playerid))
	{
		if(gLogged[playerid] == 1)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	return false;
}