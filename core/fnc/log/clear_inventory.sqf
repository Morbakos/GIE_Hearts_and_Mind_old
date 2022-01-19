
/* ----------------------------------------------------------------------------
Function: gie_fnc_log_clear_inventory

Description:
    Fill me when you edit me !

Parameters:
    _object - [Object]

Returns:

Examples:
    (begin example)
        _result = [_vehicle] call gie_fnc_log_clear_inventory;
    (end)

Author:
    Gavin "Morbakos" Sertix

---------------------------------------------------------------------------- */

params [
    ["_object", objNull, [objNull]]
];

private _array = (nearestObjects [_object, ["LandVehicle", "Air", "Ship"], 10]) select {!(
    _x isKindOf "ACE_friesBase" OR
    _x isKindOf "ace_fastroping_helper"
)};

if (_array isEqualTo []) exitWith {"Aucun véhicule" call CBA_fnc_notify;};

clearMagazineCargoGlobal (_array select 0);
clearItemCargoGlobal (_array select 0);
clearWeaponCargoGlobal (_array select 0);
clearBackpackCargoGlobal (_array select 0);

"Inventaire vidé" call CBA_fnc_notify;