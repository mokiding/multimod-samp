#include <YSI\y_hooks>

#define pLevelu				1
#define pAdminu				2
#define pHelperu			3
#define pCashu				4
#define pAccountu			5
#define pEmailu				6
#define pRegistredu			7
#define pTutorialu			8
#define pSexu				9
#define	pAgeu				10
#define pPhoneNumberu		11
#define pPremiumAccountu	12
#define pBannedu			13
#define pWarnsu				14
#define pLeaderu			15
#define pMemberu			16
#define pRanku				17
#define pSkinu				18
#define pIPu				49
#define pLastLoginu			50
#define pSpawnLocu 	51
#define pMapperu 52
#define pRPnameu 53

hook OnGameModeInit()
{
	print("\n[OnGameModeInit] Initialising 'Mysql/LoadAccount'...");
}

hook OnPlayerConnect(playerid)
{
	new pName[30];
	new query[256];
	GetPlayerName(playerid, pName, sizeof(pName));
  	mysql_format(handle, query, sizeof(query), "SELECT * FROM `players` WHERE `username` = '%e'", pName);
	mysql_tquery(handle, query, "WhenAccountCheck", "i", playerid);

	TogglePlayerSpectating(playerid, 0);

	SetPlayerColor(playerid, COLOR_GRAD);
}

public Update(playerid, type)
{
	if(IsPlayerConnected(playerid))
	{
		new string[256];
		new playerName[MAX_PLAYER_NAME];
		GetPlayerName(playerid, playerName, sizeof(playerName));
		{
			switch(type)
			{
				case pLevelu:
				{
					mysql_format(handle, string, sizeof(string), "UPDATE `players` SET `Level`='%d' WHERE `username`='%e'", PlayerInfo[playerid][pLevel], playerName);
					mysql_query(handle, string);
				}
				case pAdminu:
				{
					mysql_format(handle, string, sizeof(string), "UPDATE `players` SET `AdminLevel`='%d' WHERE `username`='%e'", PlayerInfo[playerid][pAdmin], playerName);
					mysql_query(handle, string);
				}
				case pHelperu:
				{
					mysql_format(handle, string, sizeof(string), "UPDATE `players` SET `HelperLevel`='%d' WHERE `username`='%e'", PlayerInfo[playerid][pHelper], playerName);
					mysql_query(handle, string);
				}
				case pCashu:
				{
					mysql_format(handle, string, sizeof(string), "UPDATE `players` SET `Cash`='%d' WHERE `username`='%e'", PlayerInfo[playerid][pCash], playerName);
					mysql_query(handle, string);
				}
				case pAccountu:
				{
					mysql_format(handle, string, sizeof(string), "UPDATE `players` SET `Account`='%d' WHERE `username`='%e'", PlayerInfo[playerid][pAccount], playerName);
					mysql_query(handle, string);
				}
				case pEmailu:
				{
					mysql_format(handle, string, sizeof(string), "UPDATE `players` SET `Email`='%e' WHERE `username`='%e'", PlayerInfo[playerid][pEmail], playerName);
					mysql_query(handle, string);
				}
				case pRegistredu:
				{
					mysql_format(handle, string, sizeof(string), "UPDATE `players` SET `Registred`='%d' WHERE `username`='%e'", PlayerInfo[playerid][pRegistred], playerName);
					mysql_query(handle, string);
				}
				case pTutorialu:
				{
					mysql_format(handle, string, sizeof(string), "UPDATE `players` SET `Tutorial`='%d' WHERE `username`='%e'", PlayerInfo[playerid][pTutorial], playerName);
					mysql_query(handle, string);
				}
				case pSexu:
				{
					mysql_format(handle, string, sizeof(string), "UPDATE `players` SET `Sex`='%d' WHERE `username`='%e'", PlayerInfo[playerid][pSex], playerName);
					mysql_query(handle, string);
				}
				case pAgeu:
				{
					mysql_format(handle, string, sizeof(string), "UPDATE `players` SET `Age`='%d' WHERE `username`='%e'", PlayerInfo[playerid][pAge], playerName);
					mysql_query(handle, string);
				}
				case pPhoneNumberu:
				{
					mysql_format(handle, string, sizeof(string), "UPDATE `players` SET `PhoneNumber`='%d' WHERE `username`='%e'", PlayerInfo[playerid][pPhoneNumber], playerName);
					mysql_query(handle, string);
				}
				case pPremiumAccountu:
				{
					mysql_format(handle, string, sizeof(string), "UPDATE `players` SET `PremiumAccount`='%d' WHERE `username`='%e'", PlayerInfo[playerid][pPremiumAccount], playerName);
					mysql_query(handle, string);
				}
				case pBannedu:
				{
					mysql_format(handle, string, sizeof(string), "UPDATE `players` SET `Banned`='%d' WHERE `username`='%e'", PlayerInfo[playerid][pBanned], playerName);
					mysql_query(handle, string);
				}
				case pWarnsu:
				{
					mysql_format(handle, string, sizeof(string), "UPDATE `players` SET `Warns`='%d' WHERE `username`='%e'", PlayerInfo[playerid][pWarns], playerName);
					mysql_query(handle, string);
				}
				case pLeaderu:
				{
					mysql_format(handle, string, sizeof(string), "UPDATE `players` SET `Leader`='%d' WHERE `username`='%e'", PlayerInfo[playerid][pLeader], playerName);
					mysql_query(handle, string);
				}
				case pMemberu:
				{
					mysql_format(handle, string, sizeof(string), "UPDATE `players` SET `Member`='%d' WHERE `username`='%e'", PlayerInfo[playerid][pMember], playerName);
					mysql_query(handle, string);
				}
				case pRanku:
				{
					mysql_format(handle, string, sizeof(string), "UPDATE `players` SET `Rank`='%d' WHERE `username`='%e'", PlayerInfo[playerid][pRank], playerName);
					mysql_query(handle, string);
				}
				case pSkinu:
				{
					mysql_format(handle, string, sizeof(string), "UPDATE `players` SET `Skin`='%d' WHERE `username`='%e'", PlayerInfo[playerid][pSkin], playerName);
					mysql_query(handle, string);
				}
				case pSpawnLocu:
				{
					mysql_format(handle, string, sizeof(string), "UPDATE `players` SET `SpawnLoc`='%d' WHERE `username`='%e'", PlayerInfo[playerid][pSpawnLoc], playerName);
					mysql_query(handle, string);
				}
				case pIPu:
				{
					mysql_format(handle, string, sizeof(string), "UPDATE `players` SET `IP`='%e' WHERE `username`='%e'", PlayerInfo[playerid][pIP], playerName);
					mysql_query(handle, string);
				}
				case pLastLoginu:
				{
					mysql_format(handle, string, sizeof(string), "UPDATE `players` SET `LastLogin`= CURRENT_TIMESTAMP WHERE `username`='%e'", playerName);
					mysql_query(handle, string);
				}
				case pMapperu:
				{
					mysql_format(handle, string, sizeof(string), "UPDATE `players` SET `Mapper`= '%d' WHERE `username`='%e'",PlayerInfo[playerid][pMapper], playerName);
					mysql_query(handle, string);
				}
				case pRPnameu:
				{
					mysql_format(handle, string, sizeof(string), "UPDATE `players` SET `pRPname`= '%d' WHERE `username`='%e'",PlayerInfo[playerid][pRPname], playerName);
					mysql_query(handle, string);
				}
			}
		}
	}
}

public WhenAccountCheck(playerid, password[])
{
	new pName[30];
	GetPlayerName(playerid, pName, sizeof(pName));

	cache_get_data(rows, fields, handle);

	if(rows)
	{
		gRegistred[playerid] = 1;
	}
	else
  	{
		gRegistred[playerid] = 0;
	}

	// Login or Register!

	if(gLogged[playerid] == 0)
	{
		if(gRegistred[playerid] == 1)
		{
			if(rows)
			{
				new string[256];
				GetPlayerName(playerid, pName, sizeof(pName));

				cache_get_field_content(0, "LastLogin", gTemp), strmid(PlayerInfo[playerid][pLastLogin], gTemp, 0, 255, 255);

			 	format(string,sizeof(string),"{BECBFC}Dobrodosao, {95A3FF}%s{BECBFC}!\n\nMolimo vas unesite vasu lozinku.\n\n* {FFFFFF}Poslednja prijava: %s *",pName, PlayerInfo[playerid][pLastLogin]);
				Dialog_Show(playerid, LoginDialog,DIALOG_STYLE_PASSWORD,"Login",string,"Login","Exit");
   			}
	 	}
	 	else
	 	{
	 		Dialog_Show(playerid, RegisterPassword, DIALOG_STYLE_PASSWORD,	"Registracija", "Unesite vasu lozinku:",	 "Registracija", "Izadji");
   		}
	}

	SetPlayerCameraPos(playerid, 1500.7156,-1778.1880,80.3080);
	SetPlayerCameraLookAt(playerid, 1500.7156,-1778.1880,80.3080);
	SetPlayerPos(playerid, 1437.6957,-2266.6355,13.5469);

	return 1;
}
