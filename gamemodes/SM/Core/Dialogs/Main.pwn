#include <YSI\y_hooks>

hook OnGameModeInit()
{
	print("\n[OnGameModeInit] Initialising 'Dialogs/Main'...");
}

public OnDialogPerformed(playerid, dialog[], response, success)
{
    if (!strcmp(dialog, "WeaponMenu") && IsPlayerInAnyVehicle(playerid))
    {
        SendClientMessage(playerid, -1, "You must be on-foot to spawn a weapon.");
        return 0;
    }
    return 1;
}