#include <YSI\y_hooks>

#define EVENT_DIALOG 1337
#define EVENT_TYPE_DERBY 1
#define EVENT_TYPE_RACE 2
#define EVENT_TYPE_SHOOTER 3
#define EVENT_TYPE_RUN 4
#define EVENT_TYPE_DM 5

new OnEvent[MAX_PLAYERS];
new EventCreated = 0;
new EventType = 0;

hook OnPlayerConnect(playerid)
{
	OnEvent[playerid] = 0;
}

hook OnPlayerDisconnect(playerid, reason)
{
	OnEvent[playerid] = 0;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == EVENT_DIALOG)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					if(EventCreated == 1)
					{
						SendClientMessage(playerid, -1, "{0080C0}[SM] {FF0000}Event je vec kreiran, prvo ga zaustavi ili sacekaj da se zavrsi !");
					}
					else
					{
						new listitems[] = "{FFFF00}Derby\n{FFFF00}Race\n{FFFF00}Shooter\n{FFFF00}Run\n{FFFF00}DM\n";
						ShowPlayerDialog(playerid, EVENT_DIALOG+1, DIALOG_STYLE_LIST, "{0080C0}SM Create Event", listitems, "Izaberi", "Izadji");
					}
				}
				case 1: StopEvent(playerid);
				case 2: CountEvent(playerid);
			}
		}
		return 1;
	}

	if(dialogid == EVENT_DIALOG+1)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					ListEvents(playerid,EVENT_TYPE_DERBY);
				}
				case 1:
				{
					ListEvents(playerid,EVENT_TYPE_RACE);
				}
				case 2:
				{
					ListEvents(playerid,EVENT_TYPE_SHOOTER);
				}
				case 3:
				{
					ListEvents(playerid,EVENT_TYPE_RUN);
				}
				case 4:
				{
					ListEvents(playerid,EVENT_TYPE_DM);
				}
			}
		}
		return 1;
	}
	if(dialogid == EVENT_DIALOG+3)//race event dialog
	{
		if(response)
		{
			 CreateEvent(EVENT_TYPE_RACE,listitem,playerid);
		}
		return 1;
	}
	return 0;
}

YCMD:event(playerid, params[], help)
{
	new listitems[] = "{00FF00}Start Event\n{FF0000}Stop Event\n{FF8000}Count\n";
	ShowPlayerDialog(playerid, EVENT_DIALOG, DIALOG_STYLE_LIST, "{0080C0}SM Events", listitems, "Izaberi", "Izadji");
	return 1;
}

StopEvent(playerid)
{
	if(EventCreated == 1)
	{
		//StopirajEvent
	}
	else
	{
		SendClientMessage(playerid, -1, "{0080C0}[SM] {FF0000}Event nije poreknut, nemas sta stopirati !");
	}
}

CountEvent(playerid)
{
	if(EventCreated == 1)
	{
		//startEvent
	}
	else
	{
		SendClientMessage(playerid, -1, "{0080C0}[SM] {FF0000}Event nije kreiran, prvo ga kreiraj da bi bio pokrenut !");
	}
}

CreateEvent(type,map,playerid)
{
	if(EventCreated == 1)
	{
		SendClientMessage(playerid, -1, "{0080C0}[SM] {FF0000}Dok si birao event, neko ga je vec kreirao, tako da ovaj ne moze biti kreiran !");
	}
	else
	{
		if(type == EVENT_TYPE_DERBY)
		{
			//kreiraj dd event
		}
		else if(type == EVENT_TYPE_RACE)
		{
//			new mapname[40] = GetEventMapName(type,map);
			new event_creator[MAX_PLAYER_NAME], string[24+MAX_PLAYER_NAME];
			GetPlayerName(playerid, event_creator, sizeof(event_creator));
			format(string, sizeof(string), "{0080C0}[SM]{FFFFFF} %s {00FF40}je kreirao event.", event_creator);
			SendClientMessageToAll(-1, string);
			format(string, sizeof(string), "{0080C0}[SM]{FFFFFF} %s {00FF40}je kreirao event.", event_creator);
			SendClientMessageToAll(-1, string);

		}
		else if(type == EVENT_TYPE_SHOOTER)
		{
			//kreiraj shooter event
		}
		else if(type == EVENT_TYPE_RUN)
		{
			//kreiraj run event
		}
		else if(type == EVENT_TYPE_DM)
		{
			//kreiraj dm event
		}
	}
}

ListEvents(playerid,type)
{
	if(type == EVENT_TYPE_DERBY)
	{
		//EVENT_DIALOG+2
	}
	else if(type == EVENT_TYPE_RACE)
	{
		new listitems[] =
		"Name\tMax Slot\tTime Limit (min)\n" \
		"SA Race\t20\t10\n" \
		"Mt Chiliad\t40\t10\n" \
		"Dolores\t30\t10\n";
		ShowPlayerDialog(playerid,EVENT_DIALOG+3,DIALOG_STYLE_TABLIST_HEADERS,"{0080C0}SM Create Event RACE",listitems,"Izaberi","Izadji");
	}
	else if(type == EVENT_TYPE_SHOOTER)
	{
		new listitems[] =
		"Name\tMax Slot\tTime Limit (min)\n" \
		"SF Air\t50\t10\n" \
		"Box\t50\t10\n" \
		"D-Devils\t50\t10\n";
		ShowPlayerDialog(playerid,EVENT_DIALOG+4,DIALOG_STYLE_TABLIST_HEADERS,"{0080C0}SM Create Event RACE",listitems,"Izaberi","Izadji");
	}
	else if(type == EVENT_TYPE_RUN)
	{
		//EVENT_DIALOG+5
	}
	else if(type == EVENT_TYPE_DM)
	{
		//EVENT_DIALOG+6
	}
}

GetEventMapName(type,mapid)
{
	new mapname[40];
	format(mapname, sizeof(mapname), "Race 123");
	return mapname;
}