#include <YSI\y_hooks>

#define GMDEBUG true
#define gamemode_text "[MM:DEV by m0k1]"
#define gamemode_map "MultiMode"

#define mysql_host "localhost"
#define mysql_user "root"
#define mysql_password ""
#define mysql_database "mmsamp"

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