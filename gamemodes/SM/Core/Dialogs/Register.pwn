#include <YSI\y_hooks>

hook OnGameModeInit()
{
	print("\n[OnGameModeInit] Initialising 'Dialogs/Register'...");
}

Dialog:RegisterPassword(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new tmppass[64];
		mysql_real_escape_string(inputtext, tmppass);
		if(strlen(tmppass) >= 3 && strlen(tmppass) <= 20)
		{
			OnPlayerRegister(playerid,tmppass);
		}
		else
		{
			Dialog_Show(playerid, RegisterPassword, DIALOG_STYLE_PASSWORD,	"Registracija", "Lozinka mora biti duza od 3 karaktera ! Ponovno unesi lozinku:",	 "Registracija", "Izadji");
  		}
	}
	else
	{
		Kick(playerid);
	}
	return 1;
}

Dialog:RegisterPol(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		PlayerInfo[playerid][pSex] = 1;
		Update(playerid, pSexu);
		RegistrationStep[playerid] = 1;
		Dialog_Show(playerid, RegisterGodine, DIALOG_STYLE_INPUT, "Godine", "OK, musko si.\n\nKoliko godina imas?(7-50)", "Dalje", "Nazad");
	}
	else
	{
		PlayerInfo[playerid][pSex] = 2;
		Update(playerid, pSexu);
		RegistrationStep[playerid] = 1;
		Dialog_Show(playerid, RegisterGodine, DIALOG_STYLE_INPUT, "Godine", "OK, zensko si.\n\nKoliko godina imas?(7-50)", "Dalje", "Nazad");
	}
	return 1;
}

Dialog:RegisterGodine(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new age = strval(inputtext);
		new string[256];
		if(age > 6 && age < 51)
		{
			PlayerInfo[playerid][pAge] = age;
			Update(playerid, pAgeu);
			RegistrationStep[playerid] = 2;
			format(string, sizeof(string), "OK, imas %d godina.\n\nSada je potrebno da uneses tvoj email:", age);
			Dialog_Show(playerid, RegisterEmail, DIALOG_STYLE_INPUT, "Email", string, "Dalje", "Nazad");
		}
		else
		{
			Dialog_Show(playerid, RegisterGodine, DIALOG_STYLE_INPUT, "Godine", "Moras imati vise od 7 a manje od 50 godina !", "Dalje", "Nazad");
		}
	}
	else
	{
		Dialog_Show(playerid, RegisterPol, DIALOG_STYLE_MSGBOX, "Pol", "Da li si musko ili zensko ?", "Musko", "Zensko");
	}
	return 1;
}

Dialog:RegisterEmail(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		if(ValidEmail(inputtext))
		{
			new string[256];
			strmid(PlayerInfo[playerid][pEmail], inputtext, 0, strlen(inputtext), 999);
			Update(playerid, pEmailu);
			format(string, sizeof(string), "OK, tvoj email je %s.", inputtext);
			Dialog_Show(playerid, RegisterFinish, DIALOG_STYLE_MSGBOX,"Email", string, "Dalje", "");
		}
		else
		{
			Dialog_Show(playerid, RegisterEmail, DIALOG_STYLE_INPUT, "Email", "Email koji ste uneli nije validan, unesi validan email !", "Dalje", "Nazad");
		}
	}
	else
	{
		Dialog_Show(playerid, RegisterGodine, DIALOG_STYLE_INPUT, "Godine", "Unesite vase godine:", "Dalje", "Nazad");
	}
	return 1;
}

Dialog:RegisterFinish(playerid, response, listitem, inputtext[])
{
	RegistrationStep[playerid] = 0;
	TutorialTime[playerid] = 1;
	return 1;
}