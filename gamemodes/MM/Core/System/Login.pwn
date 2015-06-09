#include <YSI\y_hooks>

forward OnPlayerLoginAcc(playerid, password[]);
forward WhenPlayerLogin(playerid);

hook OnGameModeInit()
{
	print("\n[OnGameModeInit] Initialising 'System/Login'...");
}


public OnPlayerLoginAcc(playerid, password[])
{
	if(IsPlayerConnected(playerid))
	{
		new pName[30];
		new query[256];
		GetPlayerName(playerid, pName, sizeof(pName));

		mysql_format(handle, query, sizeof(query), "SELECT * FROM `players` WHERE `username`='%e' AND `password`=MD5('%e')", pName, password);
		mysql_tquery(handle, query, "WhenPlayerLogin", "i", playerid);

	}

	TogglePlayerSpectating(playerid, 0);

	return 1;
}

public WhenPlayerLogin(playerid)
{
	if(IsPlayerConnected(playerid))
	{
		new string[256];
		new pName[30];
		GetPlayerName(playerid, pName, sizeof(pName));

		cache_get_data(rows, fields, handle);

		if(rows != 0)
		{
			cache_get_field_content(0, "password", gTemp),  format(PlayerInfo[playerid][pPassword], 128, gTemp);
			cache_get_field_content(0, "Level", gTemp), PlayerInfo[playerid][pLevel] = strval(gTemp);
			cache_get_field_content(0, "AdminLevel", gTemp), PlayerInfo[playerid][pAdmin] = strval(gTemp);
			cache_get_field_content(0, "Mapper", gTemp), PlayerInfo[playerid][pMapper] = strval(gTemp);
			cache_get_field_content(0, "HelperLevel", gTemp), PlayerInfo[playerid][pHelper] = strval(gTemp);
			cache_get_field_content(0, "Cash", gTemp), PlayerInfo[playerid][pCash] = strval(gTemp);
			cache_get_field_content(0, "Account", gTemp), PlayerInfo[playerid][pAccount] = strval(gTemp);
			cache_get_field_content(0, "Email", gTemp),  format(PlayerInfo[playerid][pEmail], 256, gTemp);
			cache_get_field_content(0, "Registred", gTemp), PlayerInfo[playerid][pRegistred] = strval(gTemp);
			cache_get_field_content(0, "Tutorial", gTemp), PlayerInfo[playerid][pTutorial] = strval(gTemp);
			cache_get_field_content(0, "Sex", gTemp), PlayerInfo[playerid][pSex] = strval(gTemp);
			cache_get_field_content(0, "Age", gTemp), PlayerInfo[playerid][pAge] = strval(gTemp);
			cache_get_field_content(0, "RPname", gTemp), PlayerInfo[playerid][pRPname] = strval(gTemp);
			cache_get_field_content(0, "PhoneNumber", gTemp), PlayerInfo[playerid][pPhoneNumber] = strval(gTemp);
			cache_get_field_content(0, "PremiumAccount", gTemp), PlayerInfo[playerid][pPremiumAccount] = strval(gTemp);
			cache_get_field_content(0, "Banned", gTemp), PlayerInfo[playerid][pBanned] = strval(gTemp);
			cache_get_field_content(0, "Warns", gTemp), PlayerInfo[playerid][pWarns] = strval(gTemp);
			cache_get_field_content(0, "Leader", gTemp), PlayerInfo[playerid][pLeader] = strval(gTemp);
			cache_get_field_content(0, "Member", gTemp), PlayerInfo[playerid][pMember] = strval(gTemp);
			cache_get_field_content(0, "SpawnLoc", gTemp), PlayerInfo[playerid][pSpawnLoc] = strval(gTemp);
			cache_get_field_content(0, "Rank", gTemp), PlayerInfo[playerid][pRank] = strval(gTemp);
			cache_get_field_content(0, "Skin", gTemp), PlayerInfo[playerid][pSkin] = strval(gTemp);
			cache_get_field_content(0, "IP", gTemp), PlayerInfo[playerid][pIP] = strval(gTemp);
		}
		else
		{
			Dialog_Show(playerid, LoginDialog, DIALOG_STYLE_PASSWORD, "Login", "Netacna lozinka\nUnesite vasu lozinku ponovo !", "Login", "Izadji");
			return 1;
		}

		if(PlayerInfo[playerid][pRegistred] == 0)
		{
			PlayerInfo[playerid][pLevel] = 1;
			Update(playerid, pLevelu);

			PlayerInfo[playerid][pAdmin] = 0;
			Update(playerid, pAdminu);

			GivePlayerCash(playerid, 150);

			PlayerInfo[playerid][pAccount] = 500;
			Update(playerid, pAccountu);

			PlayerInfo[playerid][pRegistred] = 1;
			Update(playerid, pRegistredu);

			new randomphonenumber = 1000000 + random(9999999);
			PlayerInfo[playerid][pPhoneNumber] = randomphonenumber;
			Update(playerid, pPhoneNumberu);

			PlayerInfo[playerid][pInterior] = 0;
  		}

		if(PlayerInfo[playerid][pBanned] == 1)
		{
			SCM(playerid, COLOR_LIGHTRED2, "Vas nalog je banovan !");
			KickWithMessage(playerid, COLOR_LIGHTRED2, "U slucaju da mislite da je ovo greska, zatrazite unban na forumu.");
		}

		GetPlayerCash(playerid);

		SetPlayerScore(playerid, PlayerInfo[playerid][pLevel]);
  		SetPlayerCash(playerid, PlayerInfo[playerid][pCash]);

		SetSpawnInfo(playerid, 0, PlayerInfo[playerid][pSkin], 1204.6595,-1745.1508,13.5924,54.2058, 0, 0, 0, 0, 0, 0);
		SpawnPlayer(playerid);

		Update(playerid, pLastLoginu);

		new pNameIP[256];
		GetPlayerIp(playerid, pNameIP, sizeof(pNameIP));

		strmid(PlayerInfo[playerid][pIP], pNameIP, 0, 100, 255);
		Update(playerid, pIPu);


		if (PlayerInfo[playerid][pAdmin] >= 1)
		{
			format(string, sizeof(string), "Ulogovan si kao admin level %d !", PlayerInfo[playerid][pAdmin]);
			SendClientMessage(playerid, COLOR_YELLOW2, string);
		}

		if (PlayerInfo[playerid][pHelper] >= 1)
		{
			format(string, sizeof(string), "Ulogovan si kao supporter level %d !", PlayerInfo[playerid][pHelper]);
			SendClientMessage(playerid, COLOR_YELLOW2, string);
		}

		if (PlayerInfo[playerid][pPremiumAccount] >= 1)
		{
			SendClientMessage(playerid, COLOR_WHITE,"Ti si premium clan !");
		}

		if(!ValidRPName(GetNick(playerid)))
		{
			if(PlayerInfo[playerid][pRPname] != 1)
			{
				SendClientMessage(playerid, COLOR_WHITE,"Nemas pravo da koristis ime koje nije u RP formatu (Ime_Prezime) !");
				KickWithMessage(playerid, COLOR_LIGHTRED2, "Ovu opciju imaju iskljucivo premium clanovi !");
				return 1;
			}
		}

		printf("%s se ulogovao.", pName);

		gLogged[playerid] = 1;
	}

	return 1;
}