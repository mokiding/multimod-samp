#include <YSI\y_hooks>

hook OnGameModeInit()
{
	print("\n[OnGameModeInit] Initialising 'Commands/Organisation/Main'...");
	Command_AddAltNamed("faction", "f");
	Command_AddAltNamed("faction", "r");
	Command_AddAltNamed("faction", "radio");
}
    
YCMD:faction(playerid, params[], help)
{
	if(!IsPlayerLogged(playerid)) return SendClientMessage(playerid, -1, "Nisi ulogovan");
	if(PlayerInfo[playerid][pMember] == 0) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Niste clan nijede organizacije !");
	new chattext[128],string[256];
	if(sscanf(params, "s", chattext)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM:CMD] {FFFF00}/faction [text]");
	if(PlayerInfo[playerid][pMember] >= 1 && PlayerInfo[playerid][pMember] <= 4)//Leganle fakcije
	{
		format(string, sizeof(string), ""#SMCOLOR"|R| {008000}((%s %s: {FFFFFF}%s))",GetPlayerRankName(playerid), GetNick(playerid) ,chattext);
		return RadioBroadCast(PlayerInfo[playerid][pMember], COLOR_FACTION_CHAT, string);
	}
	if(PlayerInfo[playerid][pMember] >= 5 && PlayerInfo[playerid][pMember] <= 12)//Bande/Mafije
	{
		format(string, sizeof(string), ""#SMCOLOR"|F| {008000}((%s %s: {FFFFFF}%s))",GetPlayerRankName(playerid), GetNick(playerid) ,chattext);
		return FactionsBroadCast(PlayerInfo[playerid][pMember], COLOR_FACTION_CHAT, string);
	}
	if(PlayerInfo[playerid][pMember] >= 13 && PlayerInfo[playerid][pMember] <= 14)//Private ORG
	{
		format(string, sizeof(string), ""#SMCOLOR"|R| {008000}((%s %s: {FFFFFF}%s))",GetPlayerRankName(playerid), GetNick(playerid) ,chattext);
		return RadioBroadCast(PlayerInfo[playerid][pMember], COLOR_FACTION_CHAT, string);
	}
	return 1;
}