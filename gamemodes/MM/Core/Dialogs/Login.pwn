#include <YSI\y_hooks>

hook OnGameModeInit()
{
	print("\n[OnGameModeInit] Initialising 'Dialogs/Main'...");
}

Dialog:LoginDialog(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new tmppass[64];
		mysql_real_escape_string(inputtext, tmppass);
		if(strlen(tmppass) >= 3 && strlen(tmppass) <= 20)
		{
			OnPlayerLoginAcc(playerid,tmppass);
		}
	  	else
	  	{
	  		new string[256];
	  		new pName[MAX_PLAYER_NAME];
	  		GetPlayerName(playerid, pName, sizeof(pName));
			format(string,sizeof(string),"{BECBFC}Dobrodosao, {95A3FF}%s{BECBFC}!\n\nMolimo vas unesite vasu lozinku.\n\n* {FFFFFF}Poslednja prijava: %s *",pName, PlayerInfo[playerid][pLastLogin]);
			Dialog_Show(playerid, LoginDialog,DIALOG_STYLE_PASSWORD,"Login",string,"Login","Izadji");
		}
	}
	else
	{
		Kick(playerid);
	}
	return 1;
}
