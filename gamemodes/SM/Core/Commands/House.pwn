#include <YSI\y_hooks>

hook OnGameModeInit()
{
	print("\n[OnGameModeInit] Initialising 'Commands/House'...");
}
/*
YCMD:lockhouse(playerid, params[], help)
{
	for(new h; h < MAX_HOUSES; h++)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 3.5, HD[h][exteriorX], HD[h][exteriorY], HD[h][exteriorZ])) {
	        if(strcmp(HD[h][owner], ReturnName(playerid), true) == 0) {
	            if(HD[h][locked] == 0) {
                    GameTextForPlayer(playerid, "House ~r~locked", 3000, 5);
					HD[h][locked] = 1;
	            } else {
	                GameTextForPlayer(playerid, "House ~g~unlocked", 3000, 5);
					HD[h][locked] = 0;
	            }
	        }
		}
		if(IsPlayerInRangeOfPoint(playerid, 3.5, HD[h][interiorX], HD[h][interiorY], HD[h][interiorZ]) && GetPlayerInterior(playerid) == HD[h][interiorInt]) {
	        if(strcmp(HD[h][Owner], ReturnName(playerid), true) == 0) {
	            if(HD[h][locked] == 0) {
                    GameTextForPlayer(playerid, "House ~r~locked", 3000, 5);
					HD[h][locked] = 1;
	            } else {
	                GameTextForPlayer(playerid, "House ~g~unlocked", 3000, 5);
					HD[h][locked] = 0;
	            }
	        }
		}
	}
	return 1;
}



YCMD:buyhouse(playerid, params[], help)
{
    for(new h; h < MAX_HOUSES; h++) {
	    if(IsPlayerInRangeOfPoint(playerid, 3.5, HD[h][exteriorX], HD[h][exteriorY], HD[h][exteriorZ])) {
     		if(HD[h][price] > -1) {
     		    if(GetPlayerMoney(playerid) >= HD[h][price]) {
					format(HD[h][owner], 24, ReturnName(playerid));
					SendClientMessage(playerid, WHITE, "You have successfully bought the house!");
     		    }
	        } else {
         		GameTextForPlayer(playerid, "House ~r~unavailable", 3000, 5);
	        }
		}
	}
	return 1;
}

YCMD:exithouse(playerid, params[], help)
{
	for(new h; h < MAX_HOUSES; h++) {
	    if(IsPlayerInRangeOfPoint(playerid, 3.5, HD[InsideHouse[playerid]][interiorX], HD[InsideHouse[playerid]][interiorY], HD[InsideHouse[playerid]][interiorZ])) {
     		if(HD[h][locked] == 0) {
     		    SetPlayerVirtualWorld(playerid, 0);
     			SetPlayerInterior(playerid, 0);
       			SetPlayerPos(playerid, HD[InsideHouse[playerid]][exteriorX], HD[InsideHouse[playerid]][exteriorY], HD[InsideHouse[playerid]][exteriorZ]);
	        } else {
         		GameTextForPlayer(playerid, "House ~r~locked", 3000, 5);
	        }
		}
	}
	return 1;
}

YCMD:enterhouse(playerid, params[], help)
{
	for(new h; h < MAX_HOUSES; h++) {
	    if(IsPlayerInRangeOfPoint(playerid, 3.5, HD[h][exteriorX], HD[h][exteriorY], HD[h][exteriorZ])) {
     		if(HD[h][locked] == 0) {
				SetPlayerVirtualWorld(playerid, h);
				InsideHouse[playerid] = h;
     			SetPlayerInterior(playerid, HD[h][interiorInt]);
       			SetPlayerPos(playerid, HD[h][interiorX], HD[h][interiorY], HD[h][interiorZ]);
	        } else {
         		GameTextForPlayer(playerid, "House ~r~locked", 3000, 5);
	        }
		}
	}
	return 1;
}
*/

YCMD:createhouse1(playerid, params[], help)
{
	GetPlayerPos(playerid, HC[playerid][ExteriorX], HC[playerid][ExteriorY],HC[playerid][ExteriorZ]);
	return true;
}

YCMD:createhouse2(playerid, params[], help)
{
	GetPlayerPos(playerid, HC[playerid][ExteriorX], HC[playerid][ExteriorY],HC[playerid][ExteriorZ]);
	CreateHouse(playerid,-1, HC[playerid][ExteriorX], HC[playerid][ExteriorY],HC[playerid][ExteriorZ], HC[playerid][InteriorX], HC[playerid][InteriorY],HC[playerid][InteriorZ], HC[playerid][InteriorInt], 1);
	return true;
}

YCMD:setprice(playerid, params[], help)
{
	new HID, HP, string[128];
	if(IsPlayerAdmin(playerid)) {
		if(sscanf(params, "dd", HID, HP)) {
		    SendClientMessage(playerid, WHITE, "/setprice [HOUSE ID] [HOUSE PRICE]");
		} else {
			HD[HID][Price] = HP;
			format(string, sizeof(string), "Postavio si cenu kuce %d na %d $ !", HID, HP);
			SendClientMessage(playerid, WHITE, string);
		}
	}
	return 1;
}

YCMD:createhouse(playerid, params[], help)
{
	if(!IsPlayerLogged(playerid)) return SendClientMessage(playerid, -1, "Nisi ulogovan");
	if(!IsPAdmin(playerid,1)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Niste admin !");
	if(!IsPAdmin(playerid,2)) return SendClientMessage(playerid, -1, ""#SMCOLOR"[SM] {FFFF00}Nemate dovoljan admin level !");
	Dialog_Show(playerid, CreateHouse, DIALOG_STYLE_PASSWORD,	"Registracija", "Lozinka mora biti duza od 3 karaktera ! Ponovno unesi lozinku:",	 "Registracija", "Izadji");
	return 1;
}