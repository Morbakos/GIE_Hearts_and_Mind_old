
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

private _nextSaveTime = 0;

while {true} do {
    waitUntil { sleep 1; _nextSaveTime > time };
	[] call btc_fnc_db_save;
    _nextSaveTime = time + 60*60;
};