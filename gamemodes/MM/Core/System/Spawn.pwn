#include <YSI\y_hooks>

hook OnGameModeInit()
{
	print("\n[OnGameModeInit] Initialising 'System/Spawn'...");
}


hook OnPlayerSpawn(playerid)
{
	if(!IsPlayerLogged(playerid))
	{
		KickWithMessage(playerid, COLOR_LIGHTRED, "{0080C0}[SM] {FF0000}Moras se ulogovati pre spawna !");
	}

	SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);

	if(PlayerInfo[playerid][pTutorial] == 0)
	{
		SetPlayerCameraPos(playerid, 1500.7156,-1778.1880,80.3080);
		SetPlayerCameraLookAt(playerid, 1500.7156,-1778.1880,80.3080);
		SetPlayerPos(playerid, 1437.6957,-2266.6355,13.5469);
		Dialog_Show(playerid, RegisterPol, DIALOG_STYLE_MSGBOX, "Pol", "Da li si musko ili zensko ?", "Musko", "Zensko");
	}
	
	if (PlayerInfo[playerid][pMember] == 1 || PlayerInfo[playerid][pLeader] == 1)// Los Santos Police Departament spawn
	{

		PlayerInfo[playerid][pInterior] = 6;
		SetPlayerInterior(playerid, 6);

		SetPlayerPos(playerid, 216.9725,79.1339,1005.0391);
		SetPlayerFacingAngle(playerid, 0);
		return 1;
	}
	if (PlayerInfo[playerid][pMember] == 2 || PlayerInfo[playerid][pLeader] == 2)// Las Venturas Police Departament spawn
	{

		PlayerInfo[playerid][pInterior] = 3;
		SetPlayerInterior(playerid, 3);

		SetPlayerPos(playerid, 297.3488,186.3873,1007.1719);
		SetPlayerFacingAngle(playerid, 0);
		return 1;
	}
	if (PlayerInfo[playerid][pMember] == 3 || PlayerInfo[playerid][pLeader] == 3)// San Fierro Police Departament spawn
	{

		PlayerInfo[playerid][pInterior] = 0;
		SetPlayerInterior(playerid, 0);

		SetPlayerPos(playerid, -1606.3876,676.6782,-5.2422);
		SetPlayerFacingAngle(playerid, 0);
		return 1;
	}
	return 1;
}
