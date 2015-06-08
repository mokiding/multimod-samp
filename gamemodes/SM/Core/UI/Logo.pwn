#include <YSI\y_hooks>

new Text:LogoLinija1;
new Text:LogoLinija2;
new Text:LogoLinija3;
new Text:LogoLinija4;
new Text:LogoLinija5;
new Text:LogoLinija6;
new Text:LogoLinija7;
new Text:LogoLinija8;
new Text:LogoLinija9;
new Text:LogoLinija10;
new Text:LogoLinija11;
new Text:LogoLinija12;
new Text:LogoLinija13;
new Text:LogoLinija14;
new Text:LogoLinija15;
new Text:LogoLinija16;
new Text:LogoLinija17;
new Text:LogoLinija18;
new Text:LogoLinija19;

new Text:ServerPoruka1;

new Text:WWLogo0;
new Text:WWLogo1;
new Text:WWLogo2;
new Text:WWLogo3;
new Text:WWLogo4;
new Text:WWLogo5;
new Text:WWLogo6;
new Text:WWLogo7;
new Text:WWLogo8;
new Text:WWLogo9;
new Text:WWLogo10;
new Text:WWLogo11;


hook OnPlayerConnect(playerid)
{
	LogoShow(playerid);
}

hook OnPlayerDisconnect(playerid, reason)
{
	LogoHide(playerid);
}

stock LogoShow(playerid)
{
	TextDrawShowForPlayer(playerid, LogoLinija1);
	TextDrawShowForPlayer(playerid, LogoLinija2);
	TextDrawShowForPlayer(playerid, LogoLinija3);
	TextDrawShowForPlayer(playerid, LogoLinija4);
	TextDrawShowForPlayer(playerid, LogoLinija5);
	TextDrawShowForPlayer(playerid, LogoLinija6);
	TextDrawShowForPlayer(playerid, LogoLinija7);
	TextDrawShowForPlayer(playerid, LogoLinija8);
	TextDrawShowForPlayer(playerid, LogoLinija9);
	TextDrawShowForPlayer(playerid, LogoLinija10);
	TextDrawShowForPlayer(playerid, LogoLinija11);
	TextDrawShowForPlayer(playerid, LogoLinija12);
	TextDrawShowForPlayer(playerid, LogoLinija13);
	TextDrawShowForPlayer(playerid, LogoLinija14);
	TextDrawShowForPlayer(playerid, LogoLinija15);
	TextDrawShowForPlayer(playerid, LogoLinija16);
	TextDrawShowForPlayer(playerid, LogoLinija17);
	TextDrawShowForPlayer(playerid, LogoLinija18);
	TextDrawShowForPlayer(playerid, LogoLinija19);

	TextDrawShowForPlayer(playerid, ServerPoruka1);

	TextDrawShowForPlayer(playerid, WWLogo0);
	TextDrawShowForPlayer(playerid, WWLogo1);
	TextDrawShowForPlayer(playerid, WWLogo2);
	TextDrawShowForPlayer(playerid, WWLogo3);
	TextDrawShowForPlayer(playerid, WWLogo4);
	TextDrawShowForPlayer(playerid, WWLogo5);
	TextDrawShowForPlayer(playerid, WWLogo6);
	TextDrawShowForPlayer(playerid, WWLogo7);
	TextDrawShowForPlayer(playerid, WWLogo8);
	TextDrawShowForPlayer(playerid, WWLogo9);
	TextDrawShowForPlayer(playerid, WWLogo10);
	TextDrawShowForPlayer(playerid, WWLogo11);
}

stock LogoHide(playerid)
{
	TextDrawHideForPlayer(playerid, LogoLinija1);
	TextDrawHideForPlayer(playerid, LogoLinija2);
	TextDrawHideForPlayer(playerid, LogoLinija3);
	TextDrawHideForPlayer(playerid, LogoLinija4);
	TextDrawHideForPlayer(playerid, LogoLinija5);
	TextDrawHideForPlayer(playerid, LogoLinija6);
	TextDrawHideForPlayer(playerid, LogoLinija7);
	TextDrawHideForPlayer(playerid, LogoLinija8);
	TextDrawHideForPlayer(playerid, LogoLinija9);
	TextDrawHideForPlayer(playerid, LogoLinija10);
	TextDrawHideForPlayer(playerid, LogoLinija11);
	TextDrawHideForPlayer(playerid, LogoLinija12);
	TextDrawHideForPlayer(playerid, LogoLinija13);
	TextDrawHideForPlayer(playerid, LogoLinija14);
	TextDrawHideForPlayer(playerid, LogoLinija15);
	TextDrawHideForPlayer(playerid, LogoLinija16);
	TextDrawHideForPlayer(playerid, LogoLinija17);
	TextDrawHideForPlayer(playerid, LogoLinija18);
	TextDrawHideForPlayer(playerid, LogoLinija19);

	TextDrawHideForPlayer(playerid, ServerPoruka1);

	TextDrawHideForPlayer(playerid, WWLogo0);
	TextDrawHideForPlayer(playerid, WWLogo1);
	TextDrawHideForPlayer(playerid, WWLogo2);
	TextDrawHideForPlayer(playerid, WWLogo3);
	TextDrawHideForPlayer(playerid, WWLogo4);
	TextDrawHideForPlayer(playerid, WWLogo5);
	TextDrawHideForPlayer(playerid, WWLogo6);
	TextDrawHideForPlayer(playerid, WWLogo7);
	TextDrawHideForPlayer(playerid, WWLogo8);
	TextDrawHideForPlayer(playerid, WWLogo9);
	TextDrawHideForPlayer(playerid, WWLogo10);
	TextDrawHideForPlayer(playerid, WWLogo11);
}

hook OnGameModeInit()
{
	print("\n[OnGameModeInit] Initialising 'UI/Logo'...");

	LogoLinija1 = TextDrawCreate(139.777664, 437.555480, "]");
	TextDrawLetterSize(LogoLinija1, 0.243222, 0.556222);
	TextDrawAlignment(LogoLinija1, 1);
	TextDrawColor(LogoLinija1, 833085439);
	TextDrawSetShadow(LogoLinija1, 1);
	TextDrawSetOutline(LogoLinija1, 0);
	TextDrawBackgroundColor(LogoLinija1, 51);
	TextDrawFont(LogoLinija1, 2);
	TextDrawSetProportional(LogoLinija1, 1);

	LogoLinija2 = TextDrawCreate(0.055555, 424.407318, "LD_SPAC:white");
	TextDrawLetterSize(LogoLinija2, 0.000000, 0.000000);
	TextDrawTextSize(LogoLinija2, 640.000000, 0.518554);
	TextDrawAlignment(LogoLinija2, 1);
	TextDrawColor(LogoLinija2, 529713663);
	TextDrawSetShadow(LogoLinija2, 0);
	TextDrawSetOutline(LogoLinija2, 0);
	TextDrawFont(LogoLinija2, 4);

	LogoLinija3 = TextDrawCreate(2.166666, 444.074157, "LD_SPAC:white");
	TextDrawLetterSize(LogoLinija3, 0.000000, 0.000000);
	TextDrawTextSize(LogoLinija3, 640.000000, 0.518554);
	TextDrawAlignment(LogoLinija3, 1);
	TextDrawColor(LogoLinija3, 529713663);
	TextDrawSetShadow(LogoLinija3, 0);
	TextDrawSetOutline(LogoLinija3, 0);
	TextDrawFont(LogoLinija3, 4);

	LogoLinija4 = TextDrawCreate(498.221862, 437.592437, "]");
	TextDrawLetterSize(LogoLinija4, 0.243222, 0.556222);
	TextDrawAlignment(LogoLinija4, 1);
	TextDrawColor(LogoLinija4, 833085439);
	TextDrawSetShadow(LogoLinija4, 1);
	TextDrawSetOutline(LogoLinija4, 0);
	TextDrawBackgroundColor(LogoLinija4, 51);
	TextDrawFont(LogoLinija4, 2);
	TextDrawSetProportional(LogoLinija4, 1);

	LogoLinija5 = TextDrawCreate(504.221862, 426.148040, "]");
	TextDrawLetterSize(LogoLinija5, 0.302611, 0.854371);
	TextDrawAlignment(LogoLinija5, 1);
	TextDrawColor(LogoLinija5, 833085439);
	TextDrawSetShadow(LogoLinija5, 1);
	TextDrawSetOutline(LogoLinija5, 0);
	TextDrawBackgroundColor(LogoLinija5, 51);
	TextDrawFont(LogoLinija5, 2);
	TextDrawSetProportional(LogoLinija5, 1);

	LogoLinija6 = TextDrawCreate(131.221984, 427.251647, "]");
	TextDrawLetterSize(LogoLinija6, 0.302611, 0.854371);
	TextDrawAlignment(LogoLinija6, 1);
	TextDrawColor(LogoLinija6, 833085439);
	TextDrawSetShadow(LogoLinija6, 1);
	TextDrawSetOutline(LogoLinija6, 0);
	TextDrawBackgroundColor(LogoLinija6, 51);
	TextDrawFont(LogoLinija6, 2);
	TextDrawSetProportional(LogoLinija6, 1);
	
	LogoLinija7 = TextDrawCreate(653.055236, 426.892639, "usebox");
	TextDrawLetterSize(LogoLinija7, 0.000000, 1.707406);
	TextDrawTextSize(LogoLinija7, -4.388888, 0.000000);
	TextDrawAlignment(LogoLinija7, 1);
	TextDrawColor(LogoLinija7, 0);
	TextDrawUseBox(LogoLinija7, true);
	TextDrawBoxColor(LogoLinija7, 102);
	TextDrawSetShadow(LogoLinija7, 0);
	TextDrawSetOutline(LogoLinija7, 0);
	TextDrawFont(LogoLinija7, 0);

	LogoLinija8 = TextDrawCreate(-20.055555, 441.311126, "LD_SPAC:white");
	TextDrawLetterSize(LogoLinija8, 0.000000, 0.000000);
	TextDrawTextSize(LogoLinija8, 66.111114, 2.592590);
	TextDrawAlignment(LogoLinija8, 1);
	TextDrawColor(LogoLinija8, 833085439);
	TextDrawSetShadow(LogoLinija8, 0);
	TextDrawSetOutline(LogoLinija8, 0);
	TextDrawBackgroundColor(LogoLinija8, 529713663);
	TextDrawFont(LogoLinija8, 4);

	LogoLinija9 = TextDrawCreate(-28.111087, 437.126190, "LD_SPAC:white");
	TextDrawLetterSize(LogoLinija9, 0.000000, 0.000000);
	TextDrawTextSize(LogoLinija9, 66.111114, 2.592590);
	TextDrawAlignment(LogoLinija9, 1);
	TextDrawColor(LogoLinija9, 833085439);
	TextDrawSetShadow(LogoLinija9, 0);
	TextDrawSetOutline(LogoLinija9, 0);
	TextDrawBackgroundColor(LogoLinija9, 529713663);
	TextDrawFont(LogoLinija9, 4);

	LogoLinija10 = TextDrawCreate(-35.444419, 433.148651, "LD_SPAC:white");
	TextDrawLetterSize(LogoLinija10, 0.000000, 0.000000);
	TextDrawTextSize(LogoLinija10, 66.111114, 2.592590);
	TextDrawAlignment(LogoLinija10, 1);
	TextDrawColor(LogoLinija10, 833085439);
	TextDrawSetShadow(LogoLinija10, 0);
	TextDrawSetOutline(LogoLinija10, 0);
	TextDrawBackgroundColor(LogoLinija10, 529713663);
	TextDrawFont(LogoLinija10, 4);

	LogoLinija11 = TextDrawCreate(-41.222274, 428.911865, "LD_SPAC:white");
	TextDrawLetterSize(LogoLinija11, 0.000000, 0.000000);
	TextDrawTextSize(LogoLinija11, 66.111114, 2.592590);
	TextDrawAlignment(LogoLinija11, 1);
	TextDrawColor(LogoLinija11, 833085439);
	TextDrawSetShadow(LogoLinija11, 0);
	TextDrawSetOutline(LogoLinija11, 0);
	TextDrawBackgroundColor(LogoLinija11, 529713663);
	TextDrawFont(LogoLinija11, 4);

	LogoLinija12 = TextDrawCreate(-48.944549, 425.037994, "LD_SPAC:white");
	TextDrawLetterSize(LogoLinija12, 0.000000, 0.000000);
	TextDrawTextSize(LogoLinija12, 66.111114, 2.592590);
	TextDrawAlignment(LogoLinija12, 1);
	TextDrawColor(LogoLinija12, 833085439);
	TextDrawSetShadow(LogoLinija12, 0);
	TextDrawSetOutline(LogoLinija12, 0);
	TextDrawBackgroundColor(LogoLinija12, 529713663);
	TextDrawFont(LogoLinija12, 4);

	LogoLinija13 = TextDrawCreate(590.222106, 441.489807, "LD_SPAC:white");
	TextDrawLetterSize(LogoLinija13, 0.000000, 0.000000);
	TextDrawTextSize(LogoLinija13, 66.111114, 2.592590);
	TextDrawAlignment(LogoLinija13, 1);
	TextDrawColor(LogoLinija13, 833085439);
	TextDrawSetShadow(LogoLinija13, 0);
	TextDrawSetOutline(LogoLinija13, 0);
	TextDrawBackgroundColor(LogoLinija13, 529713663);
	TextDrawFont(LogoLinija13, 4);

	LogoLinija14 = TextDrawCreate(598.055175, 437.615966, "LD_SPAC:white");
	TextDrawLetterSize(LogoLinija14, 0.000000, 0.000000);
	TextDrawTextSize(LogoLinija14, 66.111114, 2.592590);
	TextDrawAlignment(LogoLinija14, 1);
	TextDrawColor(LogoLinija14, 833085439);
	TextDrawSetShadow(LogoLinija14, 0);
	TextDrawSetOutline(LogoLinija14, 0);
	TextDrawBackgroundColor(LogoLinija14, 529713663);
	TextDrawFont(LogoLinija14, 4);

	LogoLinija15 = TextDrawCreate(604.777221, 433.119934, "LD_SPAC:white");
	TextDrawLetterSize(LogoLinija15, 0.000000, 0.000000);
	TextDrawTextSize(LogoLinija15, 66.111114, 2.592590);
	TextDrawAlignment(LogoLinija15, 1);
	TextDrawColor(LogoLinija15, 833085439);
	TextDrawSetShadow(LogoLinija15, 0);
	TextDrawSetOutline(LogoLinija15, 0);
	TextDrawBackgroundColor(LogoLinija15, 529713663);
	TextDrawFont(LogoLinija15, 4);

	LogoLinija16 = TextDrawCreate(610.832824, 429.229797, "LD_SPAC:white");
	TextDrawLetterSize(LogoLinija16, 0.000000, 0.000000);
	TextDrawTextSize(LogoLinija16, 66.111114, 2.592590);
	TextDrawAlignment(LogoLinija16, 1);
	TextDrawColor(LogoLinija16, 833085439);
	TextDrawSetShadow(LogoLinija16, 0);
	TextDrawSetOutline(LogoLinija16, 0);
	TextDrawBackgroundColor(LogoLinija16, 529713663);
	TextDrawFont(LogoLinija16, 4);

	LogoLinija17 = TextDrawCreate(617.815979, 424.916656, "LD_SPAC:white");
	TextDrawLetterSize(LogoLinija17, 0.000000, 0.000000);
	TextDrawTextSize(LogoLinija17, 66.111114, 2.592590);
	TextDrawAlignment(LogoLinija17, 1);
	TextDrawColor(LogoLinija17, 833085439);
	TextDrawSetShadow(LogoLinija17, 0);
	TextDrawSetOutline(LogoLinija17, 0);
	TextDrawBackgroundColor(LogoLinija17, 529713663);
	TextDrawFont(LogoLinija17, 4);

	LogoLinija18 = TextDrawCreate(80.888916, 423.785095, "San Marino");
	TextDrawLetterSize(LogoLinija18, 0.393889, 1.273333);
	TextDrawAlignment(LogoLinija18, 2);
	TextDrawColor(LogoLinija18, 833085439);
	TextDrawSetShadow(LogoLinija18, 0);
	TextDrawSetOutline(LogoLinija18, 0);
	TextDrawBackgroundColor(LogoLinija18, 51);
	TextDrawFont(LogoLinija18, 1);
	TextDrawSetProportional(LogoLinija18, 1);

	LogoLinija19 = TextDrawCreate(79.888961, 433.236877, "Community");
	TextDrawLetterSize(LogoLinija19, 0.245555, 0.791110);
	TextDrawAlignment(LogoLinija19, 2);
	TextDrawColor(LogoLinija19, -1);
	TextDrawSetShadow(LogoLinija19, 0);
	TextDrawSetOutline(LogoLinija19, 0);
	TextDrawBackgroundColor(LogoLinija19, 51);
	TextDrawFont(LogoLinija19, 2);
	TextDrawSetProportional(LogoLinija19, 1);

	ServerPoruka1 = TextDrawCreate(150.222183, 429.074127, "UKOLIKO VAM JE POTREBNA POMOC ZATRAZITE JE NA /ASKQ");
	TextDrawLetterSize(ServerPoruka1, 0.210222, 1.154591);
	TextDrawAlignment(ServerPoruka1, 1);
	TextDrawColor(ServerPoruka1, -1);
	TextDrawSetShadow(ServerPoruka1, 0);
	TextDrawSetOutline(ServerPoruka1, 0);
	TextDrawBackgroundColor(ServerPoruka1, 51);
	TextDrawFont(ServerPoruka1, 2);
	TextDrawSetProportional(ServerPoruka1, 1);

	WWLogo0 = TextDrawCreate(535.666564, 2.385143, "S");
	TextDrawLetterSize(WWLogo0, 0.568777, 1.972815);
	TextDrawAlignment(WWLogo0, 1);
	TextDrawColor(WWLogo0, 833085439);
	TextDrawSetShadow(WWLogo0, 0);
	TextDrawSetOutline(WWLogo0, 0);
	TextDrawBackgroundColor(WWLogo0, 51);
	TextDrawFont(WWLogo0, 2);
	TextDrawSetProportional(WWLogo0, 1);

	WWLogo1 = TextDrawCreate(549.222534, 8.814768, "an");
	TextDrawLetterSize(WWLogo1, 0.392166, 1.120889);
	TextDrawAlignment(WWLogo1, 1);
	TextDrawColor(WWLogo1, -1);
	TextDrawSetShadow(WWLogo1, 0);
	TextDrawSetOutline(WWLogo1, 0);
	TextDrawBackgroundColor(WWLogo1, 51);
	TextDrawFont(WWLogo1, 2);
	TextDrawSetProportional(WWLogo1, 1);

	WWLogo2 = TextDrawCreate(567.389099, 13.481498, "M");
	TextDrawLetterSize(WWLogo2, 0.568777, 1.972815);
	TextDrawAlignment(WWLogo2, 1);
	TextDrawColor(WWLogo2, 833085439);
	TextDrawSetShadow(WWLogo2, 0);
	TextDrawSetOutline(WWLogo2, 0);
	TextDrawBackgroundColor(WWLogo2, 51);
	TextDrawFont(WWLogo2, 2);
	TextDrawSetProportional(WWLogo2, 1);

	WWLogo3 = TextDrawCreate(583.222595, 19.822175, "arino");
	TextDrawLetterSize(WWLogo3, 0.392166, 1.120889);
	TextDrawAlignment(WWLogo3, 1);
	TextDrawColor(WWLogo3, -1);
	TextDrawSetShadow(WWLogo3, 0);
	TextDrawSetOutline(WWLogo3, 0);
	TextDrawBackgroundColor(WWLogo3, 51);
	TextDrawFont(WWLogo3, 2);
	TextDrawSetProportional(WWLogo3, 1);
	
	WWLogo4 = TextDrawCreate(577.833435, 11.459233, "]");
	TextDrawLetterSize(WWLogo4, 0.242055, 0.429703);
	TextDrawAlignment(WWLogo4, 1);
	TextDrawColor(WWLogo4, -1);
	TextDrawSetShadow(WWLogo4, -1);
	TextDrawSetOutline(WWLogo4, 0);
	TextDrawBackgroundColor(WWLogo4, 51);
	TextDrawFont(WWLogo4, 2);
	TextDrawSetProportional(WWLogo4, 1);

	WWLogo5 = TextDrawCreate(582.722229, 4.681456, "]");
	TextDrawLetterSize(WWLogo5, 0.242055, 0.429703);
	TextDrawAlignment(WWLogo5, 1);
	TextDrawColor(WWLogo5, 833085439);
	TextDrawSetShadow(WWLogo5, -1);
	TextDrawSetOutline(WWLogo5, 0);
	TextDrawBackgroundColor(WWLogo5, 51);
	TextDrawFont(WWLogo5, 2);
	TextDrawSetProportional(WWLogo5, 1);

	WWLogo6 = TextDrawCreate(567.611022, 29.762947, "sanmarino-hq");
	TextDrawLetterSize(WWLogo6, 0.159999, 0.925925);
	TextDrawAlignment(WWLogo6, 1);
	TextDrawColor(WWLogo6, 833085439);
	TextDrawSetShadow(WWLogo6, 0);
	TextDrawSetOutline(WWLogo6, 0);
	TextDrawBackgroundColor(WWLogo6, 51);
	TextDrawFont(WWLogo6, 2);
	TextDrawSetProportional(WWLogo6, 1);

	WWLogo7 = TextDrawCreate(549.222473, 29.881471, "www.                          .com");
	TextDrawLetterSize(WWLogo7, 0.159999, 0.925925);
	TextDrawAlignment(WWLogo7, 1);
	TextDrawColor(WWLogo7, -1);
	TextDrawSetShadow(WWLogo7, 0);
	TextDrawSetOutline(WWLogo7, 0);
	TextDrawBackgroundColor(WWLogo7, 51);
	TextDrawFont(WWLogo7, 2);
	TextDrawSetProportional(WWLogo7, 1);

	WWLogo8 = TextDrawCreate(606.110717, 4.592569, "]");
	TextDrawLetterSize(WWLogo8, 0.242055, 0.429703);
	TextDrawAlignment(WWLogo8, 1);
	TextDrawColor(WWLogo8, 833085439);
	TextDrawSetShadow(WWLogo8, -1);
	TextDrawSetOutline(WWLogo8, 0);
	TextDrawBackgroundColor(WWLogo8, 51);
	TextDrawFont(WWLogo8, 2);
	TextDrawSetProportional(WWLogo8, 1);

	WWLogo9 = TextDrawCreate(609.499206, 12.096270, "]");
	TextDrawLetterSize(WWLogo9, 0.242055, 0.429703);
	TextDrawAlignment(WWLogo9, 1);
	TextDrawColor(WWLogo9, -1);
	TextDrawSetShadow(WWLogo9, -1);
	TextDrawSetOutline(WWLogo9, 0);
	TextDrawBackgroundColor(WWLogo9, 51);
	TextDrawFont(WWLogo9, 2);
	TextDrawSetProportional(WWLogo9, 1);
	
	WWLogo10 = TextDrawCreate(589.999755, 9.540776, "V  .");
	TextDrawLetterSize(WWLogo10, 0.198777, 0.811334);
	TextDrawAlignment(WWLogo10, 1);
	TextDrawColor(WWLogo10, -1);
	TextDrawSetShadow(WWLogo10, 0);
	TextDrawSetOutline(WWLogo10, 0);
	TextDrawBackgroundColor(WWLogo10, 51);
	TextDrawFont(WWLogo10, 1);
	TextDrawSetProportional(WWLogo10, 1);

	WWLogo11 = TextDrawCreate(595.777465, 9.607445, "0 1");
	TextDrawLetterSize(WWLogo11, 0.198777, 0.811334);
	TextDrawAlignment(WWLogo11, 1);
	TextDrawColor(WWLogo11, 833085439);
	TextDrawSetShadow(WWLogo11, 0);
	TextDrawSetOutline(WWLogo11, 0);
	TextDrawBackgroundColor(WWLogo11, 51);
	TextDrawFont(WWLogo11, 1);
	TextDrawSetProportional(WWLogo11, 1);
}