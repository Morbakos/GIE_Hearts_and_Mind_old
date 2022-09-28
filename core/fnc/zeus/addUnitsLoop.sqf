
/* ----------------------------------------------------------------------------
Function: gie_zeus_fnc_addUnitsLoop

Description:
    Save the current game every hour

Parameters:
    None

Returns:

Examples:
    (begin example)
        [] spawn gie_zeus_fnc_addUnitsLoop;
    (end)

Author:
    Gavin "Morbakos" Sertix

---------------------------------------------------------------------------- */

if (!isServer) then {
	[[], gie_zeus_fnc_addUnitsLoop] remoteExec ["spawn", 2];
};

private _nextAddingTime = 0;
while {true} do {
    waitUntil { sleep 1; _nextAddingTime > time };
	{ 
		_x addCuratorEditableObjects [vehicles, true]; 
		_x addCuratorEditableObjects [allUnits, true]; 
		_x addCuratorEditableObjects [allDead, true]; 
		_x addCuratorEditableObjects [allMissionObjects "", true]; 
	} forEach allCurators;
    _nextAddingTime = time + 15;
};