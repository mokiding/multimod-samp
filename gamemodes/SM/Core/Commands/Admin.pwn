#include <YSI\y_hooks>

hook OnGameModeInit()
{
	print("\n[OnGameModeInit] Initialising 'Commands/Admin'...");
	Command_AddAltNamed("adminhelp", "ah");
	Command_AddAltNamed("adminchat", "a");
	Command_AddAltNamed("bano", "offban");
	Command_AddAltNamed("gotobank", "gotobanka");
}
    
YCMD:adminhelp(playerid, params[], help)
{
	if(!IsPlayerLogged(playerid)) return SendClientMessage(playerid, -1, "Nisi ulogovan");
	if(!IsPAdmin(playerid,1)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Niste admin !");
	SendClientMessage(playerid, COLOR_GREEN, "_______________________________________");
	if(IsPAdmin(playerid,1))
	{
		SendClientMessage(playerid, COLOR_WHITE, "** Admin level 1 ** (/ah)dminhelp (/a)dmin /goto /gethere /respawn /ban /kick (/checkw)eapons /check /spec (/rcon)");
	}
	if(IsPAdmin(playerid,2))
	{
		SendClientMessage(playerid, COLOR_WHITE, "** Admin level 2 ** (/bano)ffline**");
	}
	if(IsPAdmin(playerid,3))
	{
		SendClientMessage(playerid, COLOR_WHITE, "** Admin level 3 **");
	}
	if(IsPAdmin(playerid,4))
	{
		SendClientMessage(playerid, COLOR_WHITE, "** Admin level 4 **");
	}
	if(IsPAdmin(playerid,5))
	{
		SendClientMessage(playerid, COLOR_WHITE, "** Admin level 5 **");
	}
	if(IsPAdmin(playerid,7))
	{
		SendClientMessage(playerid, COLOR_WHITE, "** Admin level 7 ** /makeadmin /makehelper /makeleader /auninvite /givenonrpname");
		SendClientMessage(playerid, COLOR_WHITE, "ServerDev: /codestats /xgoto /createee /removeee /debugee");
	}
	SendClientMessage(playerid, COLOR_GREEN, "_______________________________________");
	return 1;
}

YCMD:codestats(playerid, params[], help)
{
	if(!IsPlayerLogged(playerid)) return SendClientMessage(playerid, -1, "Nisi ulogovan");
	if(!IsPAdmin(playerid,7)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Niste developer !");
	new string[128];
	SCM(playerid,-1,"{FFFF00}Statistika funkcija");
	format(string, sizeof(string), "{FFFF00}Objects:{72FFFF} %d", CountDynamicObjects());
	SendClientMessage(playerid, COLOR_LIGHTRED2, string);
	format(string, sizeof(string), "{FFFF00}EnterExit:{72FFFF} %d", CountAllEnterExits());
	SendClientMessage(playerid, COLOR_LIGHTRED2, string);
	return 1;
}

YCMD:adminchat(playerid, params[], help)
{
	if(!IsPlayerLogged(playerid)) return SendClientMessage(playerid, -1, "Nisi ulogovan");
	if(!IsPAdmin(playerid,1)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Niste admin !");
	if(isnull(params)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM:CMD] {FFFF00}/(a)dmin [text]");
	new pName[MAX_PLAYER_NAME], string[256];
	GetPlayerName(playerid, pName, sizeof(pName));
	if(PlayerInfo[playerid][pAdmin] >= 1 && PlayerInfo[playerid][pAdmin] <= 4)
	{
		format(string, sizeof(string), ""#SMCOLOR"|A| {008000}%s[%d]: {FFFFFF}%s", pName, PlayerInfo[playerid][pAdmin], params);
		AdminsBroadCast(COLOR_YELLOW2, string);
	}
	if(PlayerInfo[playerid][pAdmin] == 5)
	{
		format(string, sizeof(string), ""#SMCOLOR"|A| {008000}Head %s: {FFFFFF}%s", pName, params);
		AdminsBroadCast(COLOR_WHITE, string);
	}
	if(PlayerInfo[playerid][pAdmin] == 6)
	{
		format(string, sizeof(string), ""#SMCOLOR"|A| {008000}Direktor %s: {FFFFFF}%s", pName, params);
		AdminsBroadCast(COLOR_WHITE, string);
	}
	if(PlayerInfo[playerid][pAdmin] == 7)
	{
		format(string, sizeof(string), ""#SMCOLOR"|A|{008000}Owner %s: {FFFFFF}%s", pName, params);
		AdminsBroadCast(COLOR_WHITE, string);
	}
	return 1;
}

YCMD:ban(playerid, params[], help)
{
	if(!IsPlayerLogged(playerid)) return SendClientMessage(playerid, -1, "Nisi ulogovan");
	if(!IsPAdmin(playerid,1)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Niste admin !");
	if(!IsPAdmin(playerid,2)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Nemate dovoljan admin level !");
	new targetid, BanReason[64], pNameGive[MAX_PLAYER_NAME], string[256]; 
	if(sscanf(params, "us[64]", targetid, BanReason)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM:CMD] {FFFF00}/ban [playerid] [razlog]");
	if(targetid == INVALID_PLAYER_ID ) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Ovaj igrac je offline !");
	if(!IsPAdmin(targetid,1)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Ne mozes da banas admine !");
	GetPlayerName(targetid, pNameGive, sizeof (pNameGive));
	format(string, sizeof(string), ""#SMCOLOR"[SM:BAN]{FF0000} Admin %s je banovao %s, razlog: %s", GetNick(playerid),pNameGive, BanReason);
	SendClientMessageToAll(COLOR_LIGHTRED, string);
	PlayerInfo[targetid][pBanned] = 1;
	Update(targetid, pBannedu);
	new pGiveIP[256];
	GetPlayerIp(targetid, pGiveIP, sizeof(pGiveIP));
	strmid(PlayerInfo[targetid][pIP], pGiveIP, 0, 100, 255);
	Update(targetid, pIPu);
	new query[512];
	mysql_format(handle, query, sizeof(query) ,"INSERT INTO `BansLogs` (`ID`,`Username`,`IP`,`Admin`,`Reason`,`Type`,`Date`,`Time`) VALUES ('','%e','%e','%e','%e','%e',CURRENT_TIMESTAMP,'%d')",
							pNameGive, PlayerInfo[targetid][pIP], GetNick(playerid), BanReason, "Online", 0);
	mysql_tquery(handle, query);
	Kick(targetid);
	return 1;
}

YCMD:bano(playerid, params[], help)
{
	if(!IsPlayerLogged(playerid)) return SendClientMessage(playerid, -1, "Nisi ulogovan");
	if(!IsPAdmin(playerid,1)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Niste admin !");
	if(!IsPAdmin(playerid,4)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Nemate dovoljan admin level !");
	return 1;
}

YCMD:goto(playerid, params[], help)
{
	if(!IsPlayerLogged(playerid)) return SendClientMessage(playerid, -1, "Nisi ulogovan");
	if(!IsPAdmin(playerid,1)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Niste admin !");
	if(!IsPAdmin(playerid,1)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Nemate dovoljan admin level !");
	new targetid, pName[MAX_PLAYER_NAME], pNameGive[MAX_PLAYER_NAME], string[256];
	new Float:x,Float:y,Float:z;
	if(sscanf(params, "u", targetid)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM:CMD] {FFFF00}/goto [playerid]");
	if(targetid == INVALID_PLAYER_ID ) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Ovaj igrac je offline !");
	if(GetPlayerState(targetid) == PLAYER_STATE_SPECTATING) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Igrac do kog pokusavas da se port speca nekoga !");
	GetPlayerName(targetid, pNameGive, sizeof(pNameGive));
	GetPlayerName(playerid, pName, sizeof(pName));
	format(string, sizeof(string), ""#SMCOLOR"[SM] {FFFF00} Admin %s se portovao do vas", pName);
	SendClientMessage(targetid, COLOR_LIGHTRED2, string);
	format(string, sizeof(string), ""#SMCOLOR"[SM] {FFFF00}Portovao si se do %s", pNameGive);
	SendClientMessage(playerid, COLOR_LIGHTRED2, string);
	GetPlayerPos(targetid, Float:x, Float:y, Float:z);
	SetPlayerInterior(playerid,GetPlayerInterior(targetid));
	SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(targetid));
	if (GetPlayerState(playerid) == 2)
	{
		new gTempcar = GetPlayerVehicleID(playerid);
		SetVehiclePos(gTempcar, Float:x, Float:y+4, Float:z);
		SetVehicleVirtualWorld(gTempcar, GetPlayerVirtualWorld(targetid));
	}
	else
	{
		SetPlayerPos(playerid, Float:x, Float:y+2, Float:z);
	}
	return 1;
}

YCMD:xgoto(playerid, params[], help)
{
	if(!IsPlayerLogged(playerid)) return SendClientMessage(playerid, -1, "Nisi ulogovan");
	if(!IsPAdmin(playerid,1)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Niste admin !");
	if(!IsPAdmin(playerid,1)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Nemate dovoljan admin level !");
	new string[256], Float:x,Float:y,Float:z;
	if(sscanf(params, "fff", x,y,z)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM:CMD] {FFFF00}/xgoto [x] [y] [z]");
	format(string, sizeof(string), ""#SMCOLOR"[SM] {FFFF00}Portovao si se do %f %f %f", x,y,z);
	SendClientMessage(playerid, COLOR_LIGHTRED2, string);
	if (GetPlayerState(playerid) == 2)
	{
		new gTempcar = GetPlayerVehicleID(playerid);
		SetVehiclePos(gTempcar, Float:x, Float:y, Float:z);
	}
	else
	{
		SetPlayerPos(playerid, Float:x, Float:y, Float:z);
	}
	return 1;
}

YCMD:gotocar(playerid, params[], help)
{
	if(!IsPlayerLogged(playerid)) return SendClientMessage(playerid, -1, "Nisi ulogovan");
	if(!IsPAdmin(playerid,1)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Niste admin !");
	if(!IsPAdmin(playerid,3)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Nemate dovoljan admin level !");
	new gTempcar, string[256];
	new Float:x,Float:y,Float:z;
	if(sscanf(params, "i", gTempcar)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM:CMD] {FFFF00}/gotocar [vehicleid]");
	if(gTempcar == INVALID_VEHICLE_ID ) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Ovo vozilo nije na serveru !");
	format(string, sizeof(string), ""#SMCOLOR"[SM] {FFFF00}Portovao si se do vozila %i", gTempcar);
	SendClientMessage(playerid, COLOR_LIGHTRED2, string);
	GetVehiclePos(gTempcar, Float:x, Float:y, Float:z);
	
	if (GetPlayerState(playerid) == 2)
	{
		new gTempcar2 = GetPlayerVehicleID(playerid);
		SetVehiclePos(gTempcar2, Float:x, Float:y, Float:z);
		SetVehicleVirtualWorld(GetPlayerVehicleID(playerid), GetVehicleVirtualWorld(gTempcar));
	}
	else
	{
		SetPlayerPos(playerid, Float:x, Float:y, Float:z);
	}
	return 1;
}

YCMD:gotols(playerid, params[], help)
{
	if(!IsPlayerLogged(playerid)) return SendClientMessage(playerid, -1, "Nisi ulogovan");
	if(!IsPAdmin(playerid,1)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Niste admin !");
	if(!IsPAdmin(playerid,1)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Nemate dovoljan admin level !");
	SendClientMessage(playerid, COLOR_LIGHTRED2, ""#SMCOLOR"[SM] {FFFF00}Portovao si se do LS");
	Port(playerid, 1529.6,-1691.2,13.3);
	return 1;
}

YCMD:gotoburg(playerid, params[], help)
{
	if(!IsPlayerLogged(playerid)) return SendClientMessage(playerid, -1, "Nisi ulogovan");
	if(!IsPAdmin(playerid,1)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Niste admin !");
	if(!IsPAdmin(playerid,1)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Nemate dovoljan admin level !");
	SendClientMessage(playerid, COLOR_LIGHTRED2, ""#SMCOLOR"[SM] {FFFF00}Portovao si se do Burga");
	Port(playerid, 1208.4613,-940.8264,42.4497);
	return 1;
}

YCMD:gotobank(playerid, params[], help)
{
	if(!IsPlayerLogged(playerid)) return SendClientMessage(playerid, -1, "Nisi ulogovan");
	if(!IsPAdmin(playerid,1)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Niste admin !");
	if(!IsPAdmin(playerid,1)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Nemate dovoljan admin level !");
	SendClientMessage(playerid, COLOR_LIGHTRED2, ""#SMCOLOR"[SM] {FFFF00}Portovao si se do Banke");
	Port(playerid, 1461.4976,-1033.6091,23.6563);
	return 1;
}

YCMD:settime(playerid, params[], help)
{
	if(!IsPlayerLogged(playerid)) return SendClientMessage(playerid, -1, "Nisi ulogovan");
	if(!IsPAdmin(playerid,1)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Niste admin !");
	if(!IsPAdmin(playerid,7)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Nemate dovoljan admin level !");
	new newtime, string[256];
	if(sscanf(params, "i", newtime)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM:CMD] {FFFF00}/settime [1-00]");
	format(string, sizeof(string), ""#SMCOLOR"[SM] {FFFF00}Postavio si vreme na %i", newtime);
	SendClientMessage(playerid, -1, string);
	SetWorldTime(newtime);
	return 1;
}

YCMD:makeadmin(playerid, params[], help)
{
	if(!IsPlayerLogged(playerid)) return SendClientMessage(playerid, -1, "Nisi ulogovan");
	if(!IsPAdmin(playerid,1)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Niste admin !");
	if(!IsPAdmin(playerid,7)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Nemate dovoljan admin level !");
	new targetid, padminlevel, pName[MAX_PLAYER_NAME], pNameGive[MAX_PLAYER_NAME], string[256]; 
	if(sscanf(params, "ui", targetid, padminlevel)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM:CMD] {FFFF00}/makeadmin [playerid] [admin level]");
	if(targetid == INVALID_PLAYER_ID ) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Ovaj igrac je offline !");
	if(padminlevel < 1 || padminlevel > 7) return SendClientMessage(playerid, COLOR_ERROR, ""#SMCOLOR"[SM] {FFFF00}Ne mozes dati taj level !");
	GetPlayerName(targetid, pNameGive, sizeof(pNameGive));
	GetPlayerName(playerid, pName, sizeof(pName));
	PlayerInfo[targetid][pAdmin] = padminlevel;
	Update(targetid, pAdminu);
	format(string, sizeof(string), ""#SMCOLOR"[SM] {FFFF00}Postavljen si za admina level %i od strane %s", padminlevel,pName);
	SendClientMessage(targetid, COLOR_LIGHTRED2, string);
	format(string, sizeof(string), ""#SMCOLOR"[SM] {FFFF00}Postavio si %s za admina level %i.", pNameGive, padminlevel);
	SendClientMessage(playerid, COLOR_LIGHTRED2, string);
	return 1;
}

YCMD:makemapper(playerid, params[], help)
{
	if(!IsPlayerLogged(playerid)) return SendClientMessage(playerid, -1, "Nisi ulogovan");
	if(!IsPAdmin(playerid,1)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Niste admin !");
	if(!IsPAdmin(playerid,7)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Nemate dovoljan admin level !");
	new targetid, pName[MAX_PLAYER_NAME], pNameGive[MAX_PLAYER_NAME], string[256]; 
	if(sscanf(params, "u", targetid)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM:CMD] {FFFF00}/makemapper [playerid]");
	if(targetid == INVALID_PLAYER_ID ) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Ovaj igrac je offline !");
	GetPlayerName(targetid, pNameGive, sizeof(pNameGive));
	GetPlayerName(playerid, pName, sizeof(pName));
	PlayerInfo[targetid][pMapper] = 1;
	Update(targetid, pMapperu);
	format(string, sizeof(string), ""#SMCOLOR"[SM] {FFFF00}Postavljen si za mappera od strane %s",pName);
	SendClientMessage(targetid, COLOR_LIGHTRED2, string);
	format(string, sizeof(string), ""#SMCOLOR"[SM] {FFFF00}Postavio si %s za mappera.", pNameGive);
	SendClientMessage(playerid, COLOR_LIGHTRED2, string);
	return 1;
}

YCMD:makesup(playerid, params[], help)
{
	if(!IsPlayerLogged(playerid)) return SendClientMessage(playerid, -1, "Nisi ulogovan");
	if(!IsPAdmin(playerid,1)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Niste admin !");
	if(!IsPAdmin(playerid,5)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Nemate dovoljan admin level !");
	new targetid, helperlevel, pName[MAX_PLAYER_NAME], pNameGive[MAX_PLAYER_NAME], string[256]; 
	if(sscanf(params, "ui", targetid, helperlevel)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM:CMD] {FFFF00}/makesup [playerid] [supp level]");
	if(targetid == INVALID_PLAYER_ID ) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Ovaj igrac je offline !");
	if(helperlevel < 1 || helperlevel > 2) return SendClientMessage(playerid, COLOR_ERROR, ""#SMCOLOR"[SM] {FFFF00}Ne mozes dati taj level !");
	GetPlayerName(targetid, pNameGive, sizeof(pNameGive));
	GetPlayerName(playerid, pName, sizeof(pName));
	PlayerInfo[targetid][pHelper] = helperlevel;
	Update(targetid, pHelperu);
	format(string, sizeof(string), ""#SMCOLOR"[SM] {FFFF00}Postavljen si za supportera level %i od strane %s", helperlevel,pName);
	SendClientMessage(targetid, COLOR_LIGHTRED2, string);
	format(string, sizeof(string), ""#SMCOLOR"[SM] {FFFF00}Postavio si %s za supportera level %i.", pNameGive, helperlevel);
	SendClientMessage(playerid, COLOR_LIGHTRED2, string);
	return 1;
}

YCMD:makeleader(playerid, params[], help)
{
	if(!IsPlayerLogged(playerid)) return SendClientMessage(playerid, -1, "Nisi ulogovan");
	if(!IsPAdmin(playerid,1)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Niste admin !");
	if(!IsPAdmin(playerid,5)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Nemate dovoljan admin level !");
	new targetid, factionid, pName[MAX_PLAYER_NAME], pNameGive[MAX_PLAYER_NAME], string[256]; 
	if(sscanf(params, "ui", targetid, factionid)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM:CMD] {FFFF00}/makeleader [playerid] [orgid]");
	if(targetid == INVALID_PLAYER_ID ) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Ovaj igrac je offline !");
	if(factionid < 1 || factionid > 6) return SendClientMessage(playerid, COLOR_ERROR, ""#SMCOLOR"[SM] {FFFF00}Ne postojeca organizacija !");
	GetPlayerName(targetid, pNameGive, sizeof(pNameGive));
	GetPlayerName(playerid, pName, sizeof(pName));
	PlayerInfo[targetid][pLeader] = factionid;
	Update(targetid, pLeaderu);
	PlayerInfo[targetid][pMember] = factionid;
	Update(targetid, pMemberu);
	format(string, sizeof(string), ""#SMCOLOR"[SM] {FFFF00}Postavljen si za lidera %s od strane %s", GetFactionName(factionid),pName);
	SendClientMessage(targetid, COLOR_LIGHTRED2, string);
	format(string, sizeof(string), ""#SMCOLOR"[SM] {FFFF00}Postavio si %s za lidera %s.", pNameGive, GetFactionName(factionid));
	SendClientMessage(playerid, COLOR_LIGHTRED2, string);
	return 1;
}

YCMD:spec(playerid, params[], help)
{
	if(!IsPlayerLogged(playerid)) return SendClientMessage(playerid, -1, "Nisi ulogovan");
	if(!IsPAdmin(playerid,1)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Niste admin !");
	new targetid, pName[MAX_PLAYER_NAME], pNameGive[MAX_PLAYER_NAME], string[256]; 
	if(sscanf(params, "u", targetid)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM:CMD] {FFFF00}/spec [playerid]");
	if(targetid == INVALID_PLAYER_ID ) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Ovaj igrac je offline !");
	if(IsPlayerNPC(targetid)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Ne mozes spec NPC !");
	GetPlayerName(targetid, pNameGive, sizeof(pNameGive));
	GetPlayerName(playerid, pName, sizeof(pName));
	if(GetPlayerState(playerid) != PLAYER_STATE_SPECTATING)
	{
		PlayerInfo[playerid][pInterior] = GetPlayerInterior(playerid);
	}
	SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(targetid));
	SetPlayerInterior(playerid, GetPlayerInterior(targetid));
	TogglePlayerSpectating(playerid, 1);
	SpectatedID[playerid] = targetid;
	new Float:X, Float:Y, Float:Z;
	new Float:health;
	GetPlayerHealth(targetid, health);
	new Float:armor;
	GetPlayerArmour(targetid, armor);GetPlayerPos(playerid, X, Y, Z);
	GetPlayerName(targetid, pNameGive, sizeof(pNameGive));
	new cash =  GetPlayerMoney(targetid);
	format(string, sizeof(string), "Spec: [%d]%s [$%d] [H:%.0f] [A:%.0f]",targetid,pNameGive,cash,health,armor);
	SendClientMessage(playerid, COLOR_GREEN, string);
	if(IsPlayerInAnyVehicle(targetid))
	{
		PlayerSpectateVehicle(playerid, GetPlayerVehicleID(targetid));
		SpectateType[playerid] = ADMIN_SPEC_TYPE_VEHICLE;
	}
	else
	{
		PlayerSpectatePlayer(playerid, targetid);
		SpectateType[playerid] = ADMIN_SPEC_TYPE_PLAYER;
	}
	return 1;
}

YCMD:specoff(playerid, params[], help)
{
	if(!IsPlayerLogged(playerid)) return SendClientMessage(playerid, -1, "Nisi ulogovan");
	if(!IsPAdmin(playerid,1)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Niste admin !");
	if(GetPlayerState(playerid) != PLAYER_STATE_SPECTATING) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Nikog ne specas !");
	SetPlayerInterior(playerid, PlayerInfo[playerid][pInterior]);
	SendClientMessage(playerid, COLOR_ADMIN_INFO, "Vise ne specas.");
	TogglePlayerSpectating(playerid, 0);
	SpectatedID[playerid] = INVALID_PLAYER_ID;
	SpectateType[playerid] = ADMIN_SPEC_TYPE_NONE;
	return 1;
}

YCMD:kick(playerid, params[], help)
{
	if(!IsPlayerLogged(playerid)) return SendClientMessage(playerid, -1, "Nisi ulogovan");
	if(!IsPAdmin(playerid,1)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Niste admin !");
	new targetid, KickReason[64], pName[MAX_PLAYER_NAME], pNameGive[MAX_PLAYER_NAME], string[256]; 
	if(sscanf(params, "us[64]", targetid, KickReason)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM:CMD] {FFFF00}/kick [playerid] [razlog]");
	if(targetid == INVALID_PLAYER_ID ) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Ovaj igrac je offline !");
	if(IsPlayerNPC(targetid)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Ne mozes kick NPC !");
	GetPlayerName(targetid, pNameGive, sizeof(pNameGive));
	GetPlayerName(playerid, pName, sizeof(pName));
	format(string, sizeof(string), ""#SMCOLOR"[SM:KICK]{FF0000} Admin %s je kick %s, razlog: %s", pName,pNameGive, KickReason);
	SendClientMessageToAll(-1, string);
	new query[512];
	mysql_format(handle, query, sizeof(query) ,"INSERT INTO `KicksLogs` (`ID`,`Username`,`IP`,`Admin`,`Reason`,`Date`) VALUES ('','%e','%e','%e','%e',CURRENT_TIMESTAMP)",
							pNameGive, PlayerInfo[targetid][pIP], pName, KickReason);
	mysql_tquery(handle, query);
	Kick(targetid);
	return 1;
}

YCMD:gethere(playerid, params[], help)
{
	if(!IsPlayerLogged(playerid)) return SendClientMessage(playerid, -1, "Nisi ulogovan");
	if(!IsPAdmin(playerid,1)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Niste admin !");
	if(!IsPAdmin(playerid,1)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Nemate dovoljan admin level !");
	new targetid, pName[MAX_PLAYER_NAME], pNameGive[MAX_PLAYER_NAME], string[256];
	new Float:x,Float:y,Float:z;
	if(sscanf(params, "u", targetid)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM:CMD] {FFFF00}/gethere [playerid]");
	if(targetid == INVALID_PLAYER_ID ) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Ovaj igrac je offline !");
	if(GetPlayerState(targetid) == PLAYER_STATE_SPECTATING) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Igrac kog pokusavas da port speca nekoga !");
	GetPlayerName(targetid, pNameGive, sizeof(pNameGive));
	GetPlayerName(playerid, pName, sizeof(pName));
	format(string, sizeof(string), ""#SMCOLOR"[SM] {FFFF00} Admin %s te je portovao do njega", pName);
	SendClientMessage(targetid, COLOR_LIGHTRED2, string);
	format(string, sizeof(string), ""#SMCOLOR"[SM] {FFFF00}Provao si %s do sebe", pNameGive);
	SendClientMessage(playerid, COLOR_LIGHTRED2, string);
	GetPlayerPos(playerid, Float:x, Float:y, Float:z);
	Port(targetid, x, y, z,  GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
	return 1;
}

YCMD:check(playerid,params[],help)
{
	if(!IsPlayerLogged(playerid)) return SendClientMessage(playerid, -1, "Nisi ulogovan");
	if(!IsPAdmin(playerid,1)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Niste admin !");
	if(!IsPAdmin(playerid,1)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Nemate dovoljan admin level !");
	new targetid;
	if(sscanf(params, "u", targetid)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM:CMD] {FFFF00}/check [playerid]");
	ShowStats(playerid, targetid);
	return 1;
}

YCMD:createee(playerid, params[], help)
{
	if(!IsPlayerLogged(playerid)) return SendClientMessage(playerid, -1, "Nisi ulogovan");
	if(!IsPAdmin(playerid,1)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Niste admin !");
	if(!IsPAdmin(playerid,7)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Nemate dovoljan admin level !");
	new Float:Enterx,Float:Entery,Float:Enterz,Float:Exitx,Float:Exity,Float:Exitz,inter;
	if(sscanf(params, "fffi", Exitx,Exity,Exitz,inter)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM:CMD] {FFFF00}/createee [ExitX] [ExitY] [ExitZ] [INT]");
	new query[512];
	GetPlayerPos(playerid, Enterx, Entery, Enterz);
	mysql_format(handle, query, sizeof(query) ,"INSERT INTO `EnterExit` (`ID`,`EnterX`,`EnterY`,`EnterZ`,`ExitX`,`ExitY`,`ExitZ`,`Inter`) VALUES ('','%f','%f','%f','%f','%f','%f','%d')",
							Enterx, Entery, Enterz, Exitx, Exity,Exitz, inter);
	mysql_tquery(handle, query);
	CreateEnter(00,Enterx, Entery, Enterz, Exitx, Exity, Exitz, inter);
	CreateExit(00,Exitx, Exity, Exitz, Enterx, Entery, Enterz, inter);
	SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}EnterExit kreiran !");
	return 1;
}

YCMD:removeee(playerid, params[], help)
{
	if(!IsPlayerLogged(playerid)) return SendClientMessage(playerid, -1, "Nisi ulogovan");
	if(!IsPAdmin(playerid,1)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Niste admin !");
	if(!IsPAdmin(playerid,7)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Nemate dovoljan admin level !");
	new string[256], exitid;
	if(sscanf(params, "i", exitid)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM:CMD] {FFFF00}/removeee [eeid]");
	DeleteEnterExit(exitid);
	format(string, sizeof(string), ""#SMCOLOR"[SM] {FFFF00}%d EnterExit je obrisan.", exitid);
	SendClientMessage(playerid, COLOR_LIGHTRED2, string);
	return 1;
}

YCMD:debugee(playerid, params[], help)
{
	if(!IsPlayerLogged(playerid)) return SendClientMessage(playerid, -1, "Nisi ulogovan");
	if(!IsPAdmin(playerid,1)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Niste admin !");
	if(!IsPAdmin(playerid,7)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Nemate dovoljan admin level !");
	new intf;
	if(sscanf(params, "i", intf)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM:CMD] {FFFF00}/debugee [1 = ON] [0 = OFF]");
	if(intf == 1)
	{
		SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Sada ti je ukljucen debug za enterexit !");
		DbgEnter(playerid,1);
	}
	else if(intf == 0)
	{
		SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Sada ti je iskljucen debug za enterexit !");
		DbgEnter(playerid,0);
	}
	else
	{
		return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Samo [OFF]0 ili 1[ON] !");
	}
	return 1;
}

YCMD:reloadee(playerid, params[], help)
{
	if(!IsPlayerLogged(playerid)) return SendClientMessage(playerid, -1, "Nisi ulogovan");
	if(!IsPAdmin(playerid,1)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Niste admin !");
	if(!IsPAdmin(playerid,7)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Nemate dovoljan admin level !");
	ReloadEnterExtis();
	SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Svi EnterExit su ponovno ucitani iz mysql !");
	return 1;
}

YCMD:gotoobject(playerid, params[], help)
{
	if(!IsPlayerLogged(playerid)) return SendClientMessage(playerid, -1, "Nisi ulogovan");
	if(!IsPAdmin(playerid,1)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Niste admin !");
	if(!IsPAdmin(playerid,7)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Nemate dovoljan admin level !");
	new objectid;
	if(sscanf(params, "i", objectid)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM:CMD] {FFFF00}/gotoobject [objectid]");
	if(IsValidDynamicObject(objectid))
	{
		new Float:tempX,Float:tempY,Float:tempZ,string[128];
		Port(playerid, tempX, tempY, tempZ, GetDynamicObjectVW(objectid), GetDynamicObjectInt(objectid));
		format(string, sizeof(string), "{FFFF00}Port si se do objekta:{72FFFF} %d", objectid);
		SendClientMessage(playerid, COLOR_LIGHTRED2, string);
		format(string, sizeof(string), "{72FFFF}(X: %f Y: %f Z: %f) VW: %d INT: %d", tempX,tempY,tempZ,GetDynamicObjectVW(objectid), GetDynamicObjectInt(objectid));
		SendClientMessage(playerid, COLOR_LIGHTRED2, string);

	}
	else
	{
		SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Objekat koji ste izabrali nije validan !");
	}
	return 1;
}

YCMD:givenonrpname(playerid, params[], help)
{
	if(!IsPlayerLogged(playerid)) return SendClientMessage(playerid, -1, "Nisi ulogovan");
	if(!IsPAdmin(playerid,1)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Niste admin !");
	if(!IsPAdmin(playerid,7)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Nemate dovoljan admin level !");
	new targetid, pName[MAX_PLAYER_NAME], pNameGive[MAX_PLAYER_NAME], string[256],option;
	if(sscanf(params, "ui", targetid,option)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM:CMD] {FFFF00}/givenonrpname [playerid] [1-0]");
	if(targetid == INVALID_PLAYER_ID ) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Ovaj igrac je offline !");
	if(option == 1)
	{
		format(string, sizeof(string), ""#SMCOLOR"[SM] {FFFF00} Admin %s vam je dodelio premium opciju NONRP imena !", pName);
		SendClientMessage(targetid, COLOR_LIGHTRED2, string);
		format(string, sizeof(string), ""#SMCOLOR"[SM] {FFFF00}Dodelili ste %s premium opciju nonrp imena !", pNameGive);
		SendClientMessage(playerid, COLOR_LIGHTRED2, string);
		PlayerInfo[targetid][pRPname] = 1;
		Update(targetid,pRPnameu);
	}
	else
	{
		format(string, sizeof(string), ""#SMCOLOR"[SM] {FFFF00} Admin %s vam je skinuo premium opciju NONRP imena !", pName);
		SendClientMessage(targetid, COLOR_LIGHTRED2, string);
		format(string, sizeof(string), ""#SMCOLOR"[SM] {FFFF00}Skinuli ste %s premium opciju nonrp imena !", pNameGive);
		SendClientMessage(playerid, COLOR_LIGHTRED2, string);
		PlayerInfo[targetid][pRPname] = 0;
		Update(targetid,pRPnameu);
	}
	return 1;
}

