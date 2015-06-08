#include <YSI\y_hooks>

forward OnPlayerRegister(playerid, password[]);

hook OnGameModeInit()
{
	print("\n[OnGameModeInit] Initialising 'System/Register'...");
}

public OnPlayerRegister(playerid, password[])
{
	if(IsPlayerConnected(playerid))
	{
		new pName[30];
		new query[256];
		new string[256];
		GetPlayerName(playerid, pName, sizeof(pName));

		mysql_format(handle, query, sizeof(query), "INSERT INTO `players` (`username`,`password`) VALUES ('%e', MD5('%e'))", pName, password);
		mysql_tquery(handle, query, "", "");

		strmid(PlayerInfo[playerid][pPassword], password, 0, strlen(password), 255);

		format(string, sizeof(string), "Unesite vasu lozinku da bi ste se ulogovali:", pName);
		Dialog_Show(playerid, LoginDialog ,DIALOG_STYLE_PASSWORD, "Login", string, "Login", "Exit");

	}
	return 1;
}
