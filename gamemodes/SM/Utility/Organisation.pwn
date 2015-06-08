#include <YSI\y_hooks>

hook OnGameModeInit()
{
	print("\n[OnGameModeInit] Initialising 'Utility/Organisation'...");
}

GetRankName(orgid,rank)
{
	new ranktext[32];

	if(orgid == 1)//  San Marino Police Department 
	{
		if(rank == 1)
		{
			ranktext = "Junior Policeman";
		}
		else if(rank == 2)
		{
			ranktext = "Policeman";
		}
		else if(rank == 3)
		{
			ranktext = "Independent Policeman";
		}
		else if(rank == 4)
		{
			ranktext = "Police Sergeant";
		}
		else if(rank == 5)
		{
			ranktext = "Police Inspector";
		}
		else if(rank == 6)
		{
			ranktext = "Chef Police Adviser";
		}
		else if(rank == 7)
		{
			ranktext = "General of the Police";
		}
	}
	else if(orgid == 2) //San Marino FBI Department
	{
		if(rank == 1)
		{
			ranktext = "Cadet";
		}
		else if(rank == 2)
		{
			ranktext = "Officer";
		}
		else if(rank == 3)
		{
			ranktext = "Agent";
		}
		else if(rank == 4)
		{
			ranktext = "Special Agent";
		}
		else if(rank == 5)
		{
			ranktext = "Detective";
		}
		else if(rank == 6)
		{
			ranktext = "Corporate Director";
		}
		else if(rank == 7)
		{
			ranktext = "Director";
		}
	}
	else if(orgid == 3) // San Marino Nacional Inspectory
	{
		if(rank == 1)
		{
			ranktext = "Ponir";
		}
		else
		{
			ranktext = "Direktor";
		}
	}
	else if(orgid == 4) // San Marino News
	{
		if(rank == 1)
		{
			ranktext = "Novinar";
		}
		else if(rank == 2)
		{
			ranktext = "Dopisnik";
		}
		else if(rank == 3)
		{
			ranktext = "Voditelj";
		}
		else if(rank == 4)
		{
			ranktext = "Urednik";
		}
		else if(rank == 5)
		{
			ranktext = "Direktor";
		}
	}
	else
	{
		ranktext = "Nepoznat";
	}
	return ranktext;
}

GetPlayerRankName(playerid)
{
	return GetRankName(PlayerInfo[playerid][pMember],PlayerInfo[playerid][pRank]);
}


GetFactionName(orgid)
{
	new factiontext[32];
	if(orgid == 1)
	{
		factiontext = "Police Department";
	}
	else if(orgid == 2)
	{
		factiontext = "FBI Department";
	}
	else if(orgid == 3)
	{
		factiontext = "National Security Agency";
	}
	else if(orgid == 4)
	{
		factiontext = "News";
	}
	else if(orgid == 5)
	{
		factiontext = "The Last Mafioso";
	}
	else if(orgid == 6)
	{
		factiontext = "Five Families";
	}
	else if(orgid == 7)
	{
		factiontext = "Gang Capital of America";
	}
	else if(orgid == 8)
	{
		factiontext = "Morello Crime Family";
	}
	else if(orgid == 9)
	{
		factiontext = "Groove Street Family";
	}
	else if(orgid == 10)
	{
		factiontext = "38th Street Gang";
	}
	else if(orgid == 11)
	{
		factiontext = "The Avenues";
	}
	else if(orgid == 12)
	{
		factiontext = "Sinaloa Cartel";
	}
	else if(orgid == 13)
	{
		factiontext = "Private Organization 1";
	}
	else if(orgid == 14)
	{
		factiontext = "Private Organization 2";
	}
	else
	{
		factiontext = "Nepoznata";
	}
	return factiontext;
}

SetOrgSpawn(playerid,orgid)
{
	if(orgid == 1) //PD 
	{
		SetPlayerPos(playerid,1,1,1);
	}
}