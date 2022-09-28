
/* ----------------------------------------------------------------------------
Function: gie_db_fnc_autoSave

Description:
    Save the current game every hour

Parameters:
    None

Returns:

Examples:
    (begin example)
        [] call gie_db_fnc_autoSave;
    (end)

Author:
    Gavin "Morbakos" Sertix

---------------------------------------------------------------------------- */

if (!isServer) exitWith {};

private _nextSaveTime = 0;

while {true} do {
    waitUntil { sleep 1; _nextSaveTime > time };
	[] call btc_db_fnc_save;
    _nextSaveTime = time + 60*60;
};