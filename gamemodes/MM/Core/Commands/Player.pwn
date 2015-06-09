#include <YSI\y_hooks>

YCMD:help(playerid, params[], help)
{
	if(!IsPlayerLogged(playerid)) return SendClientMessage(playerid, -1, "Nisi ulogovan");
	new stringtwo[1024];
	strcat(stringtwo,"-VAS NALOG- /stats\n-GENERALNO-\n",sizeof(stringtwo));
	strcat(stringtwo,"/fuel /v\n-GENERALNO- /resetupgrades(100k) /oruzje /lock /skill /portable /dozvole /spawnchange /mo\n-GENERALNO- /report /cancel /prihvati /eject /usedrugs\n",sizeof(stringtwo));
	strcat(stringtwo,"/contract /fill /fillcar /clear /service /pl /le\n-CHAT- (/w)hisper (/o)oc (/s)hout (/c)lose (/l)ocal (/b) (/ad)vertise (/f)amily /me\n-BANKA- /balance\n",sizeof(stringtwo));
	strcat(stringtwo,"/withdraw /deposit /wiretransfer\n",sizeof(stringtwo));
	ShowPlayerDialog(playerid,1,DIALOG_STYLE_MSGBOX,"{72FFFF}[SM] Help",stringtwo,"Ok","");
	return 1;
}

YCMD:stats(playerid, params[], help)
{
	if(!IsPlayerLogged(playerid)) return SendClientMessage(playerid, -1, "Nisi ulogovan");
	ShowStats(playerid, playerid);
	return 1;
}

YCMD:report(playerid, params[], help)
{
	if(!IsPlayerLogged(playerid)) return SendClientMessage(playerid, -1, "Nisi ulogovan");
	if( isnull( params )) return SendClientMessage(playerid, -1, "{72FFFF}[SM:CMD] {FFFF00}/report [report text]");
	if(ReportTime[playerid] == 0)
	{
		new pName[MAX_PLAYER_NAME], string[256];
		GetPlayerName(playerid, pName, sizeof(pName));
		format(string, sizeof(string), "Report od %s (ID:%d): %s", pName, playerid, params);
		AdminsBroadCast(COLOR_LIGHTRED2, string);
		SendClientMessage(playerid, COLOR_YELLOW2, "{72FFFF}[SM] {FFFFFF}Vas report je poslat Adminima !");
		ReportTime[playerid] = 10;
		SetTimerEx("ReportTimer", 10000, false, "i", playerid);
	}
	else
	{
		new string[256];
		format(string, sizeof(string), "{72FFFF}[SM] {FFFFFF}Moras pricekati %d sekundi pre nego sto posaljes novi report !",  ReportTime[playerid]);
		SendClientMessage(playerid, COLOR_YELLOW2, string);
	}
	return 1;
}
