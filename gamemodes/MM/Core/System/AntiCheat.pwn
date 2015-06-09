#include <YSI\y_hooks>

hook OnGameModeInit()
{
	print("\n[OnGameModeInit] Initialising 'System/Anticheat'...");
	CheckSet(CHEAT_JETPACK);//enable jetpack cheat detection
	CheckSet(CHEAT_WEAPON);//enable weapon cheat detection
}


public AC_OnCheatDetected(playerid, type, extraint, Float:extrafloat, extraint2)
{
	switch(type)
	{
		case CHEAT_WEAPON:
		{
			ResetPlayerWeapons(playerid);
			SendClientMessage(playerid,0xFFFFFFFF,"Detected weapon cheat - Reset your weapons.");
			return 1;
		}
		case CHEAT_JETPACK:
		{
			SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
			SendClientMessage(playerid,0xFFFFFFFF,"Detected JetPack - removed it.");
			return 1;
		}
		default:
		{
			SendClientMessage(playerid,0xFFFFFFFF,"???? Unknown cheat Detected? - no action ??? :(");
			return 1;
		}
	}
	return 1;
}