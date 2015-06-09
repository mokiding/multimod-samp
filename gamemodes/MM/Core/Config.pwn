#include <YSI\y_hooks>

#define GMDEBUG true
#define gamemode_text "[SM:DEV by m0k1]"
#define gamemode_map "San Marino"

#define mysql_host "n1.tim011.net"
#define mysql_user "c12smdb"
#define mysql_password "8MZCujcSzxWp@"
#define mysql_database "c12w64smdb"

hook OnGameModeInit()
{
	print("\n[OnGameModeInit] Initialising 'Config'...");
	ShowPlayerMarkers(0);
	EnableStuntBonusForAll(0);
	UsePlayerPedAnims();
	SendRconCommand("mapname "#gamemode_map);
	SetGameModeText(#gamemode_text);
	DisableInteriorEnterExits();
}