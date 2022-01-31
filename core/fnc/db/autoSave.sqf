
/* ----------------------------------------------------------------------------
Function: btc_fnc_db_autoSave

Description:
    Save the current game every hour

Parameters:
    None

Returns:

Examples:
    (begin example)
        [] call btc_fnc_db_autoSave;
    (end)

Author:
    Gavin "Morbakos" Sertix

---------------------------------------------------------------------------- */

if (!isServer) exitWith {};

while {true} do {
	sleep 60*60;
	[] call btc_fnc_db_save;
};