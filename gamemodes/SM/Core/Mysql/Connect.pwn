#include <YSI\y_hooks>

new handle,rows,fields;

hook OnGameModeInit()
{
	print("\n[OnGameModeInit] Initialising 'Mysql/Connect'...");
	handle = mysql_connect(mysql_host, mysql_user, mysql_database, mysql_password, .pool_size = 0);

	if(handle && mysql_errno(handle) == 0)
	{
		printf("[MYSQL]: Connection to database (%s) was established!", mysql_database);
	}
	else
	{
		printf("[MYSQL]: Connection to database (%s) failed!", mysql_database);
		SendRconCommand("exit");
	}
	mysql_log(LOG_DEBUG | LOG_ERROR | LOG_WARNING,LOG_TYPE_HTML);
}

hook OnGameModeExit()
{
	mysql_close();
}