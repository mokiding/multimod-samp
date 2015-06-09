public OnPlayerCommandText(playerid, cmdtext[])
{
	new cmd[256], idx, string[256];
	cmd = strtok(cmdtext, idx);

	new pName[MAX_PLAYER_NAME];
	new targetid;
	new pNameGive[MAX_PLAYER_NAME];

	new Float:x, Float:y, Float:z;
	//
	// Admin Commands

	if(strcmp(cmd, "/bano", true) == 0 || strcmp(cmd, "/banoffline", true) == 0)
	{
		if(IsPlayerConnected(playerid))
		{
			if(gLogged[playerid] == 1)
			{
				cache_get_data(rows, fields, handle);

				new query[512];
				mysql_format(handle, query, sizeof(query), "SELECT `username` FROM `players` WHERE `username` = '%e' AND `Banned` = '0' LIMIT 0", gTemp);
				mysql_query(handle, query);

				GetPlayerName(playerid, pName, sizeof(pName));

				gTemp = strtok(cmdtext, idx);

				if(!strlen(gTemp))
				{
					SendClientMessage(playerid, COLOR_SYN, "Komanda: (/bano)ffline <playername> <reason>");
					return 1;
				}

				if (PlayerInfo[playerid][pAdmin] >= 2)
				{
					if(!rows)
					{
						format(string, sizeof(string), "Greska: Nobody with the name %s is registered or this player is alredy banned.");
						return SendClientMessage(playerid, COLOR_ERROR, string);
					}

					else if(rows)
					{
	  					GetPlayerName(targetid, pNameGive, sizeof(pNameGive));

						new length = strlen(cmdtext);

	  					while ((idx < length) && (cmdtext[idx] <= ' '))
	  					{
	  						idx++;
	  					}

	  					new offset = idx;
	  					new result[128];

	  					while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
	  					{
	  						result[idx - offset] = cmdtext[idx];
	  						idx++;
	  					}

	  					result[idx - offset] = EOS;

	  					if(!strlen(result))
	  					{
	  						SendClientMessage(playerid, COLOR_SYN, "Komanda: (/bano)ffline <playername> <reason>");
	  						return 1;
	  					}

	  					if(PlayerInfo[targetid][pAdmin] > 0 && PlayerInfo[playerid][pAdmin] < 6)
						{
	  						SendClientMessage(playerid, COLOR_ERROR, "AdmWarning: You can't ban admins!");
	  						format(string, sizeof(string), "AdmCmd: %s tried to ban admin %s with the reason: %s", pName, pNameGive, (result));
	  						AdminsBroadCast(COLOR_LIGHTRED, string);
	  						return 1;
						}

						format(string, sizeof(string), "AdmCmd: %s was banned offline by %s, reason: %s", gTemp, pName, (result));
	  					SendClientMessageToAll(COLOR_LIGHTRED, string);

		   				mysql_format(handle, query, sizeof(query), "UPDATE `players` SET `Banned` = '1' WHERE username = '%e'", gTemp);
						mysql_query(handle, query);

	  					mysql_format(handle, query, sizeof(query) ,"INSERT INTO `banslogs` (`ID`,`username`,`IP`,`Admin`,`Reason`,`Type`,`Date`,`Time`) VALUES ('','%e','%e','%e','%e','%e',CURRENT_TIMESTAMP,'%d')",
	  					gTemp, PlayerInfo[targetid][pIP], pName, result, "Offline", 0);
	  					mysql_query(handle, query);

						new pGiveIP[256];
						GetPlayerIp(targetid, pGiveIP, sizeof(pGiveIP));
						strmid(PlayerInfo[targetid][pIP], pGiveIP, 0, 100, 255);

						return 1;
					}
				}
				else
				{
					SendClientMessage(playerid, COLOR_ERROR, "Greska: Your admin level is not high enough to use this command.");
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_ERROR, "You are not logged in!");
			}
		}
		return 1;
	}

	

	if(strcmp(cmd, "/checkweapons", true) == 0 || strcmp(cmd, "/checkw", true) == 0)
	{
		if(IsPlayerConnected(playerid))
		{
			if(gLogged[playerid] == 1)
			{
				if (PlayerInfo[playerid][pAdmin] < 1)
				{
					SendClientMessage(playerid, COLOR_ERROR, "You are not authorized");
					return 1;
				}
				gTemp = strtok(cmdtext,idx);
				if (!strlen(gTemp))
				{
					SendClientMessage(playerid, COLOR_SYN, "Komanda: /checkweapons <playerid/partOfName>");
					return 1;
				}
				targetid = ReturnUser(gTemp);
				if (targetid == INVALID_PLAYER_ID)
				{
					SendClientMessage(playerid, COLOR_ERROR, "That player is offline");
					return 1;
				}
				new weaponsmodel, ammunition;

				GetPlayerName(targetid, pNameGive, sizeof(pNameGive));

				format(string, sizeof(string), "%s has the following weapons:", pNameGive);
				SendClientMessage(playerid, COLOR_ADMIN_INFO, string);

				for (new i=0; i<9; i++)
				{
					GetPlayerWeaponData(targetid, i, weaponsmodel, ammunition);
					if(weaponsmodel != 0)
					{
						format(string, sizeof(string), "%d: %d (%d)", i, weaponsmodel, ammunition);
						SendClientMessage(playerid, COLOR_ADMIN_INFO, string);
					}
				}
			}
		}
		return 1;
	}



	//
	// Helpers Commands
	if(strcmp(cmd, "/hh", true) == 0 || strcmp(cmd, "/helperhelp", true) == 0)
	{
		if(IsPlayerConnected(playerid))
		{
			if(gLogged[playerid] == 1)
			{
				if(PlayerInfo[playerid][pHelper] >= 1)
				{
					SendClientMessage(playerid, COLOR_GREEN, "_______________________________________");

					if(PlayerInfo[playerid][pHelper] >= 1)
					{
						SendClientMessage(playerid, COLOR_WHITE, "** Helper level 1 ** (/hh)elperhelp (/he)lperchat /goto /check");
					}

					if(PlayerInfo[playerid][pHelper] >= 2)
					{
						SendClientMessage(playerid, COLOR_WHITE, "** Helper level 2 **");
					}

					if(PlayerInfo[playerid][pHelper] >= 3)
					{
						SendClientMessage(playerid, COLOR_WHITE, "** Helper level 3 **");
					}

					if(PlayerInfo[playerid][pHelper] >= 4)
					{
						SendClientMessage(playerid, COLOR_WHITE, "** Helper level 4 **");
					}

					if(PlayerInfo[playerid][pHelper] >= 5)
					{
						SendClientMessage(playerid, COLOR_WHITE, "** Helper level 5 **");
					}

					if(PlayerInfo[playerid][pHelper] >= 6)
					{
						SendClientMessage(playerid, COLOR_WHITE, "** Helper level 6 **");
					}

					SendClientMessage(playerid, COLOR_GREEN, "_______________________________________");
				}

				else
	  			{
	  				SendClientMessage(playerid, COLOR_ERROR, "Greska: Your helper level is not high enough to use this command.");
				}

	  		}

			else
			{
				SendClientMessage(playerid, COLOR_ERROR, "You are not logged in!");
	  		}
		}
		return 1;
	}

	if(strcmp(cmd, "/he", true) == 0 || strcmp(cmd, "/helperchat", true) == 0)
	{
		if(IsPlayerConnected(playerid))
		{
			if(gLogged[playerid] == 1)
			{
				GetPlayerName(playerid, pName, sizeof(pName));

				new length = strlen(cmdtext);

				while ((idx < length) && (cmdtext[idx] <= ' '))
				{
					idx++;
				}

				new offset = idx;
				new result[128];

				while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
				{
					result[idx - offset] = cmdtext[idx];
					idx++;
				}

				result[idx - offset] = EOS;

				if(!strlen(result))
				{
					SendClientMessage(playerid, COLOR_SYN, "Komanda: (/he)lperchat <text>");
					return 1;
				}

				if (PlayerInfo[playerid][pHelper] >= 1 && PlayerInfo[playerid][pHelper] <= 5)
				{
					format(string, sizeof(string), "** Helper Level %d %s : %s **", PlayerInfo[playerid][pHelper], pName, result);
					HelpersBroadCast(COLOR_YELLOW2, string);
				}

				if (PlayerInfo[playerid][pHelper] == 6)
				{
					format(string, sizeof(string), "{CFAE70}** Helper Level %d %s : %s **", PlayerInfo[playerid][pHelper], pName, result);
					HelpersBroadCast(COLOR_WHITE, string);
				}

				if (PlayerInfo[playerid][pAdmin] < 1)
				{
		   			SendClientMessage(playerid, COLOR_ERROR, "Greska: Your helper level is not high enough to use this command.");
					return 1;
	  			}
			}
			else
			{
				SendClientMessage(playerid, COLOR_ERROR, "You are not logged in!");
			}
		}
		return 1;
	}