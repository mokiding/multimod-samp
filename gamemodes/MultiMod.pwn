/*==============================================================================

	SA-MP MultiMod

		Big thanks to WopsS for the initial concept and developing!
		Also thanks to Nestor for the idea long ago with some very productive discussions!
		Big thanks to Brko for great mapping and helping me find a creativty!

==============================================================================*/

#include <a_samp>

/*==============================================================================

	Library Predefinitions

==============================================================================*/

#undef MAX_PLAYERS
#define MAX_PLAYERS	(1000)

/*==============================================================================
	Guaranteed first call
	OnGameModeInit_Setup is called before ANYTHING else, the purpose of this is
	to prepare various internal and external systems that may need to be ready
	for other modules to use their functionality. This function isn't hooked.
	OnScriptInit (from YSI) is then called through modules which is used to
	prepare dependencies such as databases, folders and register debuggers.
	OnGameModeInit is then finally called throughout modules and starts inside
	the "Server/Init.pwn" module (very important) so itemtypes and other object
	types can be defined. This callback is used throughout other scripts as a
	means for declaring entities with relevant data.
==============================================================================*/

public OnGameModeInit()
{
	print("\n[OnGameModeInit] Initialising 'Main'...");

	OnGameModeInit_Setup();

	#if defined main_OnGameModeInit
		return main_OnGameModeInit();
	#else
		return 1;
	#endif
}
#if defined _ALS_OnGameModeInit
	#undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif

#define OnGameModeInit main_OnGameModeInit
#if defined main_OnGameModeInit
	forward main_OnGameModeInit();
#endif

/*==============================================================================

	Libraries and respective links to their release pages

==============================================================================*/
#include <a_mysql>															// By BlueG, R39-3:					https://github.com/pBlueG/SA-MP-MySQL
#include <sscanf2>																// By Y_Less, 2.8.2:					http://forum.sa-mp.com/showthread.php?t=570927
#include <crashdetect>														// By Zeex	, f4d84e2b1c:			http://forum.sa-mp.com/showthread.php?t=262796
#include <YSI\y_timers>													// By Y_Less, 87cfb77:			http://forum.sa-mp.com/showthread.php?t=570884
#include <YSI\y_commands>											// By Y_Less, 87cfb77:			http://forum.sa-mp.com/showthread.php?t=570884
#include <YSI\y_master>													// By Y_Less, 87cfb77:			http://forum.sa-mp.com/showthread.php?t=570884
#include <strlib>																	// By Slice, 48c183f:					https://github.com/oscar-broman/strlib
#include <streamer>															// By Incognito, 2.7.7:				http://forum.sa-mp.com/showthread.php?t=102865
#include <easyDialog>														// By Emmet,04/04/2015:  	http://forum.sa-mp.com/showthread.php?t=475838
#include <libRegEx>															// By FF-Koala,c7da3fb:			http://forum.sa-mp.com/showthread.php?t=526725
//#include <EVF>																	// By Emmet_	:							http://forum.sa-mp.com/showthread.php?t=486060
//#include <modelsizes>													// By Y_Less:								http://forum.sa-mp.com/showthread.php?t=570965
/*==============================================================================

	Definitions

==============================================================================*/

#define SCM SendClientMessage

// MySQL
forward WhenAccountCheck(playerid, password[]);

new gTemp[256];

// Login
new gRegistred[MAX_PLAYERS];
new gLogged[MAX_PLAYERS];
new RegistrationStep[MAX_PLAYERS];

forward Update(playerid, type);

// Money
#define ResetMoneyBar ResetPlayerMoney
#define UpdateMoneyBar GivePlayerMoney

enum pInfo
{
	pPassword[128], pLevel, pAdmin, pHelper, pCash, pAccount, pEmail, pRegistred, pTutorial, pSex, pAge, pPhoneNumber, pPremiumAccount, pBanned, pWarns, 
	pLeader, pMember, pRank, pSkin, pSpawnLoc,pRPname,pInterior, pIP,pMapper, pLastLogin[100]
};

new PlayerInfo[MAX_PLAYERS][pInfo];
new Cash[MAX_PLAYERS];


// Tutorial
new TutorialTime[MAX_PLAYERS];

// Admin & Helpers & Reports
#define ADMIN_SPEC_TYPE_NONE 0
#define ADMIN_SPEC_TYPE_PLAYER 1
#define ADMIN_SPEC_TYPE_VEHICLE 2

new ReportTime[MAX_PLAYERS];
new SpectateType[MAX_PLAYERS];
new SpectatedID[MAX_PLAYERS];

forward AdminsBroadCast(color, string[]);
forward HelpersBroadCast(color, string[]);

// Faction
forward SetPlayerFactionColor(playerid);
forward FactionsBroadCast(faction, color, string[]);
forward RadioBroadCast(faction, color, string[]);

forward ShowStats(playerid, targetid);
forward KickPublic(playerid);
forward ProxDetector(Float:radi, playerid, string[],col1,col2,col3,col4,col5);


/*==============================================================================

	Global values

==============================================================================*/




/*==============================================================================

	Core Scripts

==============================================================================*/
//Main Scripts
#include "MM/Core/Config.pwn"
#include "MM/Utility/Colors.pwn"

//Utility Scripts
#include "MM/Utility/Scripts.pwn"
#include "MM/Utility/Check.pwn"
#include "MM/Utility/Regex.pwn"
#include "MM/Utility/Format.pwn"


//MySQL
#include "MM/Core/Mysql/Connect.pwn"
#include "MM/Core/Mysql/LoadAccount.pwn"

//UI
#include "MM/Core/UI/GlobalUI.pwn"
#include "MM/Core/UI/Logo.pwn"

//Dialogs
#include "MM/Core/Dialogs/Main.pwn"
#include "MM/Core/Dialogs/Register.pwn"
#include "MM/Core/Dialogs/Login.pwn"


//Timers
#include "MM/Core/Timers/Global.pwn"
#include "MM/Core/Timers/Player.pwn"

//Systems
#include "MM/Core/System/Fade.pwn"
#include "MM/Core/System/Login.pwn"
#include "MM/Core/System/Register.pwn"
#include "MM/Core/System/Objects.pwn"
//#include "SM/Core/System/AntiCheat.pwn" --need to finish (done around 0%)

#if defined GMDEBUG
#include "MM/Core/Commands/Test.pwn"	
#endif
/*==============================================================================

	RP Scripts

==============================================================================*/

#include "MM/Modes/RP/Core/CharCreator.pwn"
#include "MM/Modes/RP/Core/Spawn.pwn"
#include "MM/Modes/RP/Core/EnterExit.pwn"
#include "MM/Modes/RP/Core/COS.pwn"
#include "MM/Modes/RP/Core/Tune.pwn"
#include "MM/Modes/RP/Core/House.pwn"
#include "MM/Modes/RP/Core/Organisation.pwn"

//Dialogs
#include "MM/Modes/RP/Dialogs/House.pwn"
#include "MM/Modes/RP/Dialogs/Mapping.pwn"
#include "MM/Modes/RP/Dialogs/Commands.pwn"

//Commands
#include "MM/Core/Commands/Organisation/Main.pwn"
#include "MM/Core/Commands/Player.pwn"
#include "MM/Core/Commands/Admin.pwn"
#include "MM/Core/Commands/Main.pwn"
#include "MM/Core/Commands/House.pwn"

/*==============================================================================

	DM Scripts

==============================================================================*/



//-------------------------------


main()
{
	print("\n\n/*==============================================================================\n\n");
	print("	SA-MP MultiMod by m0k1 | DEV VERSION");
	print("\n\n==============================================================================*/\n\n");
}

OnGameModeInit_Setup()
{
	print("\n[OnGameModeInit_Setup] Setting up...");
	Streamer_ToggleErrorCallback(true);
	SetWorldTime(1);
}

public OnGameModeInit()
{
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerConnect(playerid)
{
	gRegistred[playerid] = 0; 
	gLogged[playerid] = 0;
	RegistrationStep[playerid] = 0;
	TutorialTime[playerid] = 0;
	ReportTime[playerid] = 0; 
	SpectatedID[playerid] = 0;
	PlayerInfo[playerid][pRegistred] = 0;
	PlayerInfo[playerid][pRPname] = 0;
	PlayerInfo[playerid][pTutorial] = 0;
	PlayerInfo[playerid][pSex] = 0;
	return 1;
}

public OnPlayerText(playerid, text[])
{
	new string[256];
	format(string, sizeof(string), "%s kaze: %s", GetNick(playerid), text);
	ProxDetector(20.0, playerid, string, COLOR_FADE1, COLOR_FADE2, COLOR_FADE3, COLOR_FADE4, COLOR_FADE5);
	return 0;
}


public KickPublic(playerid)
{
	Kick(playerid);
}

public ProxDetector(Float:radi, playerid, string[], col1, col2, col3, col4, col5)
{
	if(IsPlayerConnected(playerid))
	{
		new Float:posx, Float:posy, Float:posz;
		new Float:oldposx, Float:oldposy, Float:oldposz;
		new Float:gTempposx, Float:gTempposy, Float:gTempposz;
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		for(new i = 0; i < MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i))
			{
				if(GetPlayerVirtualWorld(i) == GetPlayerVirtualWorld(playerid))
				{
						GetPlayerPos(i, posx, posy, posz);
						gTempposx = (oldposx -posx);
						gTempposy = (oldposy -posy);
						gTempposz = (oldposz -posz);
						if (((gTempposx < radi/16) && (gTempposx > -radi/16)) && ((gTempposy < radi/16) && (gTempposy > -radi/16)) && ((gTempposz < radi/16) && (gTempposz > -radi/16)))
						{
							SendClientMessage(i, col1, string);
						}
						else if (((gTempposx < radi/8) && (gTempposx > -radi/8)) && ((gTempposy < radi/8) && (gTempposy > -radi/8)) && ((gTempposz < radi/8) && (gTempposz > -radi/8)))
						{
							SendClientMessage(i, col2, string);
						}
						else if (((gTempposx < radi/4) && (gTempposx > -radi/4)) && ((gTempposy < radi/4) && (gTempposy > -radi/4)) && ((gTempposz < radi/4) && (gTempposz > -radi/4)))
						{
							SendClientMessage(i, col3, string);
						}
						else if (((gTempposx < radi/2) && (gTempposx > -radi/2)) && ((gTempposy < radi/2) && (gTempposy > -radi/2)) && ((gTempposz < radi/2) && (gTempposz > -radi/2)))
						{
							SendClientMessage(i, col4, string);
						}
						else if (((gTempposx < radi) && (gTempposx > -radi)) && ((gTempposy < radi) && (gTempposy > -radi)) && ((gTempposz < radi) && (gTempposz > -radi)))
						{
							SendClientMessage(i, col5, string);
						}
				}
				else
				{
					SendClientMessage(i, col1, string);
				}
			}
		}
	}
	return 0;
}

public AdminsBroadCast(color, string[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(PlayerInfo[i][pAdmin] >= 1)
			{
				SendClientMessage(i, color, string);
			}
		}
	}
	return 1;
}

public HelpersBroadCast(color, string[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(PlayerInfo[i][pHelper] >= 1)
			{
				SendClientMessage(i, color, string);
			}
		}
	}
	return 1;
}

public FactionsBroadCast(faction, color, string[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(PlayerInfo[i][pMember] == faction || PlayerInfo[i][pLeader] == faction)
			{
				SendClientMessage(i, color, string);
			}
		}
	}
	return 1;
}

public RadioBroadCast(faction, color, string[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(PlayerInfo[i][pMember] == faction || PlayerInfo[i][pLeader] == faction)
			{
				SendClientMessage(i, color, string);
			}
		}
	}
	return 1;
}

KickWithMessage(playerid, color, message[])
{
	SendClientMessage(playerid, color, message);
	SetTimerEx("KickPublic", 1000, 0, "d", playerid);
}

GivePlayerCash(playerid, money)
{
	Cash[playerid] += money;
	ResetMoneyBar(playerid);
	UpdateMoneyBar(playerid, Cash[playerid]);
	PlayerInfo[playerid][pCash] = Cash[playerid];
	Update(playerid, pCashu);

	return Cash[playerid];
}

SetPlayerCash(playerid, money)
{
	Cash[playerid] = money;
	ResetMoneyBar(playerid);
	UpdateMoneyBar(playerid, Cash[playerid]);
	PlayerInfo[playerid][pCash] = Cash[playerid];
	Update(playerid, pCashu);
	return Cash[playerid];
}

ResetPlayerCash(playerid)
{
	Cash[playerid] = 0;
	ResetMoneyBar(playerid);
	UpdateMoneyBar(playerid, Cash[playerid]);
	PlayerInfo[playerid][pCash] = Cash[playerid];
	Update(playerid, pCashx);

	return Cash[playerid];
}

GetPlayerCash(playerid)
{
	return Cash[playerid];
}

public ShowStats(playerid, targetid)
{
	if(IsPlayerConnected(targetid))
	{
		new string[256];
		new level = PlayerInfo[targetid][pLevel];
		new sex[8];
		if(PlayerInfo[targetid][pSex] == 1)
		{
			sex = "Musko";
		}
		else if(PlayerInfo[targetid][pSex] == 2)
		{
			sex = "Zensko";
		}
		new age = PlayerInfo[targetid][pAge];
		new cash = GetPlayerCash(targetid);
		new account = PlayerInfo[targetid][pAccount];
		new phonenumber = PlayerInfo[targetid][pPhoneNumber];
		new premiumaccount[4];
		if(PlayerInfo[targetid][pPremiumAccount] == 1)
		{
			premiumaccount = "Da";
			}
			else
			{
				premiumaccount = "Ne";
		}
		SendClientMessage(playerid, COLOR_SERVER_GREEN,"_______________________________________");
		format(string, sizeof(string), "%s stats", GetNick(targetid));
		SendClientMessage(playerid, COLOR_WHITE, string);
		format(string, sizeof(string), "Level:[%d] Pol:[%s] Godine:[%d] Novac:[$%s] Banka:[$%s] Telefon:[%s]", level, sex, age, FormatNumber(cash), FormatNumber(account), PhoneFormat(phonenumber));
		SendClientMessage(playerid, COLOR_WHITE,string);
		format(string, sizeof(string), "VIP:[%s]", premiumaccount);
		SendClientMessage(playerid, COLOR_WHITE,string);
		format(string, sizeof(string), "Organizacija:[%s] Rank:[%s]", GetFactionName(PlayerInfo[targetid][pMember]), GetRankName(PlayerInfo[targetid][pMember],PlayerInfo[targetid][pRank]));
		SendClientMessage(playerid, COLOR_WHITE,string);
		SendClientMessage(playerid, COLOR_SERVER_GREEN,"_______________________________________");

	}
	return 1;
}