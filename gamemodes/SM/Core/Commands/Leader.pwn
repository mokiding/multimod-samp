#include <YSI\y_hooks>

hook OnGameModeInit()
{
	print("\n[OnGameModeInit] Initialising 'Commands/Leader'...");
	Command_AddAltNamed("uninvite", "auninvite");
}

YCMD:uninvite(playerid, params[], help)
{
	if(PlayerInfo[playerid][pLeader] == 0 || PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Niste lider !");
	new targetid;
	if(sscanf(params, "u", targetid)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM:CMD] {FFFF00}/uninvite [playerid]");
	if(targetid == INVALID_PLAYER_ID ) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Ovaj igrac je offline !");
	if(PlayerInfo[playerid][pLeader] != PlayerInfo[targetid][pMember]) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Ovaj igrac nije u tvojoj organizaciji !");
	new string[256];
	format(string, sizeof(string), ""#SMCOLOR"[SM] {FFFF00} Izbacili ste %s iz organizacije %s ",  GetNick(targetid), GetFactionName(PlayerInfo[targetid][pMember]));
	SendClientMessage(playerid, -1, string);
	if(PlayerInfo[playerid][pLeader] >= 1)
	{
		format(string, sizeof(string), ""#SMCOLOR"[SM] {FFFF00} Lider %s vas je izbacio iz organizacije %s ",  GetNick(playerid), GetFactionName(PlayerInfo[targetid][pMember]));
		SendClientMessage(targetid, -1,string);
	}
	else if(PlayerInfo[playerid][pAdmin] >= 1)
	{
		format(string, sizeof(string), ""#SMCOLOR"[SM] {FFFF00} Admin %s vas je izbacio iz organizacije %s ", GetNick(playerid), GetFactionName(PlayerInfo[targetid][pMember]));
		SendClientMessage(targetid, -1,string);
	}
	PlayerInfo[targetid][pMember] = 0;
	Update(targetid, pMemberu);
	PlayerInfo[targetid][pRank] = 0;
	Update(targetid, pRanku);
	return 1;
}