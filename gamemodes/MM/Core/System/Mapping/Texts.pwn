#include <YSI\y_hooks>

hook OnGameModeInit()
{
	print("\n[OnGameModeInit] Initialising 'System/Mapping/Texts'...");
}

new Object[MAX_PLAYERS],
	Text[MAX_PLAYERS][128],
	Size[MAX_PLAYERS] = 50,
	Index[MAX_PLAYERS] = 0,
	UseBold[MAX_PLAYERS] = 0,
	TextAlign[MAX_PLAYERS] = 1,
	FontName[MAX_PLAYERS][128],
	FontSize[MAX_PLAYERS] = 24,
	TextColor[MAX_PLAYERS],
	BackgColor[MAX_PLAYERS],
	OName[MAX_PLAYERS][30],
	ObjectID[MAX_PLAYERS] = 19353,
	Float:Pos[4], Float:Rot[3];
	new bool:ObjectType[MAX_PLAYERS] = false,
	bool:CreatingTextO[MAX_PLAYERS] = false;

isNumeric(const string[])
{
	new length=strlen(string);
	if (length==0) return false;
	for (new i = 0; i < length; i++)
	{
		if ((string[i] > '9' || string[i] < '0' && string[i]!='-' && string[i]!='+') || (string[i]=='-' && i!=0) || (string[i]=='+' && i!=0)) return false;
	}
	if (length==1 && (string[0]=='-' || string[0]=='+')) return false;
	return true;
}